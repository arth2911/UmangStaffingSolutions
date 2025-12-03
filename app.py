import streamlit as st
import mysql.connector
import pandas as pd
from src.auth import check_login, show_logout_button
import datetime

# Page configuration
st.set_page_config(
    page_title="Umang Staffing Solutions - Employee Dashboard",
    page_icon="👔",
    layout="wide"
)

# Check login
check_login()


#itialize small session state flag for HR form
if 'show_add_hr' not in st.session_state:

    st.session_state['show_add_hr'] = False
# Database connection function
@st.cache_resource
def get_connection():
    """Create a MySQL database connection"""
    try:
        conn = mysql.connector.connect(
            host="localhost",
            user="root",
            password="",  # Empty password for XAMPP default
            database="Umang_staffing_db",
            port=3306
        )
        return conn
    except Exception as e:
        st.error(f"Database connection error: {e}")
        st.info("Make sure XAMPP MySQL is running!")
        return None

# Query execution function
def execute_query(conn, query, params=None):
    """Execute a query and return results as DataFrame"""
    try:
        if params:
            df = pd.read_sql_query(query, conn, params=params)
        else:
            df = pd.read_sql_query(query, conn)
        return df
    except Exception as e:
        st.error(f"Query error: {e}")
        return None

# Main app
def main():
    st.title("💼 Umang Staffing Solutions")
    st.write(f"Welcome back, **{st.session_state.employee_name}**! 👋")
    
    # Sidebar navigation
    with st.sidebar:
        st.header("📊 Employee Dashboard")
        
        # Show logout button
        show_logout_button()
        
        st.divider()
        st.header("Navigation")
        page = st.radio("Select Page:", [
            "Dashboard",
            "Clients",
            "Candidates", 
            "Jobs",
            "Placements",
            "HR",
            "Custom Query"
        ])
    
    # Get database connection
    conn = get_connection()
    if not conn:
        st.error("❌ Cannot connect to database. Make sure XAMPP MySQL is running!")
        st.stop()
    
    # Route to different pages
    if page == "Dashboard":
        show_dashboard(conn)
    elif page == "Clients":
        show_clients(conn)
    elif page == "Candidates":
        show_candidates(conn)
    elif page == "Jobs":
        show_jobs(conn)
    elif page == "Placements":
        show_placements(conn)
    elif page == "HR":
        show_hr(conn)
    elif page == "Custom Query":
        show_custom_query(conn)

def show_dashboard(conn):
    """Dashboard with key metrics"""
    st.header("📊 Dashboard Overview")
    
    col1, col2, col3, col4 = st.columns(4)
    
    # Total Clients
    clients_count = execute_query(conn, "SELECT COUNT(*) as count FROM Clients")
    col1.metric("Total Clients", clients_count['count'].iloc[0] if clients_count is not None else 0)
    
    # Total Candidates
    candidates_count = execute_query(conn, "SELECT COUNT(*) as count FROM Candidates")
    col2.metric("Total Candidates", candidates_count['count'].iloc[0] if candidates_count is not None else 0)
    
    # Active Jobs
    jobs_count = execute_query(conn, "SELECT COUNT(*) as count FROM JOBS WHERE IsOpen = 1")
    col3.metric("Active Jobs", jobs_count['count'].iloc[0] if jobs_count is not None else 0)
    
    # Total Placements
    placements_count = execute_query(conn, "SELECT COUNT(*) as count FROM PLACEMENTS")
    col4.metric("Total Placements", placements_count['count'].iloc[0] if placements_count is not None else 0)
    
    st.divider()
    
    # Recent activity
    col1, col2 = st.columns(2)
    
    with col1:
        st.subheader("Recent Job Postings")
        recent_jobs = execute_query(conn, """
            SELECT j.JobTitle, c.CompanyName, j.DatePosted, j.IsOpen 
            FROM JOBS j
            JOIN Clients c ON j.ClientID = c.ClientID
            ORDER BY j.DatePosted DESC 
            LIMIT 5
        """)
        if recent_jobs is not None and not recent_jobs.empty:
            st.dataframe(recent_jobs, use_container_width=True, hide_index=True)
        else:
            st.info("No recent jobs")
    
    with col2:
        st.subheader("Recent Placements")
        recent_placements = execute_query(conn, """
            SELECT p.PlacementID, p.StartDate, p.FinalPayRate,
                   c.FirstName, c.LastName, j.JobTitle
            FROM PLACEMENTS p
            JOIN Candidates c ON p.CandidateID = c.CandidateID
            JOIN JOBS j ON p.JobID = j.JobID
            ORDER BY p.StartDate DESC 
            LIMIT 5
        """)
        if recent_placements is not None and not recent_placements.empty:
            st.dataframe(recent_placements, use_container_width=True, hide_index=True)
        else:
            st.info("No recent placements")

