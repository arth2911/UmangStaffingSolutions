import streamlit as st
import mysql.connector
from mysql.connector import Error
import pandas as pd
from datetime import datetime

# Database connection configuration
# UPDATE THESE VALUES based on your MySQL setup
DB_CONFIG = {
    'host': '127.0.0.1',
    'port': 3306,
    'database': 'Umang_Staffing_DB',  # ← Fixed database name (no underscores)
    'user': 'root',
    'password': '',             # Empty password for your setup
    'charset': 'utf8mb4',
    'autocommit': True
}

# Initialize session state
if 'logged_in' not in st.session_state:
    st.session_state.logged_in = False
if 'hr_id' not in st.session_state:
    st.session_state.hr_id = None
if 'client_id' not in st.session_state:
    st.session_state.client_id = None
if 'hr_name' not in st.session_state:
    st.session_state.hr_name = None
if 'company_name' not in st.session_state:
    st.session_state.company_name = None

# Database connection function
def get_db_connection():
    try:
        connection = mysql.connector.connect(**DB_CONFIG)
        return connection
    except Error as e:
        st.error(f"Database connection error: {e}")
        return None


def ensure_auto_close_trigger(conn):
    """
    Create or replace the trg_AutoCloseFilledJobs trigger which auto-closes jobs
    when PLACEMENTS are inserted and vacancy rules are met.
    """
    try:
        cursor = conn.cursor()
        # Drop existing trigger if exists
        cursor.execute("DROP TRIGGER IF EXISTS trg_AutoCloseFilledJobs")
        # Create trigger
        trigger_sql = """
        CREATE TRIGGER `trg_AutoCloseFilledJobs` AFTER INSERT ON `PLACEMENTS`
        FOR EACH ROW
        BEGIN
            DECLARE placement_count INT;
            DECLARE job_type VARCHAR(50);
            
            -- Get job type and count placements
            SELECT JobType INTO job_type
            FROM JOBS WHERE JobID = NEW.JobID;
            
            SELECT COUNT(*) INTO placement_count
            FROM PLACEMENTS WHERE JobID = NEW.JobID;
            
            -- Auto-close job based on type and placement count
            IF (job_type IN ('Full-Time', 'Part-Time') AND placement_count >= 1) OR
               (job_type IN ('Contract', 'Temporary') AND placement_count >= 3) THEN
                UPDATE JOBS
                SET IsOpen = 0
                WHERE JobID = NEW.JobID;
            END IF;
        END
        """
        cursor.execute(trigger_sql)
        conn.commit()
        cursor.close()
    except Exception as e:
        # If trigger creation fails (e.g. insufficient privileges), log a warning to the UI
        st.warning(f"Could not create trigger trg_AutoCloseFilledJobs: {e}")


# Authentication function
def authenticate_user(email):
    """Authenticate HR user by email"""
    conn = get_db_connection()
    if conn:
        try:
            cursor = conn.cursor(dictionary=True)
            # Clean the email input
            email_clean = email.strip().lower()
            
            query = """
                SELECT h.HR_ID, h.FirstName, h.LastName, h.Email, 
                       h.ClientID, c.CompanyName
                FROM HR h
                JOIN Clients c ON h.ClientID = c.ClientID
                WHERE LOWER(TRIM(h.Email)) = %s
            """
            cursor.execute(query, (email_clean,))
            result = cursor.fetchone()
            cursor.close()
            conn.close()
            return result
        except Error as e:
            st.error(f"Authentication error: {e}")
            return None
    return None

# Login page
def login_page():
    st.title("🏢 Umang Staffing LLC - HR Portal")
    st.subheader("HR Login")
    
    with st.form("login_form"):
        email = st.text_input("Email Address", placeholder="hr@company.com")
        password = st.text_input("Password", type="password", placeholder="Enter password")
        submitted = st.form_submit_button("Login", type="primary")
        
        if submitted:
            if email and password:
                # Password field is a placeholder for future authentication
                # Currently not validated - any password will work if email is valid
                user = authenticate_user(email)
                if user:
                    st.session_state.logged_in = True
                    st.session_state.hr_id = user['HR_ID']
                    st.session_state.client_id = user['ClientID']
                    st.session_state.hr_name = f"{user['FirstName']} {user['LastName']}"
                    st.session_state.company_name = user['CompanyName']
                    st.rerun()
                else:
                    st.error("❌ Invalid email address. Please contact your administrator.")
            elif not email:
                st.warning("⚠️ Please enter your email address.")
            else:
                st.warning("⚠️ Please enter your password.")
    
    st.info("👋 Welcome! Please login with your HR email address to access the client portal.")
    
    # Small note for demonstration purposes
    with st.expander("ℹ️ Demo Note"):
        st.caption("Note: Password authentication is a placeholder for future implementation. "
                  "Currently, any password will work if the email is valid in the system.")

