import streamlit as st
from src.db_connection import get_connection
import mysql.connector
from mysql.connector import Error

# Page configuration
st.set_page_config(
    page_title="Umang Staffing Solutions",
    page_icon="👔",
    layout="wide",
    initial_sidebar_state="expanded"
)

# Custom CSS
st.markdown("""
    <style>
    .main-header {
        color: #1f77b4;
        text-align: center;
        margin-bottom: 30px;
    }
    .success-box {
        background-color: #d4edda;
        padding: 15px;
        border-radius: 5px;
        border-left: 4px solid #28a745;
    }
    .info-box {
        background-color: #d1ecf1;
        padding: 15px;
        border-radius: 5px;
        border-left: 4px solid #17a2b8;
    }
    </style>
""", unsafe_allow_html=True)

# Initialize session state
if 'logged_in' not in st.session_state:
    st.session_state.logged_in = False
if 'page' not in st.session_state:
    st.session_state.page = "Home"

# Sidebar Navigation
st.sidebar.title("🔷 Umang Staffing Solutions")
st.sidebar.markdown("---")

if not st.session_state.logged_in:
    st.sidebar.info("Please test the database connection first.")
else:
    st.sidebar.success("✓ Database Connected")

# Main Navigation Menu
page = st.sidebar.radio(
    "Navigation",
    ["Home", "Candidates", "Clients", "Job Applications", "Placements", "Settings"],
    key="nav_radio"
)

st.session_state.page = page

# Home Page
if page == "Home":
    st.markdown('<h1 class="main-header">👔 Umang Staffing Solutions</h1>', unsafe_allow_html=True)
    
    col1, col2, col3 = st.columns(3)
    
    with col1:
        st.metric("Total Candidates", "0", help="Total registered candidates")
    with col2:
        st.metric("Active Jobs", "0", help="Currently open positions")
    with col3:
        st.metric("Placements", "0", help="Successful placements")
    
    st.markdown("---")
    
    # Test Database Connection
    st.subheader("🔗 Database Connection Status")
    
    col1, col2 = st.columns(2)
    
    with col1:
        if st.button("Test Database Connection", use_container_width=True):
            try:
                connection = get_connection()
                if connection and connection.is_connected():
                    st.session_state.logged_in = True
                    st.success("✓ Successfully connected to database!")
                    
                    # Get database info
                    cursor = connection.cursor()
                    cursor.execute("SELECT DATABASE();")
                    db_name = cursor.fetchone()[0]
                    
                    cursor.execute("SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = %s", (db_name,))
                    table_count = cursor.fetchone()[0]
                    
                    st.markdown(f"""
                    <div class="success-box">
                    <strong>Database Info:</strong><br>
                    Database: {db_name}<br>
                    Tables: {table_count}
                    </div>
                    """, unsafe_allow_html=True)
                    
                    cursor.close()
                else:
                    st.error("❌ Connection failed. Check your credentials.")
            except Error as e:
                st.error(f"❌ Database Error: {e}")
            except KeyError as e:
                st.error(f"❌ Configuration Error: Missing {e}")
    
    with col2:
        if st.button("Reset Connection", use_container_width=True):
            st.session_state.logged_in = False
            st.info("Connection reset. Click 'Test Connection' to reconnect.")
    
    st.markdown("---")
    st.info("📋 Use the navigation menu to access different modules of the staffing solution.")

# Candidates Page
elif page == "Candidates":
    st.title("👤 Candidates Management")
    
    if not st.session_state.logged_in:
        st.warning("⚠️ Please test the database connection from Home page first.")
    else:
        tab1, tab2, tab3 = st.tabs(["Search", "Add New", "View All"])
        
        with tab1:
            st.subheader("Search Candidates")
            search_query = st.text_input("Enter candidate email or name:")
            if st.button("Search"):
                st.info("Search functionality to be implemented")
        
        with tab2:
            st.subheader("Add New Candidate")
            st.text_input("First Name")
            st.text_input("Last Name")
            st.text_input("Email")
            st.text_input("Phone")
            if st.button("Add Candidate"):
                st.info("Add candidate functionality to be implemented")
        
        with tab3:
            st.subheader("All Candidates")
            st.info("View all candidates functionality to be implemented")

# Clients Page
elif page == "Clients":
    st.title("🏢 Clients Management")
    
    if not st.session_state.logged_in:
        st.warning("⚠️ Please test the database connection from Home page first.")
    else:
        tab1, tab2, tab3 = st.tabs(["Search", "Add New", "View All"])
        
        with tab1:
            st.subheader("Search Clients")
            search_query = st.text_input("Enter client name or industry:")
            if st.button("Search"):
                st.info("Search functionality to be implemented")
        
        with tab2:
            st.subheader("Add New Client")
            st.text_input("Company Name")
            st.text_input("Industry")
            st.text_input("Contact Person")
            st.text_input("Email")
            if st.button("Add Client"):
                st.info("Add client functionality to be implemented")
        
        with tab3:
            st.subheader("All Clients")
            st.info("View all clients functionality to be implemented")

# Job Applications Page
elif page == "Job Applications":
    st.title("📋 Job Applications")
    
    if not st.session_state.logged_in:
        st.warning("⚠️ Please test the database connection from Home page first.")
    else:
        st.subheader("Active Job Applications")
        st.info("Job applications view functionality to be implemented")

# Placements Page
elif page == "Placements":
    st.title("✅ Placements")
    
    if not st.session_state.logged_in:
        st.warning("⚠️ Please test the database connection from Home page first.")
    else:
        st.subheader("Placement History")
        st.info("Placement history functionality to be implemented")

# Settings Page
elif page == "Settings":
    st.title("⚙️ Settings")
    
    st.subheader("Database Configuration")
    st.info("Current database credentials are stored in `.streamlit/secrets.toml`")
    
    col1, col2 = st.columns(2)
    with col1:
        if st.button("View Database Status"):
            try:
                connection = get_connection()
                if connection and connection.is_connected():
                    st.success("✓ Database is connected")
                    cursor = connection.cursor()
                    cursor.execute("SELECT DATABASE();")
                    db_name = cursor.fetchone()[0]
                    st.write(f"Connected to: **{db_name}**")
                    cursor.close()
            except Error as e:
                st.error(f"Error: {e}")
    
    with col2:
        if st.button("Clear Cache"):
            st.cache_resource.clear()
            st.success("✓ Cache cleared!")
    
    st.markdown("---")
    st.subheader("Application Info")
    st.write("**Version:** 1.0.0")
    st.write("**Framework:** Streamlit")
    st.write("**Database:** MySQL")

# Footer
st.markdown("---")
st.markdown(
    "<p style='text-align: center; color: gray; font-size: 12px;'>"
    "Umang Staffing Solutions © 2025 | All Rights Reserved"
    "</p>",
    unsafe_allow_html=True
)