def show_clients(conn):
    """Clients page"""
    st.header("🏢 Clients")
    
    # View selector
    view_type = st.selectbox("Select View:", ["All Clients", "Technology Clients"])
    
    if view_type == "All Clients":
        query = "SELECT * FROM Clients ORDER BY CompanyName"
    else:
        query = "SELECT * FROM vw_technologyclients ORDER BY CompanyName"
    
    df = execute_query(conn, query)
    
    if df is not None and not df.empty:
        st.dataframe(df, use_container_width=True, hide_index=True)
        
        # Download button
        csv = df.to_csv(index=False)
        st.download_button(
            label="📥 Download as CSV",
            data=csv,
            file_name="clients.csv",
            mime="text/csv"
        )
        
        st.metric("Total Clients", len(df))
    else:
        st.info("No clients found")

def show_candidates(conn):
    """Candidates page"""
    st.header("👥 Candidates")
    
    # Filters
    col1, col2 = st.columns(2)
    with col1:
        skill_filter = st.text_input("Filter by Skill:", "")
    with col2:
        st.write("")  # Placeholder for alignment
    
    # Build query with GROUP_CONCAT for MySQL
    query = """
        SELECT c.CandidateID, c.FirstName, c.LastName, c.Email, c.Phone, c.City, c.State,
               GROUP_CONCAT(s.SkillName SEPARATOR ', ') as skills
        FROM Candidates c
        LEFT JOIN CANDIDATE_SKILLS cs ON c.CandidateID = cs.CandidateID
        LEFT JOIN Skills s ON cs.SkillID = s.SkillID
    """
    
    conditions = []
    if skill_filter:
        conditions.append(f"s.SkillName LIKE '%{skill_filter}%'")
    
    if conditions:
        query += " WHERE " + " AND ".join(conditions)
    
    query += " GROUP BY c.CandidateID ORDER BY c.FirstName, c.LastName"
    
    df = execute_query(conn, query)
    
    if df is not None and not df.empty:
        st.dataframe(df, use_container_width=True, hide_index=True)
        st.metric("Total Candidates", len(df))
    else:
        st.info("No candidates found")
    
    st.divider()
    st.subheader("🗂️ Eligible Candidates")
    st.write("Shows candidates already added to ELIGIBLE_CANDIDATES with job, HR (if present), status and apply date.")
    
    # detect if ELIGIBLE_CANDIDATES has HR_ID column so we can LEFT JOIN HR if available
    try:
        col_check = execute_query(conn, """
            SELECT COUNT(*) AS cnt
            FROM information_schema.columns
            WHERE table_schema = DATABASE()
              AND table_name = 'ELIGIBLE_CANDIDATES'
              AND column_name = 'HR_ID'
        """)
        has_hr = bool(col_check['cnt'].iloc[0]) if col_check is not None else False
    except Exception:
        has_hr = False
    
    if has_hr:
        eligible_sql = """
            SELECT
                ec.CandidateID,
                CONCAT(c.FirstName, ' ', c.LastName) AS CandidateName,
                j.JobTitle,
                Clients.CompanyName as ClientName,
                CONCAT(h.FirstName, ' ', h.LastName) AS HRName,
                ec.ApplicationStatus,
                ec.ApplyDate
            FROM ELIGIBLE_CANDIDATES ec
            JOIN Candidates c ON ec.CandidateID = c.CandidateID
            JOIN JOBS j ON ec.JobID = j.JobID
            JOIN Clients ON j.ClientID = Clients.ClientID
            LEFT JOIN HR h ON ec.HR_ID = h.HR_ID
            ORDER BY ec.ApplyDate DESC, ec.ApplicationStatus
        """
    else:
        eligible_sql = """
            SELECT
                ec.CandidateID,
                CONCAT(c.FirstName, ' ', c.LastName) AS CandidateName,
                j.JobTitle,
                NULL AS HRName,
                ec.ApplicationStatus,
                ec.ApplyDate
            FROM ELIGIBLE_CANDIDATES ec
            JOIN Candidates c ON ec.CandidateID = c.CandidateID
            JOIN JOBS j ON ec.JobID = j.JobID
            ORDER BY ec.ApplyDate DESC, ec.ApplicationStatus
        """
    
    eligible_df = execute_query(conn, eligible_sql)
    if eligible_df is not None and not eligible_df.empty:
        # show human-friendly column names
        eligible_df = eligible_df.rename(columns={
            'CandidateID': 'Candidate ID',
            'CandidateName': 'Candidate',
            'JobTitle': 'Job Title',
            'HRName': 'HR',
            'ClientName': 'Client',
            'ApplicationStatus': 'Status',
            'ApplyDate': 'Apply Date'
        })
        st.dataframe(eligible_df, use_container_width=True, hide_index=True)
        
        csv = eligible_df.to_csv(index=False)
        st.download_button(
            label="📥 Download Eligible Candidates",
            data=csv,
            file_name="eligible_candidates.csv",
            mime="text/csv"
        )
        st.metric("Total Eligible Records", len(eligible_df))
    else:
        st.info("No eligible candidate records found")

