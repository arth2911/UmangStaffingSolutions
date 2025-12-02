# 🚀 Quick Start Guide - Umang Staffing Solutions

## 30-Second Setup

### 1. Start MySQL
```bash
brew services start mysql
```

### 2. Install Dependencies (One-Time)
```bash
pip install -r requirements.txt
```

### 3. Choose Your Portal

#### For HR/Staff:
```bash
streamlit run app.py
```
👉 Open: http://localhost:8501
📧 Login: emily.johnson@staffingco.com (any password)

#### For Job Candidates:
```bash
streamlit run candidate_app.py
```
👉 Open: http://localhost:8501
📋 Register or login with existing candidate email

---

## 🎯 What You Can Do

### 👔 Employee Portal
- View candidates with skills and resumes
- Manage jobs and postings
- Track placements
- Generate reports

### 👤 Candidate Portal
- Search active jobs
- Add skills (60+ available)
- Upload resume
- Apply for jobs
- Check application status

---

## 🐛 If Something Goes Wrong

| Problem | Fix |
|---------|-----|
| "Database connection error" | `brew services start mysql` |
| "Table doesn't exist" | Reimport schema: `mysql -u root staffing_db < database/schema/UmangStaffingDataBase.sql` |
| Port 8501 in use | Kill it: `lsof -ti:8501 \| xargs kill -9` |
| Import errors | Clear cache: Press `C` in Streamlit app |

---

## 📖 Full Documentation

- **SYSTEM_README.md** - Complete system overview
- **CANDIDATE_PORTAL_GUIDE.md** - Candidate features
- **EMPLOYEE_LOGIN_GUIDE.md** - Employee features
- **DEPLOYMENT_CHECKLIST.md** - Verification steps

---

**That's it! You're ready to go! 🎉**
