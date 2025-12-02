#!/usr/bin/env bash

# Umang Staffing Solutions - Startup Script
# This script helps you start the candidate or employee portal

echo "🎉 Umang Staffing Solutions - Portal Launcher"
echo "=============================================="
echo ""

# Check if MySQL is running
echo "📋 Checking MySQL status..."
if ! pgrep -x "mysql" > /dev/null 2>&1; then
    echo "⚠️  MySQL is not running"
    echo "Starting MySQL..."
    brew services start mysql
    sleep 2
    echo "✅ MySQL started"
else
    echo "✅ MySQL is running"
fi

echo ""
echo "Choose which portal to run:"
echo ""
echo "1️⃣  Employee Portal (app.py) - For HR Staff"
echo "2️⃣  Candidate Portal (candidate_app.py) - For Job Seekers"
echo "3️⃣  Exit"
echo ""

read -p "Enter your choice (1-3): " choice

case $choice in
    1)
        echo ""
        echo "🚀 Starting Employee Portal..."
        echo "📍 Access at: http://localhost:8501"
        echo "📧 Login with: emily.johnson@staffingco.com (any password)"
        echo ""
        streamlit run app.py
        ;;
    2)
        echo ""
        echo "🚀 Starting Candidate Portal..."
        echo "📍 Access at: http://localhost:8501"
        echo "📧 Login/Register with candidate email"
        echo ""
        streamlit run candidate_app.py
        ;;
    3)
        echo "👋 Goodbye!"
        exit 0
        ;;
    *)
        echo "❌ Invalid choice. Please run the script again."
        exit 1
        ;;
esac