def show_jobs(conn):
    """Jobs page"""
    st.header("💼 Job Postings")
    
    # Create tabs for different views
    tab1, tab2 = st.tabs(["Job Listings", "Find Matching Candidates"])
    
    with tab1:
        # Filters
        col1, col2, col3 = st.columns(3)
        with col1:
            isopen_filter = st.selectbox("Status:", ["All", "Open", "Closed"])
        with col2:
            job_type_filter = st.selectbox("Job Type:", ["All", "Full-Time", "Contract", "Temp-to-Hire"])
        with col3:
            search_term = st.text_input("Search Job Title:", "")
        
        # Build query
        query = "SELECT * FROM JOBS WHERE 1=1"
        
        if isopen_filter == "Open":
            query += f" AND IsOpen = 1"
        elif isopen_filter == "Closed":
            query += f" AND IsOpen = 0"
        if job_type_filter != "All":
            query += f" AND JobType = '{job_type_filter}'"
        if search_term:
            query += f" AND JobTitle LIKE '%{search_term}%'"
        
        query += " ORDER BY DatePosted DESC"
        
        df = execute_query(conn, query)
        
        if df is not None and not df.empty:
            st.dataframe(df, use_container_width=True, hide_index=True)
            
            # Statistics
            col1, col2, col3 = st.columns(3)
            col1.metric("Total Jobs", len(df))
            col2.metric("Open Positions", len(df[df['IsOpen'] == 1]) if 'IsOpen' in df.columns else 0)
            col3.metric("Avg Pay Rate", f"${df['PayRate'].mean():,.2f}" if 'PayRate' in df.columns else "N/A")
        else:
            st.info("No jobs found")
    
    with tab2:
        st.subheader("🔍 Find Matching Candidates")
        st.write("Find candidates whose skills match job requirements")
        
        # Get list of jobs for selection
        jobs_query = "SELECT JobID, JobTitle, CompanyName FROM JOBS j JOIN Clients c ON j.ClientID = c.ClientID WHERE j.IsOpen = 1 ORDER BY j.DatePosted DESC"
        jobs_df = execute_query(conn, jobs_query)
        
        if jobs_df is not None and not jobs_df.empty:
            job_options = {f"{row['JobTitle']} - {row['CompanyName']}": row['JobID'] for _, row in jobs_df.iterrows()}
            
            col1, col2 = st.columns(2)
            with col1:
                selected_job = st.selectbox("Select Job:", list(job_options.keys()))
            with col2:
                min_match = st.slider("Minimum Match %:", 0, 100, 50)
            
            selected_job_id = job_options[selected_job]
            
            if st.button("Find Matching Candidates", type="primary", use_container_width=True):
                matching_candidates = find_matching_candidates(conn, selected_job_id, min_match)
                
                if matching_candidates is not None and not matching_candidates.empty:
                    st.success(f"Found {len(matching_candidates)} matching candidates")
                    
                    # Automatic insert (no button). Run the stored procedure once per (job,min_match) per session.
                    added_key = f"matches_added_{selected_job_id}_{min_match}"
                    if not st.session_state.get(added_key, False):
                        try:
                            cur = conn.cursor()
                            # call stored procedure that inserts matching candidates for the job
                            cur.callproc('sp_insert_matching_candidates_for_job', [int(selected_job_id), int(min_match)])
                            conn.commit()
                            cur.close()
                            st.success("Matching candidates inserted into ELIGIBLE_CANDIDATES (duplicates skipped by the procedure).")
                            st.session_state[added_key] = True
                        except mysql.connector.Error as db_err:
                            st.error(f"Database error inserting eligible candidates: {db_err}")
                        except Exception as e:
                            st.error(f"Unexpected error: {e}")
                    else:
                        st.info("Matching candidates already inserted for this job/threshold in this session.")
                    
                    # Display list (read-only)
                    for idx, candidate in matching_candidates.iterrows():
                        with st.container(border=True):
                            col1, col2, col3 = st.columns([2, 1, 1])
                            
                            with col1:
                                st.markdown(f"**👤 {candidate['CandidateName']}**")
                                st.caption(f"📧 {candidate.get('Email','')}")
                                st.caption(f"📞 {candidate.get('Phone','')}")
                                st.caption(f"📍 {candidate.get('City','')}, {candidate.get('State','')}")
                            
                            with col2:
                                st.metric("Match %", f"{candidate.get('MatchPercentage', 0)}%")
                                st.metric("Skills", f"{candidate.get('MatchingSkills', 0)}/{candidate.get('RequiredSkills', 0)}")
                            
                            with col3:
                                if candidate.get('Skills') and candidate['Skills'] != 'No matching skills':
                                    st.write("**Skills:**")
                                    st.caption(candidate['Skills'])
                    
                    # Download option
                    csv = matching_candidates.to_csv(index=False)
                    st.download_button(
                        label="📥 Download Results",
                        data=csv,
                        file_name="matching_candidates.csv",
                        mime="text/csv"
                    )
                else:
                    st.warning("No matching candidates found with the specified criteria")
        else:
            st.info("No open jobs available")