# Logout function
def logout():
    st.session_state.logged_in = False
    st.session_state.hr_id = None
    st.session_state.client_id = None
    st.session_state.hr_name = None
    st.session_state.company_name = None
    st.rerun()

# Dashboard page
def dashboard_page():
    st.title(f"HR Dashboard - {st.session_state.company_name}")
    st.write(f"Welcome back, **{st.session_state.hr_name}**!")
    
    conn = get_db_connection()
    if conn:
        cursor = conn.cursor(dictionary=True)
        
        # Get metrics
        col1, col2, col3, col4 = st.columns(4)
        
        # Total open jobs
        cursor.execute("""
            SELECT COUNT(*) as count 
            FROM JOBS 
            WHERE ClientID = %s AND IsOpen = 1
        """, (st.session_state.client_id,))
        open_jobs = cursor.fetchone()['count']
        col1.metric("Open Jobs", open_jobs)
        
        # Total candidates pending review
        cursor.execute("""
            SELECT COUNT(*) as count 
            FROM ELIGIBLE_CANDIDATES ec
            JOIN JOBS j ON ec.JOBID = j.JobID
            WHERE j.ClientID = %s AND ec.ApplicationStatus = 'PENDING'
        """, (st.session_state.client_id,))
        pending = cursor.fetchone()['count']
        col2.metric("Pending Review", pending)
        
        # Total in interview
        cursor.execute("""
            SELECT COUNT(*) as count 
            FROM ELIGIBLE_CANDIDATES ec
            JOIN JOBS j ON ec.JOBID = j.JobID
            WHERE j.ClientID = %s AND ec.ApplicationStatus = 'Interviewing'
        """, (st.session_state.client_id,))
        interviewing = cursor.fetchone()['count']
        col3.metric("In Interview", interviewing)
        
        # Total placements
        cursor.execute("""
            SELECT COUNT(*) as count 
            FROM PLACEMENTS p
            JOIN JOBS j ON p.JobID = j.JobID
            WHERE j.ClientID = %s
        """, (st.session_state.client_id,))
        placements = cursor.fetchone()['count']
        col4.metric("Total Hires", placements)
        
        st.markdown("---")
        
        # Recent applications
        st.subheader("📝 Recent Applications (Last 30 Days)")
        query = """
            SELECT 
                CONCAT(c.FirstName, ' ', c.LastName) as CandidateName,
                j.JobTitle,
                ec.ApplicationStatus,
                ec.ApplyDate,
                ec.CandidateID,
                ec.JOBID
            FROM ELIGIBLE_CANDIDATES ec
            JOIN Candidates c ON ec.CandidateID = c.CandidateID
            JOIN JOBS j ON ec.JOBID = j.JobID
            WHERE j.ClientID = %s 
            AND ec.ApplyDate >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
            ORDER BY ec.ApplyDate DESC
            LIMIT 10
        """
        cursor.execute(query, (st.session_state.client_id,))
        recent_apps = cursor.fetchall()
        
        if recent_apps:
            df = pd.DataFrame(recent_apps)
            df['ApplyDate'] = pd.to_datetime(df['ApplyDate']).dt.strftime('%Y-%m-%d')
            st.dataframe(df[['CandidateName', 'JobTitle', 'ApplicationStatus', 'ApplyDate']], 
                        use_container_width=True, hide_index=True)
        else:
            st.info("No recent applications in the last 30 days.")
        
        cursor.close()
        conn.close()

