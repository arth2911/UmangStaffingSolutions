import streamlit as st
import mysql.connector
import pandas as pd
from src.candidate_auth import check_candidate_login, show_candidate_logout_button, get_connection

# Page configuration
st.set_page_config(
    page_title="Candidate Portal - Umang Staffing Solutions",
    page_icon="👤",
    layout="wide"
)

# Check candidate login
check_candidate_login()

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

def execute_update(conn, query, params=None):
    """Execute an insert/update query"""
    try:
        cursor = conn.cursor()
        cursor.execute(query, params if params else ())
        conn.commit()
        cursor.close()
        return True
    except Exception as e:
        st.error(f"Error: {e}")
        return False

# Main app
def main():
    st.title("💼 Welcome to Candidate Portal")
    st.write(f"Hello, **{st.session_state.candidate_name}**! 👋")
    
    # Sidebar navigation
    with st.sidebar:
        st.header("📋 Menu")
        
        # Show logout button
        show_candidate_logout_button()
        
        st.divider()
        st.header("Navigation")
        page = st.radio("Select Option:", [
            "Dashboard",
            "View Active Jobs",
            "My Skills",
            "Update Resume",
            # "Apply for Jobs",
            "My Applications"
        ])
    
    # Get database connection
    conn = get_connection()
    if not conn:
        st.error("❌ Cannot connect to database. Make sure XAMPP MySQL is running!")
        st.stop()
    
    # Route to different pages
    if page == "Dashboard":
        show_dashboard(conn)
    elif page == "View Active Jobs":
        show_active_jobs(conn)
    elif page == "My Skills":
        show_my_skills(conn)
    elif page == "Update Resume":
        show_update_resume(conn)
    elif page == "Apply for Jobs":
        show_apply_for_jobs(conn)
    elif page == "My Applications":
        show_my_applications(conn)

def show_dashboard(conn):
    """Candidate dashboard"""
    st.header("📊 Your Dashboard")
    
    col1, col2, col3, col4 = st.columns(4)
    
    # Active jobs
    active_jobs = execute_query(conn, "SELECT COUNT(*) as count FROM JOBS WHERE IsOpen = 1")
    col1.metric("🔴 Active Jobs", active_jobs['count'].iloc[0] if active_jobs is not None else 0)
    
    # My applications
    my_apps = execute_query(conn, 
        "SELECT COUNT(*) as count FROM vw_activejobapplications WHERE CandidateID = %s",
        (st.session_state.candidate_id,))
    col2.metric("📝 My Applications", my_apps['count'].iloc[0] if my_apps is not None else 0)
    
    # My skills
    my_skills = execute_query(conn,
        "SELECT COUNT(*) as count FROM CANDIDATE_SKILLS WHERE CandidateID = %s",
        (st.session_state.candidate_id,))
    col3.metric("⚡ My Skills", my_skills['count'].iloc[0] if my_skills is not None else 0)
    
    # Profile completion
    candidate_data = execute_query(conn,
        "SELECT ResumeURL FROM Candidates WHERE CandidateID = %s",
        (st.session_state.candidate_id,))
    resume_status = "✅ Complete" if candidate_data is not None and pd.notna(candidate_data['ResumeURL'].iloc[0]) else "⚠️ Incomplete"
    col4.metric("📄 Resume", resume_status)
    
    st.divider()
    
    # Recent job postings
    st.subheader("🔥 Recently Posted Jobs")
    recent_jobs = execute_query(conn, """
        SELECT j.JobID, j.JobTitle, c.CompanyName, j.JobType, j.DatePosted, j.PayRate
        FROM JOBS j
        JOIN Clients c ON j.ClientID = c.ClientID
        WHERE j.IsOpen = 1
        ORDER BY j.DatePosted DESC
        LIMIT 5
    """)
    
    if recent_jobs is not None and not recent_jobs.empty:
        st.dataframe(recent_jobs, use_container_width=True, hide_index=True)
    else:
        st.info("No jobs available at this moment")

def show_active_jobs(conn):
    """View all active job postings"""
    st.header("🔴 Active Job Postings")
    
    # Filters
    col1, col2 = st.columns(2)
    with col1:
        job_type_filter = st.selectbox("Filter by Job Type:", 
            ["All", "Full-Time", "Contract", "Temp-to-Hire"])
    with col2:
        search_term = st.text_input("Search Job Title:")
    
    # Build query
    query = """
        SELECT j.JobID, j.JobTitle, c.CompanyName, j.JobType, j.DatePosted, 
               j.PayRate, j.JobDescription
        FROM JOBS j
        JOIN Clients c ON j.ClientID = c.ClientID
        WHERE j.IsOpen = 1
    """
    
    conditions = []
    if job_type_filter != "All":
        conditions.append(f"j.JobType = '{job_type_filter}'")
    if search_term:
        conditions.append(f"j.JobTitle LIKE '%{search_term}%'")
    
    if conditions:
        query += " AND " + " AND ".join(conditions)
    
    query += " ORDER BY j.DatePosted DESC"
    
    df = execute_query(conn, query)
    
    if df is not None and not df.empty:
        st.dataframe(df, use_container_width=True, hide_index=True)
        st.metric("Total Active Jobs", len(df))
    else:
        st.info("No jobs found matching your criteria")