def find_matching_candidates(conn, job_id, min_match_percentage):
    """Call stored procedure to find matching candidates"""
    try:
        cursor = conn.cursor(dictionary=True)
        cursor.callproc('sp_FindMatchingCandidates_v2', [job_id, min_match_percentage])
        
        # collect rows from any result sets returned by the procedure
        results = []
        for result in cursor.stored_results():
            rows = result.fetchall()
            if rows:
                results.extend(rows)
        cursor.close()
        
        if results:
            return pd.DataFrame(results)
        else:
            return None
    except Exception as e:
        st.error(f"Error finding matching candidates: {e}")
        return None

def upsert_eligible_candidate(conn, candidate_id, job_id, status):
    """Recommend/Reject functionality removed — placeholder kept to avoid import errors."""
    return False, "Recommend/Reject functionality removed from UI"

def show_placements(conn):
    """Placements page"""
    st.header("✅ Placements")
    
    # View selector
    view_type = st.selectbox("Select View:", ["All Placements", "Placement History"])
    
    if view_type == "All Placements":
        query = """
            SELECT p.PlacementID, p.StartDate, p.HireDate, p.FinalPayRate,
                   c.FirstName, c.LastName, j.JobTitle, cl.CompanyName
            FROM PLACEMENTS p
            JOIN Candidates c ON p.CandidateID = c.CandidateID
            JOIN JOBS j ON p.JobID = j.JobID
            JOIN Clients cl ON j.ClientID = cl.ClientID
            ORDER BY p.StartDate DESC
        """
    else:
        query = "SELECT * FROM vw_candidateplacementhistory ORDER BY StartDate DESC"
    
    df = execute_query(conn, query)
    
    if df is not None and not df.empty:
        st.dataframe(df, use_container_width=True, hide_index=True)
        
        # Statistics
        col1, col2, col3 = st.columns(3)
        col1.metric("Total Placements", len(df))
        if 'FinalPayRate' in df.columns:
            col2.metric("Avg Pay Rate", f"${df['FinalPayRate'].mean():,.2f}")
            col3.metric("Total Paid", f"${df['FinalPayRate'].sum():,.2f}")
    else:
        st.info("No placements found")

