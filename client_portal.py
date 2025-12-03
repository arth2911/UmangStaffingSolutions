import streamlit as st
import mysql.connector
from mysql.connector import Error
import pandas as pd
from datetime import datetime, date

# Database connection configuration
DB_CONFIG = {
    'host': '127.0.0.1',
    'port': 3306,
    'user': 'root',
    'password': '',
    'database': 'Umang_Staffing_DB',
    'charset': 'utf8mb4',
    'autocommit': True
}

# Initialize session state
if 'logged_in' not in st.session_state:
    st.session_state.logged_in = False
if 'client_id' not in st.session_state:
    st.session_state.client_id = None
if 'company_name' not in st.session_state:
    st.session_state.company_name = None
if 'contact_person' not in st.session_state:
    st.session_state.contact_person = None

# Database connection function
def get_db_connection():
    try:
        connection = mysql.connector.connect(**DB_CONFIG)
        return connection
    except Error as e:
        st.error(f"Database connection error: {e}")
        return None

# Client authentication
def authenticate_client(email):
    """Authenticate client by contact email"""
    conn = get_db_connection()
    if conn:
        try:
            cursor = conn.cursor(dictionary=True)
            email_clean = email.strip().lower()
            
            query = """
                SELECT ClientID, CompanyName, Industry, ContactPerson, 
                       ContactEmail, ContactPhone
                FROM CLIENTS
                WHERE LOWER(TRIM(ContactEmail)) = %s
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
    st.title("🏢 Umang Staffing LLC - Client Portal")
    st.subheader("Client Company Login")
    
    with st.form("login_form"):
        email = st.text_input("Company Contact Email", placeholder="contact@yourcompany.com")
        password = st.text_input("Password", type="password", placeholder="Enter password")
        submitted = st.form_submit_button("Login", type="primary")
        
        if submitted:
            if email and password:
                # Password is placeholder - any password works if email is valid
                client = authenticate_client(email)
                if client:
                    st.session_state.logged_in = True
                    st.session_state.client_id = client['ClientID']
                    st.session_state.company_name = client['CompanyName']
                    st.session_state.contact_person = client['ContactPerson']
                    st.session_state.industry = client['Industry']
                    st.rerun()
                else:
                    st.error("❌ Invalid email address. Please contact Umang Staffing to register your company.")
            elif not email:
                st.warning("⚠️ Please enter your email address.")
            else:
                st.warning("⚠️ Please enter your password.")
    
    st.info("👋 Welcome! Login to post jobs and manage your hiring needs.")
    
    with st.expander("ℹ️ Demo Note"):
        st.caption("Password authentication is a placeholder. Use any client contact email from the database.")

# Logout function
def logout():
    st.session_state.logged_in = False
    st.session_state.client_id = None
    st.session_state.company_name = None
    st.session_state.contact_person = None
    st.rerun()

# Dashboard
def dashboard_page():
    st.title(f"📊 Dashboard - {st.session_state.company_name}")
    st.write(f"Welcome, **{st.session_state.contact_person}**!")
    
    conn = get_db_connection()
    if conn:
        cursor = conn.cursor(dictionary=True)
        
        # Metrics
        col1, col2, col3, col4 = st.columns(4)
        
        cursor.execute("""
            SELECT COUNT(*) as count 
            FROM JOBS 
            WHERE ClientID = %s AND IsOpen = 1
        """, (st.session_state.client_id,))
        open_jobs = cursor.fetchone()['count']
        col1.metric("Open Jobs", open_jobs)
        
        cursor.execute("""
            SELECT COUNT(*) as count 
            FROM HR 
            WHERE ClientID = %s
        """, (st.session_state.client_id,))
        total_hr = cursor.fetchone()['count']
        col2.metric("HR Representatives", total_hr)
        
        cursor.execute("""
            SELECT COUNT(DISTINCT ec.CandidateID) as count 
            FROM ELIGIBLE_CANDIDATES ec
            JOIN JOBS j ON ec.JOBID = j.JobID
            WHERE j.ClientID = %s AND ec.ApplicationStatus = 'PENDING'
        """, (st.session_state.client_id,))
        pending_candidates = cursor.fetchone()['count']
        col3.metric("Pending Candidates", pending_candidates)
        
        cursor.execute("""
            SELECT COUNT(*) as count 
            FROM PLACEMENTS p
            JOIN JOBS j ON p.JobID = j.JobID
            WHERE j.ClientID = %s
        """, (st.session_state.client_id,))
        total_hires = cursor.fetchone()['count']
        col4.metric("Total Hires", total_hires)
        
        st.markdown("---")
        
        # Recent activity
        col1, col2 = st.columns(2)
        
        with col1:
            st.subheader("📋 Recent Job Postings")
            cursor.execute("""
                SELECT JobID, JobTitle, JobType, DatePosted, IsOpen,
                       (SELECT COUNT(*) FROM ELIGIBLE_CANDIDATES WHERE JOBID = j.JobID) as ApplicantCount
                FROM JOBS j
                WHERE ClientID = %s
                ORDER BY DatePosted DESC
                LIMIT 5
            """, (st.session_state.client_id,))
            recent_jobs = cursor.fetchall()
            
            if recent_jobs:
                for job in recent_jobs:
                    status = "🟢 Open" if job['IsOpen'] else "🔴 Closed"
                    st.write(f"{status} **{job['JobTitle']}** ({job['JobType']})")
                    st.caption(f"Posted: {job['DatePosted']} | {job['ApplicantCount']} candidates")
            else:
                st.info("No job postings yet. Create your first job posting!")
        
        with col2:
            st.subheader("👥 Your HR Team")
            cursor.execute("""
                SELECT HR_ID, FirstName, LastName, Email
                FROM HR
                WHERE ClientID = %s
                ORDER BY FirstName
                LIMIT 5
            """, (st.session_state.client_id,))
            hr_team = cursor.fetchall()
            
            if hr_team:
                for hr in hr_team:
                    st.write(f"**{hr['FirstName']} {hr['LastName']}**")
                    st.caption(f"{hr['Email']}")
            else:
                st.info("No HR representatives yet. Add your HR team members!")
        
        cursor.close()
        conn.close()

# Manage Jobs
def manage_jobs_page():
    st.title("💼 Job Postings")
    
    tab1, tab2 = st.tabs(["View Jobs", "Create New Job"])
    
    with tab1:
        st.subheader("Your Job Postings")
        
        conn = get_db_connection()
        if conn:
            cursor = conn.cursor(dictionary=True)
            
            # Filter
            col1, col2 = st.columns(2)
            with col1:
                status_filter = st.selectbox("Status", ["All", "Open", "Closed"])
            with col2:
                type_filter = st.selectbox("Job Type", ["All", "Full-Time", "Contract", "Temp-to-Hire"])
            
            query = """
                SELECT j.JobID, j.JobTitle, j.JobType, j.PayRate, j.DatePosted, j.IsOpen, 
                       j.JobDescription, j.HR_ID,
                       CONCAT(h.FirstName, ' ', h.LastName) as AssignedHR,
                       h.Email as HREmail,
                       (SELECT COUNT(*) FROM ELIGIBLE_CANDIDATES WHERE JOBID = j.JobID) as ApplicantCount
                FROM JOBS j
                LEFT JOIN HR h ON j.HR_ID = h.HR_ID
                WHERE j.ClientID = %s
            """
            params = [st.session_state.client_id]
            
            if status_filter == "Open":
                query += " AND j.IsOpen = 1"
            elif status_filter == "Closed":
                query += " AND j.IsOpen = 0"
            
            if type_filter != "All":
                query += " AND j.JobType = %s"
                params.append(type_filter)
            
            query += " ORDER BY j.DatePosted DESC"
            
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
                        
                        st.write(f"**Description:** {job['JobDescription']}")
                        
                        # Show assigned HR
                        if job['AssignedHR']:
                            st.info(f"👤 **Assigned HR:** {job['AssignedHR']} ({job['HREmail']})")
                        else:
                            st.warning("⚠️ No HR assigned to this job")
                        
                        col1, col2, col3 = st.columns(3)
                        col1.metric("Candidates Matched", job['ApplicantCount'])
                        
                        # View matched candidates
                        if st.button(f"View Matched Candidates", key=f"view_{job['JobID']}"):
                            st.session_state.selected_job_id = job['JobID']
                            st.session_state.page = "candidates"
                            st.rerun()
                        
                        # Change HR assignment
                        st.markdown("**Change HR Assignment:**")
                        
                        # Get all HR from this client
                        cursor.execute("""
                            SELECT HR_ID, CONCAT(FirstName, ' ', LastName) as Name, Email
                            FROM HR
                            WHERE ClientID = %s
                            ORDER BY FirstName
                        """, (st.session_state.client_id,))
                        available_hr = cursor.fetchall()
                        
                        if available_hr:
                            hr_options = {hr['HR_ID']: f"{hr['Name']} ({hr['Email']})" for hr in available_hr}
                            hr_ids = list(hr_options.keys())
                            hr_labels = list(hr_options.values())
                            
                            # Find current selection index
                            current_index = hr_ids.index(job['HR_ID']) if job['HR_ID'] in hr_ids else 0
                            
                            selected_hr = st.selectbox(
                                "Select HR",
                                options=hr_ids,
                                format_func=lambda x: hr_options[x],
                                index=current_index,
                                key=f"hr_select_{job['JobID']}"
                            )
                            
                            if selected_hr != job['HR_ID']:
                                if st.button(f"Update HR Assignment", key=f"update_hr_{job['JobID']}"):
                                    update_cursor = conn.cursor()
                                    update_cursor.execute("""
                                        UPDATE JOBS 
                                        SET HR_ID = %s
                                        WHERE JobID = %s
                                    """, (selected_hr, job['JobID']))
                                    conn.commit()
                                    update_cursor.close()
                                    st.success(f"✅ HR assignment updated!")
                                    st.rerun()
                        else:
                            st.warning("No HR representatives available. Add HR team members first.")
                        
                        st.markdown("---")
                        
                        # Toggle job status
                        if job['IsOpen']:
                            if st.button(f"Close Job", key=f"close_{job['JobID']}"):
                                cursor.execute("UPDATE JOBS SET IsOpen = 0 WHERE JobID = %s", (job['JobID'],))
                                conn.commit()
                                st.success("Job closed!")
                                st.rerun()
                        else:
                            if st.button(f"Reopen Job", key=f"open_{job['JobID']}"):
                                cursor.execute("UPDATE JOBS SET IsOpen = 1 WHERE JobID = %s", (job['JobID'],))
                                conn.commit()
                                st.success("Job reopened!")
                                st.rerun()
            else:
                st.info("No job postings found. Create your first job posting in the 'Create New Job' tab!")
            
            cursor.close()
            conn.close()
    
    with tab2:
        st.subheader("Create New Job Posting")
        
        conn = get_db_connection()
        if conn:
            cursor = conn.cursor(dictionary=True)
            
            # Get existing HR team members
            cursor.execute("""
                SELECT HR_ID, CONCAT(FirstName, ' ', LastName) as Name, Email
                FROM HR
                WHERE ClientID = %s
                ORDER BY FirstName
            """, (st.session_state.client_id,))
            hr_team = cursor.fetchall()
            cursor.close()
            conn.close()
            
            # Check if HR team exists
            if not hr_team:
                st.warning("⚠️ You need to add HR team members before creating job postings.")
                st.info("👉 Go to the **'HR Team'** tab in the sidebar to add your HR representatives first.")
                
                if st.button("Go to HR Team Page"):
                    st.session_state.page = "hr"
                    st.rerun()
                return
            
            with st.form("create_job_form"):
                job_title = st.text_input("Job Title*", placeholder="Senior Software Engineer")
                
                col1, col2 = st.columns(2)
                with col1:
                    job_type = st.selectbox("Job Type*", ["Full-Time", "Contract", "Temp-to-Hire"])
                with col2:
                    pay_rate = st.number_input("Pay Rate (Annual Salary or Hourly)*", 
                                              min_value=0.0, step=1000.0, value=75000.0)
                
                job_description = st.text_area("Job Description*", 
                                              placeholder="Describe the role, responsibilities, requirements...",
                                              height=150)
                
                # HR Assignment
                st.markdown("### Assign HR Representative")
                st.caption("Select which HR representative will handle candidates for this job")
                
                hr_options = {hr['HR_ID']: f"{hr['Name']} ({hr['Email']})" for hr in hr_team}
                hr_ids = list(hr_options.keys())
                
                selected_hr = st.selectbox(
                    "Select HR Representative*",
                    options=hr_ids,
                    format_func=lambda x: hr_options[x]
                )
                
                st.info("💡 Need to add a new HR representative? Go to the 'HR Team' tab first.")
                
                submitted = st.form_submit_button("Create Job Posting", type="primary")
                
                if submitted:
                    if job_title and job_description and selected_hr:
                        conn = get_db_connection()
                        if conn:
                            cursor = conn.cursor()
                            try:
                                # Get the next JobID by finding the max and adding 1
                                cursor.execute("SELECT MAX(JobID) as MaxID FROM JOBS")
                                result = cursor.fetchone()
                                next_job_id = (result[0] + 1) if result[0] else 1001  # Start from 1001 if no jobs exist
                                
                                query = """
                                    INSERT INTO JOBS (JobID, JobTitle, ClientID, JobDescription, JobType, 
                                                     PayRate, DatePosted, IsOpen, HR_ID)
                                    VALUES (%s, %s, %s, %s, %s, %s, %s, 1, %s)
                                """
                                cursor.execute(query, (
                                    next_job_id,
                                    job_title,
                                    st.session_state.client_id,
                                    job_description,
                                    job_type,
                                    pay_rate,
                                    date.today(),
                                    selected_hr
                                ))
                                conn.commit()
                                
                                # Get HR name for confirmation
                                hr_name = hr_options[selected_hr]
                                
                                st.success(f"✅ Job posting '{job_title}' created successfully!")
                                st.info(f"**Job ID:** {next_job_id}\n\n**Assigned to:** {hr_name}")
                                st.caption("Umang Staffing will now match qualified candidates to this position.")
                                cursor.close()
                                conn.close()
                                st.rerun()
                            except Error as e:
                                st.error(f"Error creating job: {e}")
                                cursor.close()
                                conn.close()
                    else:
                        st.warning("Please fill in all required fields and select an HR representative.")
        else:
            st.error("Database connection failed.")

# Manage HR
def manage_hr_page():
    st.title("👥 HR Team Management")
    
    tab1, tab2 = st.tabs(["View HR Team", "Add HR Representative"])
    
    with tab1:
        st.subheader("Your HR Representatives")
        
        conn = get_db_connection()
        if conn:
            cursor = conn.cursor(dictionary=True)
            
            cursor.execute("""
                SELECT HR_ID, FirstName, LastName, Email
                FROM HR
                WHERE ClientID = %s
                ORDER BY FirstName
            """, (st.session_state.client_id,))
            hr_team = cursor.fetchall()
            
            if hr_team:
                for hr in hr_team:
                    with st.container():
                        col1, col2 = st.columns([3, 1])
                        with col1:
                            st.write(f"### {hr['FirstName']} {hr['LastName']}")
                            st.write(f"📧 {hr['Email']}")
                            st.write(f"**HR ID:** {hr['HR_ID']}")
                        with col2:
                            # Count jobs assigned to this HR (now HR_ID is in JOBS table)
                            cursor.execute("""
                                SELECT COUNT(*) as count
                                FROM JOBS
                                WHERE HR_ID = %s
                            """, (hr['HR_ID'],))
                            job_count = cursor.fetchone()['count']
                            st.metric("Jobs Assigned", job_count)
                        st.markdown("---")
            else:
                st.info("No HR representatives added yet. Add your HR team members in the 'Add HR Representative' tab!")
            
            cursor.close()
            conn.close()
    
    with tab2:
        st.subheader("Add New HR Representative")
        
        with st.form("add_hr_form"):
            col1, col2 = st.columns(2)
            with col1:
                first_name = st.text_input("First Name*", placeholder="John")
            with col2:
                last_name = st.text_input("Last Name*", placeholder="Doe")
            
            email = st.text_input("Email Address*", placeholder="john.doe@yourcompany.com")
            
            st.info("💡 This email will be used for the HR representative to login to the HR Portal.")
            
            submitted = st.form_submit_button("Add HR Representative", type="primary")
            
            if submitted:
                if first_name and last_name and email:
                    conn = get_db_connection()
                    if conn:
                        cursor = conn.cursor()
                        try:
                            query = """
                                INSERT INTO HR (FirstName, LastName, Email, ClientID)
                                VALUES (%s, %s, %s, %s)
                            """
                            cursor.execute(query, (first_name, last_name, email.lower(), st.session_state.client_id))
                            conn.commit()
                            new_hr_id = cursor.lastrowid
                            st.success(f"✅ HR Representative added successfully!")
                            st.info(f"**HR ID:** {new_hr_id}\n\n**Login Email:** {email.lower()}")
                            st.caption("They can now login to the HR Portal using this email.")
                            cursor.close()
                            conn.close()
                            st.rerun()
                        except Error as e:
                            if "Duplicate entry" in str(e):
                                st.error("❌ This email is already registered as an HR representative.")
                            else:
                                st.error(f"Error adding HR: {e}")
                            cursor.close()
                            conn.close()
                else:
                    st.warning("Please fill in all required fields.")

# View matched candidates
def view_candidates_page():
    if 'selected_job_id' not in st.session_state:
        st.warning("Please select a job first.")
        if st.button("← Back to Jobs"):
            st.session_state.page = "jobs"
            st.rerun()
        return
    
    conn = get_db_connection()
    if conn:
        cursor = conn.cursor(dictionary=True)
        
        # Get job details including assigned HR
        cursor.execute("""
            SELECT j.JobTitle, j.JobType, j.PayRate, j.JobDescription,
                   CONCAT(h.FirstName, ' ', h.LastName) as AssignedHR,
                   h.Email as HREmail
            FROM JOBS j
            LEFT JOIN HR h ON j.HR_ID = h.HR_ID
            WHERE j.JobID = %s
        """, (st.session_state.selected_job_id,))
        job = cursor.fetchone()
        
        if job:
            st.title(f"👥 Matched Candidates: {job['JobTitle']}")
            
            if st.button("← Back to Jobs"):
                st.session_state.page = "jobs"
                st.rerun()
            
            with st.expander("Job Details", expanded=False):
                col1, col2 = st.columns(2)
                with col1:
                    st.write(f"**Type:** {job['JobType']}")
                    st.write(f"**Pay Rate:** ${job['PayRate']:,.2f}")
                with col2:
                    if job['AssignedHR']:
                        st.write(f"**Assigned HR:** {job['AssignedHR']}")
                        st.write(f"**HR Email:** {job['HREmail']}")
                    else:
                        st.warning("No HR assigned")
                st.write(f"**Description:** {job['JobDescription']}")
            
            st.markdown("---")
            
            # Status filter
            status_filter = st.selectbox(
                "Filter by Status", 
                ["All", "PENDING", "Interviewing", "Offered", "Rejected"]
            )
            
            # Get candidates matched by Umang Staffing (no HR_ID in ELIGIBLE_CANDIDATES anymore)
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
                JOIN CANDIDATES c ON ec.CandidateID = c.CandidateID
                LEFT JOIN CANDIDATE_SKILLS cs ON c.CandidateID = cs.CandidateID
                LEFT JOIN Skills s ON cs.SkillID = s.SkillID
                WHERE ec.JOBID = %s
            """
            params = [st.session_state.selected_job_id]
            
            if status_filter != "All":
                query += " AND ec.ApplicationStatus = %s"
                params.append(status_filter)
            
            query += """ 
                GROUP BY c.CandidateID, c.FirstName, c.LastName, c.Email, c.Phone, 
                         c.City, c.State, c.ResumeURL, ec.ApplicationStatus, ec.ApplyDate
                ORDER BY ec.ApplyDate DESC
            """
            
            cursor.execute(query, params)
            candidates = cursor.fetchall()
            
            if candidates:
                st.success(f"Found {len(candidates)} matched candidate(s)")
                
                if job['AssignedHR']:
                    st.info(f"👤 These candidates will be reviewed by: **{job['AssignedHR']}** ({job['HREmail']})")
                
                for candidate in candidates:
                    with st.container():
                        st.markdown("---")
                        
                        col1, col2 = st.columns([3, 1])
                        
                        with col1:
                            st.subheader(candidate['CandidateName'])
                            st.write(f"📧 {candidate['Email']} | 📱 {candidate['Phone']}")
                            st.write(f"📍 {candidate['Location']}")
                            st.write(f"🎯 **Skills:** {candidate['Skills'] if candidate['Skills'] else 'Not specified'}")
                            st.write(f"📅 **Matched on:** {candidate['ApplyDate']}")
                            
                            if candidate['ResumeURL']:
                                st.markdown(f"[📄 View Resume]({candidate['ResumeURL']})")
                        
                        with col2:
                            # Status badge
                            status_colors = {
                                'PENDING': '🟡',
                                'Interviewing': '🔵',
                                'Offered': '🟢',
                                'Rejected': '🔴'
                            }
                            st.write(f"**Status:**")
                            st.write(f"{status_colors.get(candidate['ApplicationStatus'], '⚪')} {candidate['ApplicationStatus']}")
            else:
                st.info("No candidates matched yet. Umang Staffing will forward qualified candidates to you.")
        
        cursor.close()
        conn.close()

