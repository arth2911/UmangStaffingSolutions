# Employee Login System - Setup Guide

## 🚀 Quick Start

### 1. Ensure Database is Running
```bash
# Check if MySQL is running
brew services list | grep mysql

# Start if needed
brew services start mysql
```

### 2. Install Dependencies
```bash
pip install streamlit mysql-connector-python pandas
```

### 3. Run the Application
```bash
streamlit run app.py
```

The app will open at `http://localhost:8501`

## 🔐 Login Credentials

The system uses employee emails from the HR table. Use any of these test accounts:

| Email | Employee Name |
|-------|---------------|
| emily.johnson@staffingco.com | Emily Johnson |
| michael.smith@staffingco.com | Michael Smith |
| jessica.williams@staffingco.com | Jessica Williams |
| christopher.brown@staffingco.com | Christopher Brown |
| ashley.jones@staffingco.com | Ashley Jones |

**Password:** Any value (demo mode - accepts any password)

## ✨ Features

### ✅ Login System
- Professional employee login page
- Email-based authentication
- Session management
- Logout functionality with secure session clearing

### ✅ Dashboard
- Real-time metrics (Clients, Candidates, Active Jobs, Placements)
- Recent job postings
- Recent placements overview
- Database connection status

### ✅ Candidates Management
- View all candidates with skills
- Search candidates by skill
- Manage candidate information
- Download candidate data as CSV

### ✅ Clients Management
- View all clients
- Filter technology/IT companies
- View client details and contact information
- Download client data

### ✅ Jobs Management
- View all job postings
- Filter by job status (Open/Closed)
- Filter by job type (Full-Time, Contract, Temp-to-Hire)
- Search by job title
- View job statistics and pay rates

### ✅ Placements Management
- View all placements
- View placement history by candidate
- Track placement pay rates
- View placement statistics

### ✅ Custom Queries
- Execute custom SQL queries
- Download query results
- Sample queries provided

## 🔍 Database Tables Managed

- **Candidates**: Employee candidates with resume URLs and contact info
- **Clients**: Companies requesting staffing solutions
- **HR**: Internal HR staff (login users)
- **JOBS**: Job postings from clients
- **PLACEMENTS**: Successful placements linking candidates to jobs
- **CANDIDATE_SKILLS**: Skills assigned to candidates
- **Skills**: Available skill categories

## 📋 What Employees Can Do

1. **View Dashboard** - See key metrics and recent activity
2. **Manage Candidates** - Search, view, and filter candidates by skills
3. **Manage Clients** - View and filter clients by industry
4. **Browse Jobs** - See all job postings with filters and statistics
5. **Track Placements** - Monitor successful placements and placement history
6. **Execute Custom Queries** - Run custom SQL queries for detailed analysis

## 🔒 Security Notes

**Current Implementation (Demo Mode):**
- Email verification only
- Password accepts any value
- Suitable for development and testing

**For Production, Add:**
- Password hashing (bcrypt/werkzeug)
- Session timeout
- Audit logging
- Role-based access control
- Two-factor authentication
- HTTPS encryption

## 🐛 Troubleshooting

### "Can't connect to MySQL"
- Ensure XAMPP is running: `brew services list | grep mysql`
- Check database exists: `mysql -u root -e "SHOW DATABASES;"`
- Verify database name is `staffing_db`

### "Invalid email or password"
- Use exact email from HR table
- Verify database was imported correctly
- Check HR table has data: `mysql -u root -e "SELECT COUNT(*) FROM staffing_db.HR;"`

### "Login page keeps showing"
- Clear Streamlit cache: Press `C` in app
- Check browser cookies are enabled
- Restart Streamlit: `Ctrl+C` and run again

### Column errors in queries
- Verify database schema matches column names (case-sensitive)
- Use capital letters for table names
- Check that all required tables are created

## 📞 Support

Check the main README.md for comprehensive documentation on:
- Installation steps
- Database schema details
- Feature descriptions
- Advanced configuration

---

**Ready to use!** Login with any test email and explore the dashboard.
