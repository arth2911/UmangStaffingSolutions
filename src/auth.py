import streamlit as st
import mysql.connector
from mysql.connector import Error
import pandas as pd
import hashlib

def get_connection():
    """Create a MySQL database connection"""
    try:
        conn = mysql.connector.connect(
            host="localhost",
            user="root",
            password="",
            database="Umang_Staffing_db",
            port=3306
        )
        return conn
    except Error as e:
        print(f"Database connection error: {e}")
        return None


def hash_password(password):
    """Hash password using SHA256"""
    return hashlib.sha256(password.encode()).hexdigest()


def authenticate_employee(email, password):
    """Authenticate an employee using email and password"""
    try:
        conn = get_connection()
        if conn and conn.is_connected():
            cursor = conn.cursor(dictionary=True)
            
            query = """
            SELECT HR_ID, FirstName, LastName, Email, ClientID
            FROM HR
            WHERE Email = %s
            """
            
            cursor.execute(query, (email,))
            employee = cursor.fetchone()
            cursor.close()
            conn.close()
            
            # For demo purposes, accept any password if email exists
            # In production, implement proper password hashing
            if employee:
                return employee
            return None
        return None
    except Error as e:
        print(f"Database error: {e}")
        return None


def get_employee_by_id(hr_id):
    """Get employee details by HR_ID"""
    try:
        conn = get_connection()
        if conn and conn.is_connected():
            cursor = conn.cursor(dictionary=True)
            
            query = """
            SELECT HR_ID, FirstName, LastName, Email, ClientID
            FROM HR
            WHERE HR_ID = %s
            """
            
            cursor.execute(query, (hr_id,))
            employee = cursor.fetchone()
            cursor.close()
            conn.close()
            
            return employee
        return None
    except Error as e:
        print(f"Database error: {e}")
        return None


def display_login_page():
    """Display professional login page"""
    # Set page config for login
    st.set_page_config(
        page_title="Umang Staffing Solutions - Employee Login",
        page_icon="👔",
        layout="centered",
        initial_sidebar_state="collapsed"
    )
    
    # Custom CSS
    st.markdown("""
    <style>
    .login-container {
        max-width: 450px;
        margin: 50px auto;
        padding: 40px;
        border-radius: 15px;
        background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
        box-shadow: 0 10px 40px rgba(0,0,0,0.1);
    }
    .login-header {
        text-align: center;
        color: #1f77b4;
        margin-bottom: 10px;
        font-size: 32px;
    }
    .login-subtitle {
        text-align: center;
        color: #666;
        margin-bottom: 30px;
        font-size: 14px;
    }
    .demo-info {
        background-color: #e3f2fd;
        border-left: 4px solid #1976d2;
        padding: 15px;
        border-radius: 5px;
        margin-top: 20px;
    }
    </style>
    """, unsafe_allow_html=True)
    
    col1, col2, col3 = st.columns([1, 2, 1])
    
    with col2:
        st.markdown('<div class="login-container">', unsafe_allow_html=True)
        st.markdown('<div class="login-header">👔</div>', unsafe_allow_html=True)
        st.markdown('<h2 style="text-align: center; color: #1f77b4; margin-top: 0;">Umang Staffing Solutions</h2>', unsafe_allow_html=True)
        st.markdown('<div class="login-subtitle">Employee Management Portal</div>', unsafe_allow_html=True)
        
        st.divider()
        
        # Login form
        with st.form("login_form", clear_on_submit=False):
            st.write("**Sign in to your account**")
            
            email = st.text_input(
                "Email Address",
                placeholder="employee@staffingco.com",
                help="Enter your company email"
            )
            
            password = st.text_input(
                "Password",
                type="password",
                placeholder="Enter your password"
            )
            
            if st.form_submit_button("🔐 Login", use_container_width=True, type="primary"):
                if email and password:
                    employee = authenticate_employee(email, password)
                    
                    if employee:
                        st.session_state.is_logged_in = True
                        st.session_state.employee = employee
                        st.session_state.employee_id = employee['HR_ID']
                        st.session_state.employee_name = f"{employee['FirstName']} {employee['LastName']}"
                        st.session_state.employee_email = employee['Email']
                        
                        st.success("✅ Login successful!")
                        st.rerun()
                    else:
                        st.error("❌ Invalid email or password")
                else:
                    st.warning("⚠️ Please enter both email and password")
        
        st.markdown('</div>', unsafe_allow_html=True)
        
        # Demo credentials
        st.markdown("""
        <div class="demo-info">
        <b>Demo Credentials:</b><br>
        Use any email from the database:<br>
        • emily.johnson@staffingco.com<br>
        • michael.smith@staffingco.com<br>
        • jessica.williams@staffingco.com<br>
        <i>Password: any value (demo mode)</i>
        </div>
        """, unsafe_allow_html=True)


def show_logout_button():
    """Show employee info and logout button in sidebar"""
    with st.sidebar:
        # Employee info section
        st.markdown("---")
        col1, col2 = st.columns([2, 1])
        
        with col1:
            st.write(f"**👤 {st.session_state.employee_name}**")
            st.caption(st.session_state.employee_email)
        
        with col2:
            if st.button("🔓", help="Logout", use_container_width=True):
                # Clear session
                st.session_state.is_logged_in = False
                st.session_state.employee = None
                st.session_state.employee_id = None
                st.session_state.employee_name = None
                st.session_state.employee_email = None
                
                st.success("✅ Logged out successfully")
                st.rerun()


def check_login():
    """Check if user is logged in, redirect to login if not"""
    if 'is_logged_in' not in st.session_state:
        st.session_state.is_logged_in = False
    
    if not st.session_state.is_logged_in:
        display_login_page()
        st.stop()