# Show HR page
def show_hr(conn):
    """HR list page with Add New HR button"""
    st.header("👔 HR / Recruiters")

    # Toggle to form
    # col1, col2 = st.columns([1, 3])
    # with col1:
    #     if st.button("➕ Add New HR"):
    #         st.session_state['show_add_hr'] = True
    # with col2:
    #     st.write("")  # alignment
    
    if st.session_state.get('show_add_hr'):
        show_add_hr(conn)
        return

    # List HR records
    df = execute_query(conn, "SELECT HR_ID, FirstName, LastName, Email, Clients.CompanyName FROM HR JOIN Clients ON HR.ClientID = Clients.ClientID ORDER BY LastName, FirstName")
    if df is not None and not df.empty:
        st.dataframe(df, use_container_width=True, hide_index=True)
        csv = df.to_csv(index=False)
        st.download_button(
            label="📥 Download HR List",
            data=csv,
            file_name="hr_list.csv",
            mime="text/csv"
        )
        st.metric("Total HR", len(df))
    else:
        st.info("No HR records found")

# def show_add_hr(conn):
#     """Form to add a new HR record"""
#     st.header("➕ Add New HR")

#     with st.form("add_hr_form"):
#         col1, col2 = st.columns(2)
#         with col1:
#             first_name = st.text_input("First Name", "")
#             last_name = st.text_input("Last Name", "")
#             role = st.text_input("Role / Title", "")
#         with col2:
#             email = st.text_input("Email", "")
#             phone = st.text_input("Phone", "")

#         submit = st.form_submit_button("Create HR")

#     if st.button("Cancel"):
#         st.session_state['show_add_hr'] = False
#         st.experimental_rerun()

#     if submit:
#         # Basic validation
#         if not first_name.strip() or not last_name.strip() or not email.strip():
#             st.warning("Please provide First Name, Last Name and Email.")
#             return

#         ok = add_hr_to_db(conn, first_name.strip(), last_name.strip(), email.strip(), phone.strip(), role.strip())
#         if ok:
#             st.success("HR record created successfully.")
#             st.session_state['show_add_hr'] = False
#             # refresh page to show updated list
#             st.experimental_rerun()
#         else:
#             st.error("Failed to create HR record. See error message above.")


def show_custom_query(conn):
    """Custom SQL query page"""
    st.header("🔍 Custom Query")
    
    st.info("Write your own SQL queries to explore the database")
    
    # Query input
    query = st.text_area("Enter SQL Query:", height=150, 
                        placeholder="SELECT * FROM Clients LIMIT 10")
    
    if st.button("Execute Query", type="primary"):
        if query.strip():
            df = execute_query(conn, query)
            
            if df is not None:
                st.success(f"Query executed successfully! Returned {len(df)} rows")
                st.dataframe(df, use_container_width=True, hide_index=True)
                
                # Download option
                csv = df.to_csv(index=False)
                st.download_button(
                    label="📥 Download Results",
                    data=csv,
                    file_name="query_results.csv",
                    mime="text/csv"
                )
        else:
            st.warning("Please enter a query")
    
    # Sample queries
    with st.expander("📝 Sample Queries"):
        st.code("""
-- Get top 10 candidates with most skills
SELECT c.first_name, c.last_name, COUNT(cs.skill_id) as skill_count
FROM Candidates c
JOIN CANDIDATE_SKILLS cs ON c.candidate_id = cs.candidate_id
GROUP BY c.candidate_id
ORDER BY skill_count DESC
LIMIT 10;

-- Get active job applications
SELECT * FROM vw_activejobapplications;

-- Get clients by industry
SELECT industry, COUNT(*) as client_count
FROM Clients
GROUP BY industry
ORDER BY client_count DESC;

-- Show all tables
SHOW TABLES;
        """)

if __name__ == "__main__":
    main()