def show_my_skills(conn):
    """Show and manage candidate's skills"""
    st.header("⚡ My Skills")
    
    # Get existing skills
    my_skills = execute_query(conn, """
        SELECT s.SkillName, cs.ProficiencyLevel
        FROM CANDIDATE_SKILLS cs
        JOIN Skills s ON cs.SkillID = s.SkillID
        WHERE cs.CandidateID = %s
        ORDER BY s.SkillName
    """, (st.session_state.candidate_id,))
    
    if my_skills is not None and not my_skills.empty:
        st.subheader("Your Current Skills")
        st.dataframe(my_skills, use_container_width=True, hide_index=True)
    else:
        st.info("You haven't added any skills yet")
    
    st.divider()
    
    # Add new skills
    st.subheader("➕ Add Skills")
    
    # Get all available skills
    all_skills = execute_query(conn, "SELECT SkillID, SkillName FROM Skills ORDER BY SkillName")
    
    if all_skills is not None and not all_skills.empty:
        skill_options = {row['SkillName']: row['SkillID'] for _, row in all_skills.iterrows()}
        
        col1, col2 = st.columns(2)
        with col1:
            selected_skill = st.selectbox("Select a Skill:", options=list(skill_options.keys()))
        with col2:
            proficiency = st.selectbox("Proficiency Level:", ["Beginner", "Intermediate", "Expert"])
        
        if st.button("Add Skill", type="primary"):
            skill_id = skill_options[selected_skill]
            
            # Check if skill already exists
            existing = execute_query(conn,
                "SELECT * FROM CANDIDATE_SKILLS WHERE CandidateID = %s AND SkillID = %s",
                (st.session_state.candidate_id, skill_id))
            
            if existing is not None and not existing.empty:
                st.warning("You already have this skill. Update it instead.")
            else:
                if execute_update(conn,
                    "INSERT INTO CANDIDATE_SKILLS (CandidateID, SkillID, ProficiencyLevel) VALUES (%s, %s, %s)",
                    (st.session_state.candidate_id, skill_id, proficiency)):
                    st.success(f"✅ Added {selected_skill} as {proficiency}")
                    st.rerun()

def show_update_resume(conn):
    """Update candidate's resume URL"""
    st.header("📄 Update Resume")
    
    # Get current resume
    current = execute_query(conn,
        "SELECT ResumeURL FROM Candidates WHERE CandidateID = %s",
        (st.session_state.candidate_id,))
    
    if current is not None and not current.empty:
        current_url = current['ResumeURL'].iloc[0]
        st.info(f"📌 Current Resume URL: {current_url if current_url else 'Not set'}")
    
    st.divider()
    
    new_resume_url = st.text_input("Enter new Resume URL:", 
        placeholder="https://your-storage.com/your-resume.pdf",
        value=current['ResumeURL'].iloc[0] if current is not None and not current.empty else "")
    
    if st.button("Update Resume", type="primary", use_container_width=True):
        if new_resume_url:
            if execute_update(conn,
                "UPDATE Candidates SET ResumeURL = %s WHERE CandidateID = %s",
                (new_resume_url, st.session_state.candidate_id)):
                st.success("✅ Resume URL updated successfully!")
                st.session_state.candidate_data['ResumeURL'] = new_resume_url
        else:
            st.warning("Please enter a resume URL")

# def show_apply_for_jobs(conn):
#     """Apply for jobs"""
#     st.header("💼 Apply for Jobs")
    
#     # Get all open jobs
#     jobs = execute_query(conn, """
#         SELECT j.JobID, j.JobTitle, c.CompanyName, j.JobType, j.PayRate
#         FROM JOBS j
#         JOIN Clients c ON j.ClientID = c.ClientID
#         WHERE j.IsOpen = 1
#         ORDER BY j.DatePosted DESC
#     """)
    
#     if jobs is not None and not jobs.empty:
#         job_options = {f"{row['JobTitle']} - {row['CompanyName']} (${row['PayRate']:,.2f})": row['JobID'] 
#                       for _, row in jobs.iterrows()}
        
#         selected_job = st.selectbox("Select a Job to Apply:", options=list(job_options.keys()))
#         job_id = job_options[selected_job]
        
#         st.info("✅ Your application will be submitted with your current profile")
        
#         if st.button("Submit Application", type="primary", use_container_width=True):
#             # Check if already applied
#             existing = execute_query(conn,
#                 "SELECT * FROM vw_activejobapplications WHERE CandidateID = %s AND JobID = %s",
#                 (st.session_state.candidate_id, job_id))
            
#             if existing is not None and not existing.empty:
#                 st.warning("⚠️ You have already applied for this job")
#             else:
#                 # Note: vw_activejobapplications is a view, so we need a table for applications
#                 # Assuming there's a way to track applications (may need to create this)
#                 st.success("✅ Application submitted successfully!")
#                 st.balloons()
#     else:
#         st.info("No active jobs available at this moment")

def show_my_applications(conn):
    """View application status"""
    st.header("📝 My Applications")
    
    applications = execute_query(conn, """
        SELECT JobTitle, CompanyName, ApplicationStatus
        FROM vw_activejobapplications
        WHERE CandidateID = %s
        ORDER BY ApplicationStatus DESC
    """, (st.session_state.candidate_id,))
    
    if applications is not None and not applications.empty:
        st.dataframe(applications, use_container_width=True, hide_index=True)
        
        # Statistics
        col1, col2, col3 = st.columns(3)
        total = len(applications)
        pending = len(applications[applications['ApplicationStatus'] == 'Pending']) if 'ApplicationStatus' in applications.columns else 0
        accepted = len(applications[applications['ApplicationStatus'] == 'Accepted']) if 'ApplicationStatus' in applications.columns else 0
        
        col1.metric("Total Applications", total)
        col2.metric("Pending", pending)
        col3.metric("Accepted", accepted)
    else:
        st.info("No Applications yet")

if __name__ == "__main__":
    main()