# View jobs page
def view_jobs_page():
    st.title("💼 Job Postings")
    
    conn = get_db_connection()
    if conn:
        cursor = conn.cursor(dictionary=True)
        
        # Filter options
        col1, col2 = st.columns(2)
        with col1:
            status_filter = st.selectbox("Job Status", ["All", "Open", "Closed"])
        with col2:
            job_type_filter = st.selectbox("Job Type", ["All", "Full-Time", "Contract", "Temp-to-Hire"])
        
        # Build query
        query = """
            SELECT 
                JobID,
                JobTitle,
                JobType,
                PayRate,
                DatePosted,
                IsOpen,
                (SELECT COUNT(*) FROM ELIGIBLE_CANDIDATES ec WHERE ec.JOBID = j.JobID) as TotalApplicants,
                (SELECT COUNT(*) FROM PLACEMENTS p WHERE p.JobID = j.JobID) as TotalHires
            FROM JOBS j
            WHERE ClientID = %s
        """
        params = [st.session_state.client_id]
        
        if status_filter == "Open":
            query += " AND IsOpen = 1"
        elif status_filter == "Closed":
            query += " AND IsOpen = 0"
        
        if job_type_filter != "All":
            query += " AND JobType = %s"
            params.append(job_type_filter)
        
        query += " ORDER BY DatePosted DESC"
        
        cursor.execute(query, params)
        jobs = cursor.fetchall()
        
        if jobs:
            for job in jobs:
                status_badge = "🟢 Open" if job['IsOpen'] else "🔴 Closed"
                
                with st.expander(f"{job['JobTitle']} - {status_badge}"):
                    col1, col2, col3 = st.columns(3)
                    col1.write(f"**Type:** {job['JobType']}")
                    col2.write(f"**Pay Rate:** ${job['PayRate']:,.2f}")
                    col3.write(f"**Posted:** {job['DatePosted']}")
                    
                    col1, col2 = st.columns(2)
                    col1.metric("Total Applicants", job['TotalApplicants'])
                    col2.metric("Total Hires", job['TotalHires'])
                    
                    if st.button(f"View Candidates", key=f"view_{job['JobID']}"):
                        st.session_state.selected_job_id = job['JobID']
                        st.session_state.page = "candidates"
                        st.rerun()
        else:
            st.info("No jobs found matching the criteria.")
        
        cursor.close()
        conn.close()

