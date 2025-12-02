import streamlit as st
import mysql.connector

# This decorator is CRITICAL. It ensures we open the connection only once.
@st.cache_resource
def get_connection():
    """
    Establishes a connection to the MySQL database using 
    credentials from .streamlit/secrets.toml
    """
    return mysql.connector.connect(
        host=st.secrets["mysql"]["host"],
        user=st.secrets["mysql"]["user"],
        password=st.secrets["mysql"]["password"],
        database=st.secrets["mysql"]["database"],
        port=st.secrets["mysql"]["port"]
    )