# Main app
def main():
    st.set_page_config(
        page_title="Umang Staffing - Client Portal",
        page_icon="🏢",
        layout="wide"
    )
    
    if not st.session_state.logged_in:
        login_page()
    else:
        # Sidebar
        with st.sidebar:
            st.title("🏢 Umang Staffing")
            st.write(f"**{st.session_state.company_name}**")
            st.write(f"👤 {st.session_state.contact_person}")
            st.caption(f"Industry: {st.session_state.industry}")
            st.markdown("---")
            
            # Navigation
            if 'page' not in st.session_state:
                st.session_state.page = "dashboard"
            
            if st.button("📊 Dashboard", use_container_width=True):
                st.session_state.page = "dashboard"
                st.rerun()
            
            if st.button("💼 Job Postings", use_container_width=True):
                st.session_state.page = "jobs"
                st.rerun()
            
            if st.button("👥 HR Team", use_container_width=True):
                st.session_state.page = "hr"
                st.rerun()
            
            st.markdown("---")
            
            if st.button("🚪 Logout", use_container_width=True):
                logout()
        
        # Display selected page
        if st.session_state.page == "dashboard":
            dashboard_page()
        elif st.session_state.page == "jobs":
            manage_jobs_page()
        elif st.session_state.page == "hr":
            manage_hr_page()
        elif st.session_state.page == "candidates":
            view_candidates_page()

if __name__ == "__main__":
    main()