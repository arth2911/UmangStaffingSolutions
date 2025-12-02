import streamlit as st
import mysql.connector
import hashlib
import pandas as pd

def get_connection():
    """Create a MySQL database connection for candidate portal"""
    try:
        conn = mysql.connector.connect(
            host="localhost",
            user="root",
            password="",
            database="staffing_db",
            port=3306
        )
        return conn
    except Exception as e:
        st.error(f"Database connection error: {e}")
        return None

def hash_password(password):
    """Hash a password using SHA256"""
    return hashlib.sha256(password.encode()).hexdigest()

def register_candidate(email, first_name, last_name, phone, city, state, resume_url, password):
    """Register a new candidate"""
    conn = get_connection()
    if not conn:
        return False, "Database connection failed"
    
    try:
        cursor = conn.cursor()
        # Check if email already exists
        cursor.execute("SELECT CandidateID FROM Candidates WHERE Email = %s", (email,))
        if cursor.fetchone():
            return False, "Email already registered"
        
        # Insert new candidate
        cursor.execute("""
            INSERT INTO Candidates (FirstName, LastName, Email, Phone, City, State, ResumeURL)
            VALUES (%s, %s, %s, %s, %s, %s, %s)
        """, (first_name, last_name, email, phone, city, state, resume_url))
        
        conn.commit()
        cursor.close()
        conn.close()
        return True, "Registration successful! Please login with your email."
    except Exception as e:
        return False, f"Registration error: {str(e)}"

def authenticate_candidate(email):
    """Authenticate candidate by email (no password check in demo mode)"""
    conn = get_connection()
    if not conn:
        return None
    
    try:
        cursor = conn.cursor(dictionary=True)
        cursor.execute("""
            SELECT CandidateID, FirstName, LastName, Email, Phone, City, State, ResumeURL
            FROM Candidates
            WHERE Email = %s
        """, (email,))
        
        candidate = cursor.fetchone()
        cursor.close()
        conn.close()
        
        return candidate
    except Exception as e:
        st.error(f"Authentication error: {e}")
        return None

def get_candidate_by_id(candidate_id):
    """Get candidate details by ID"""
    conn = get_connection()
    if not conn:
        return None
    
    try:
        cursor = conn.cursor(dictionary=True)
        cursor.execute("""
            SELECT CandidateID, FirstName, LastName, Email, Phone, City, State, ResumeURL
            FROM Candidates
            WHERE CandidateID = %s
        """, (candidate_id,))
        
        candidate = cursor.fetchone()
        cursor.close()
        conn.close()
        return candidate
    except Exception as e:
        return None

def display_candidate_login_page():
    """Display the candidate login/register page"""
    st.set_page_config(
        page_title="Candidate Portal - Umang Staffing Solutions",
        page_icon="👤",
        layout="centered"
    )
    
    # Custom CSS for professional styling
    st.markdown("""
        <style>
        .candidate-login-container {
            max-width: 400px;
            margin: 0 auto;
        }
        .stButton > button {
            width: 100%;
            background-color: #0066cc;
            color: white;
            font-weight: bold;
        }
        .stTabs [data-baseweb="tab-list"] {
            gap: 1px;
        }
        </style>
    """, unsafe_allow_html=True)
    
    col1, col2, col3 = st.columns([1, 2, 1])
    with col2:
        st.title("👤 Candidate Portal")
        st.subheader("Umang Staffing Solutions")
        st.write("Find your next opportunity")
    
    # Tabs for Login and Register
    tab1, tab2 = st.tabs(["Login", "Register"])
    
    with tab1:
        st.header("Login")
        with st.form("candidate_login_form"):
            email = st.text_input("Email Address", placeholder="your.email@example.com")
            password = st.text_input("Password", type="password", placeholder="Any password works in demo mode")
            
            submit_button = st.form_submit_button("Login", use_container_width=True)
            
            if submit_button:
                if email and password:
                    candidate = authenticate_candidate(email)
                    if candidate:
                        st.session_state.candidate_logged_in = True
                        st.session_state.candidate_id = candidate['CandidateID']
                        st.session_state.candidate_name = f"{candidate['FirstName']} {candidate['LastName']}"
                        st.session_state.candidate_email = candidate['Email']
                        st.session_state.candidate_data = candidate
                        st.success("✅ Login successful!")
                        st.balloons()
                        st.rerun()
                    else:
                        st.error("❌ Email not found. Please register first.")
                else:
                    st.warning("Please enter email and password")
        
        st.info("💡 Demo Mode: Any password will work for registered candidates")
    
    with tab2:
        st.header("Register")
        with st.form("candidate_register_form"):
            col1, col2 = st.columns(2)
            with col1:
                first_name = st.text_input("First Name")
            with col2:
                last_name = st.text_input("Last Name")
            
            email = st.text_input("Email Address", placeholder="your.email@example.com")
            phone = st.text_input("Phone", placeholder="123-456-7890")
            
            col1, col2 = st.columns(2)
            with col1:
                city = st.text_input("City")
            with col2:
                state = st.selectbox("State", ["AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA", 
                                               "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD",
                                               "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ",
                                               "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC",
                                               "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY", "DC"])
            
            resume_url = st.text_input("Resume URL", placeholder="https://your-resume-link.com/resume.pdf")
            password = st.text_input("Password", type="password")
            password_confirm = st.text_input("Confirm Password", type="password")
            
            submit_button = st.form_submit_button("Register", use_container_width=True)
            
            if submit_button:
                if not all([first_name, last_name, email, phone, city, state]):
                    st.error("❌ Please fill in all required fields")
                elif password != password_confirm:
                    st.error("❌ Passwords do not match")
                elif len(password) < 6:
                    st.error("❌ Password must be at least 6 characters")
                else:
                    success, message = register_candidate(email, first_name, last_name, phone, city, state, resume_url, password)
                    if success:
                        st.success(f"✅ {message}")
                        st.info("Please login with your new account")
                    else:
                        st.error(f"❌ {message}")

def show_candidate_logout_button():
    """Show logout button in sidebar for candidate"""
    with st.sidebar:
        st.divider()
        col1, col2 = st.columns([3, 1])
        
        with col1:
            st.write(f"👤 **{st.session_state.candidate_name}**")
            st.caption(st.session_state.candidate_email)
        
        with col2:
            if st.button("🚪 Logout"):
                st.session_state.candidate_logged_in = False
                st.session_state.candidate_id = None
                st.session_state.candidate_name = None
                st.session_state.candidate_email = None
                st.session_state.candidate_data = None
                st.rerun()

def check_candidate_login():
    """Check if candidate is logged in, redirect to login if not"""
    if "candidate_logged_in" not in st.session_state:
        st.session_state.candidate_logged_in = False
    
    if not st.session_state.candidate_logged_in:
        display_candidate_login_page()
        st.stop()