# View candidates for a specific job
def view_candidates_page():
    if 'selected_job_id' not in st.session_state:
        st.warning("Please select a job first.")
        return
    
    conn = get_db_connection()
    if conn:
        # Ensure trigger is present when we have a live connection (safe no-op if already exists)
        ensure_auto_close_trigger(conn)

        cursor = conn.cursor(dictionary=True)
        
        # Get job details
        cursor.execute("""
            SELECT JobTitle, JobType, PayRate, JobDescription 
            FROM JOBS 
            WHERE JobID = %s
        """, (st.session_state.selected_job_id,))
        job = cursor.fetchone()
        
        if job:
            st.title(f"👥 Candidates for: {job['JobTitle']}")
            
            with st.expander("Job Details"):
                st.write(f"**Type:** {job['JobType']}")
                st.write(f"**Pay Rate:** ${job['PayRate']:,.2f}")
                st.write(f"**Description:** {job['JobDescription']}")
            
            # Status filter
            status_filter = st.selectbox(
                "Filter by Status", 
                ["All", "PENDING", "Interviewing", "Offered", "Rejected"]
            )
            
            # Get candidates
            query = """
                SELECT 
                    c.CandidateID,
                    CONCAT(c.FirstName, ' ', c.LastName) as CandidateName,
                    c.Email,
                    c.Phone,
                    CONCAT(c.City, ', ', c.State) as Location,
                    c.ResumeURL,
                    ec.ApplicationStatus,
                    ec.ApplyDate,
                    GROUP_CONCAT(DISTINCT s.SkillName ORDER BY s.SkillName SEPARATOR ', ') as Skills
                FROM ELIGIBLE_CANDIDATES ec
                JOIN Candidates c ON ec.CandidateID = c.CandidateID
                LEFT JOIN CANDIDATE_SKILLS cs ON c.CandidateID = cs.CandidateID
                LEFT JOIN Skills s ON cs.SkillID = s.SkillID
                WHERE ec.JOBID = %s
            """
            params = [st.session_state.selected_job_id]
            
            if status_filter != "All":
                query += " AND ec.ApplicationStatus = %s"
                params.append(status_filter)
            
            query += " GROUP BY c.CandidateID, c.FirstName, c.LastName, c.Email, c.Phone, c.City, c.State, c.ResumeURL, ec.ApplicationStatus, ec.ApplyDate"
            query += " ORDER BY ec.ApplyDate DESC"
            
            cursor.execute(query, params)
            candidates = cursor.fetchall()
            
            if candidates:
                for candidate in candidates:
                    with st.container():
                        st.markdown("---")
                        col1, col2 = st.columns([3, 1])
                        
                        with col1:
                            # NEW: hide name when candidate is already Offered
                            if candidate['ApplicationStatus'] == "Offered":
                                st.subheader("Candidate name hidden (Offered)")
                            else:
                                st.subheader(candidate['CandidateName'])
                            
                            st.write(f"📧 {candidate['Email']} | 📱 {candidate['Phone']}")
                            st.write(f"📍 {candidate['Location']}")
                            st.write(f"🎯 **Skills:** {candidate['Skills'] if candidate['Skills'] else 'Not specified'}")
                            st.write(f"📅 **Applied:** {candidate['ApplyDate']}")
                            
                            # Resume link (still available)
                            if candidate['ResumeURL']:
                                st.markdown(f"[📄 View Resume]({candidate['ResumeURL']})")
                        
                        with col2:
                            # Current status
                            status_color = {
                                'PENDING': '🟡',
                                'Interviewing': '🔵',
                                'Offered': '🟢',
                                'Rejected': '🔴'
                            }
                            st.write(f"**Status:** {status_color.get(candidate['ApplicationStatus'], '⚪')} {candidate['ApplicationStatus']}")
                            
                            # Update status
                            status_options = ["PENDING", "Interviewing", "Offered", "Rejected"]
                            current_index = status_options.index(candidate['ApplicationStatus']) if candidate['ApplicationStatus'] in status_options else 0
                            new_status = st.selectbox(
                                "Update Status",
                                status_options,
                                index=current_index,
                                key=f"status_{candidate['CandidateID']}"
                            )
                            
                            # When HR clicks Update
                            if st.button("Update", key=f"update_{candidate['CandidateID']}"):
                                # If setting to Offered -> show placement form
                                if new_status == "Offered":
                                    # store details in session and show placement form
                                    st.session_state['show_placement_form'] = True
                                    st.session_state['placement_candidate_id'] = candidate['CandidateID']
                                    st.session_state['placement_job_id'] = st.session_state.selected_job_id
                                    st.session_state['placement_hr_id'] = st.session_state.hr_id
                                    # Optional default final pay from job if available
                                    st.session_state['placement_default_pay'] = job.get('PayRate') if job and 'PayRate' in job else 0.0
                                    st.rerun()
                                else:
                                    # simple status update for other statuses
                                    update_cursor = conn.cursor()
                                    update_cursor.execute("""
                                        UPDATE ELIGIBLE_CANDIDATES 
                                        SET ApplicationStatus = %s
                                        WHERE CandidateID = %s AND JOBID = %s
                                    """, (new_status, candidate['CandidateID'], st.session_state.selected_job_id))
                                    conn.commit()
                                    update_cursor.close()
                                    st.success(f"Status updated to {new_status}!")
                                    st.rerun()
                # end for-candidates loop

                # Placement form (shown after clicking Update -> Offered)
                if st.session_state.get('show_placement_form'):
                    st.markdown("---")
                    st.subheader("📝 Placement Details (Complete to record hire)")
                    # Use a unique form name
                    with st.form("placement_form"):
                        # defaults
                        default_start = datetime.today().date()
                        default_hire = datetime.today().date()
                        default_pay = float(st.session_state.get('placement_default_pay', 0.0) or 0.0)

                        start_date = st.date_input("Start Date", value=default_start, key="placement_start")
                        end_date = st.date_input("End Date (optional)", value=None, key="placement_end")
                        final_pay = st.number_input("Final Pay Rate", min_value=0.0, value=default_pay, format="%.2f", key="placement_pay")
                        hire_date = st.date_input("Hire Date", value=default_hire, key="placement_hire")

                        submit_placement = st.form_submit_button("Create Placement")

                    if st.button("Cancel Placement", key="cancel_placement"):
                        # clear and return to candidates view
                        st.session_state.pop('show_placement_form', None)
                        st.session_state.pop('placement_candidate_id', None)
                        st.session_state.pop('placement_job_id', None)
                        st.session_state.pop('placement_hr_id', None)
                        # st.experimental_rerun()

                    if submit_placement:
                        try:
                            insert_cursor = conn.cursor()
                            insert_sql = """
                                INSERT INTO PLACEMENTS (JobID, CandidateID, HR_ID, StartDate, EndDate, FinalPayRate, HireDate)
                                VALUES (%s, %s, %s, %s, %s, %s, %s)
                            """
                            insert_cursor.execute(insert_sql, (
                                st.session_state['placement_job_id'],
                                st.session_state['placement_candidate_id'],
                                st.session_state['placement_hr_id'],
                                start_date.strftime("%Y-%m-%d"),
                                end_date.strftime("%Y-%m-%d") if end_date else None,
                                float(final_pay),
                                hire_date.strftime("%Y-%m-%d")
                            ))
                            conn.commit()
                            insert_cursor.close()

                            # update ELIGIBLE_CANDIDATES status to Offered
                            upd_cursor = conn.cursor()
                            upd_cursor.execute("""
                                UPDATE ELIGIBLE_CANDIDATES
                                SET ApplicationStatus = %s
                                WHERE CandidateID = %s AND JOBID = %s
                            """, ("Offered", st.session_state['placement_candidate_id'], st.session_state['placement_job_id']))
                            conn.commit()
                            upd_cursor.close()

                            st.success("Placement recorded and candidate status updated to Offered.")
                        except Exception as e:
                            st.error(f"Error creating placement: {e}")
                        finally:
                            # clear session state and refresh
                            st.session_state.pop('show_placement_form', None)
                            st.session_state.pop('placement_candidate_id', None)
                            st.session_state.pop('placement_job_id', None)
                            st.session_state.pop('placement_hr_id', None)
                            # st.experimental_rerun()
            else:
                st.info("No candidates found for this job with the selected filters.")
        
        cursor.close()
        conn.close()

