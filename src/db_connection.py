import streamlit as st
import mysql.connector
from mysql.connector import Error

@st.cache_resource
def get_connection():
    """
    Establishes a connection to the MySQL database using 
    credentials from .streamlit/secrets.toml
    """
    try:
        connection = mysql.connector.connect(
            host=st.secrets["mysql"]["host"],
            user=st.secrets["mysql"]["user"],
            password=st.secrets["mysql"]["password"],
            database=st.secrets["mysql"]["database"],
            port=st.secrets["mysql"]["port"]
        )
        
        # Verify connection is active
        if connection.is_connected():
            st.success("✓ Database connected successfully")
            return connection
            
    except Error as e:
        st.error(f"Database connection failed: {e}")
        return None
    except KeyError as e:
        st.error(f"Missing secret configuration: {e}")
        return None