# View placements page
def view_placements_page():
    st.title("✅ Successful Placements")
    
    conn = get_db_connection()
    if conn:
        cursor = conn.cursor(dictionary=True)
        
        query = """
            SELECT 
                p.PlacementID,
                CONCAT(c.FirstName, ' ', c.LastName) as CandidateName,
                c.Email,
                j.JobTitle,
                p.StartDate,
                p.EndDate,
                p.FinalPayRate,
                p.HireDate,
                CASE 
                    WHEN p.EndDate IS NULL THEN 'Active'
                    WHEN p.EndDate < CURDATE() THEN 'Completed'
                    ELSE 'Scheduled'
                END as Status
            FROM PLACEMENTS p
            JOIN Candidates c ON p.CandidateID = c.CandidateID
            JOIN JOBS j ON p.JobID = j.JobID
            WHERE j.ClientID = %s
            ORDER BY p.HireDate DESC
        """
        
        cursor.execute(query, (st.session_state.client_id,))
        placements = cursor.fetchall()
        
        if placements:
            # Summary metrics
            col1, col2, col3 = st.columns(3)
            active = len([p for p in placements if p['Status'] == 'Active'])
            completed = len([p for p in placements if p['Status'] == 'Completed'])
            
            col1.metric("Total Placements", len(placements))
            col2.metric("Active", active)
            col3.metric("Completed", completed)
            
            st.markdown("---")
            
            # Display placements
            for placement in placements:
                status_emoji = {"Active": "🟢", "Completed": "⚪", "Scheduled": "🔵"}
                
                with st.expander(f"{status_emoji.get(placement['Status'], '')} {placement['CandidateName']} - {placement['JobTitle']}"):
                    col1, col2 = st.columns(2)
                    
                    with col1:
                        st.write(f"**Email:** {placement['Email']}")
                        st.write(f"**Job Title:** {placement['JobTitle']}")
                        st.write(f"**Hire Date:** {placement['HireDate']}")
                        st.write(f"**Start Date:** {placement['StartDate']}")
                    
                    with col2:
                        st.write(f"**Status:** {placement['Status']}")
                        st.write(f"**Pay Rate:** ${placement['FinalPayRate']:,.2f}")
                        if placement['EndDate']:
                            st.write(f"**End Date:** {placement['EndDate']}")
                        else:
                            st.write(f"**End Date:** Ongoing")
        else:
            st.info("No placements yet.")
        
        cursor.close()
        conn.close()

# Main app
def main():
    # Page config
    st.set_page_config(
        page_title="Umang Staffing - Client Portal",
        page_icon="🏢",
        layout="wide"
    )
    
    # Check if logged in
    if not st.session_state.logged_in:
        login_page()
    else:
        # Sidebar navigation
        with st.sidebar:
            st.title("🏢 Umang Staffing")
            st.write(f"**{st.session_state.company_name}**")
            st.write(f"Logged in as: {st.session_state.hr_name}")
            st.markdown("---")
            
            # Navigation
            if 'page' not in st.session_state:
                st.session_state.page = "dashboard"
            
            if st.button("📊 Dashboard", use_container_width=True):
                st.session_state.page = "dashboard"
                st.rerun()
            
            if st.button("💼 View Jobs", use_container_width=True):
                st.session_state.page = "jobs"
                st.rerun()
            
            if st.button("✅ View Placements", use_container_width=True):
                st.session_state.page = "placements"
                st.rerun()
            
            st.markdown("---")
            
            if st.button("🚪 Logout", use_container_width=True):
                logout()
        
        # Display selected page
        if st.session_state.page == "dashboard":
            dashboard_page()
        elif st.session_state.page == "jobs":
            view_jobs_page()
        elif st.session_state.page == "candidates":
            view_candidates_page()
        elif st.session_state.page == "placements":
            view_placements_page()

if __name__ == "__main__":
    main()