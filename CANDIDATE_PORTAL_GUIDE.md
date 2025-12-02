# 👤 Candidate Portal - User Guide

## Overview

The Umang Staffing Solutions Candidate Portal is a dedicated platform for job candidates to:
- View active job postings
- Manage their skills (from 60+ available skills)
- Update their resume
- Apply for jobs
- Track application status

## Getting Started

### Starting the Candidate Portal

```bash
cd /Users/arth/Documents/DBMS/UmangStaffingSolutions
streamlit run candidate_app.py
```

The portal will open at `http://localhost:8501`

## Features

### 1. **Login & Registration**

#### For Existing Candidates
- Use your email address
- Enter any password (demo mode)
- Click "Login"

#### For New Candidates
- Click the "Register" tab
- Fill in all required fields:
  - First Name & Last Name
  - Email Address
  - Phone Number
  - City & State
  - Resume URL (link to your resume PDF)
  - Password (6+ characters)
- Confirm password and register

#### Demo Login Accounts

If you want to test the portal quickly, use any of these existing candidate emails:

```
maria.garcia@gmail.com
d.smith88@yahoo.com
jessica_chen@outlook.com
michael.williams@gmail.com
sjohnson@icloud.com
```

Password: Any value (demo mode)

### 2. **Dashboard**

Your home page shows:
- 🔴 **Active Jobs**: Count of open positions
- 📝 **My Applications**: Jobs you've applied to
- ⚡ **My Skills**: Number of skills you've added
- 📄 **Resume**: Status of your resume upload
- 🔥 Recently Posted Jobs (last 5 jobs)

### 3. **View Active Jobs**

Browse all open job postings with:
- **Filters**:
  - Job Type (Full-Time, Contract, Temp-to-Hire)
  - Job Title search
- **Information displayed**:
  - Job Title
  - Company Name
  - Job Type
  - Posted Date
  - Pay Rate
  - Job Description

### 4. **My Skills**

#### View Your Skills
See all skills you've added with proficiency levels:
- Beginner
- Intermediate
- Expert

#### Add New Skills
Choose from 60+ available skills:
- Select a skill from the dropdown
- Choose your proficiency level
- Click "Add Skill"

**Available Skills** (Sample):
- Programming: Java, Python, JavaScript, C++, C#, etc.
- Web: HTML, CSS, Angular, Node.js, etc.
- Cloud: AWS, Azure, Google Cloud Platform, etc.
- Data: Data Analysis, Machine Learning, Power BI, etc.
- Healthcare: EHR, Patient Care, HIPAA Compliance, etc.
- And 45+ more!

### 5. **Update Resume**

- View your current resume URL
- Update it by entering a new URL
- Your resume link must be publicly accessible

**Supported Resume Hosting**:
- Google Drive (share link)
- Dropbox
- OneDrive
- LinkedIn
- Personal portfolio
- Any cloud storage with shareable links

### 6. **Apply for Jobs**

- Browse all open positions
- Select a job to apply
- Submit application with your current profile
- Your skills and resume will be included in the application

### 7. **My Applications**

Track the status of all your applications:
- 📝 Pending applications
- ✅ Accepted/Approved
- ❌ Rejected (if applicable)
- View statistics and application timeline

## User Profile

Your profile includes:
- First Name & Last Name
- Email Address
- Phone Number
- City & State
- Resume URL
- Skills (with proficiency levels)

## Security & Privacy

- **Session Management**: Login required for access
- **Data Privacy**: Your information is securely stored
- **Password Protection**: Passwords are hashed (in production)
- **Logout**: Click logout button in sidebar to securely exit

## Tips & Best Practices

### For Best Results

1. **Complete Your Profile**
   - Add a resume URL immediately
   - Add at least 5 relevant skills
   - Use accurate location information

2. **Highlight Your Skills**
   - Focus on skills required by your target jobs
   - Be honest about proficiency levels
   - Add certifications and special skills

3. **Apply Strategic**
   - Apply for positions matching your skills
   - Customize your resume for each role
   - Check application status regularly

4. **Update Regularly**
   - Keep your resume current
   - Add new skills as you learn them
   - Update proficiency levels as you improve

## Troubleshooting

| Issue | Solution |
|-------|----------|
| "Email not found" error | You need to register first. Go to Register tab and create account |
| Can't add skills | Make sure you have registered and logged in |
| Resume URL won't update | Check that the link is publicly accessible and properly formatted |
| Can't see applied jobs | Try refreshing the page (press R or F5) |
| Database connection error | Make sure XAMPP MySQL is running: `brew services start mysql` |

## FAQ

**Q: Can I change my email after registration?**
A: Not yet. Contact support to change your email.

**Q: How many jobs can I apply for?**
A: Unlimited! Apply for as many jobs as you're interested in.

**Q: Can I edit my skills?**
A: You can add new skills. To remove or edit existing skills, contact support.

**Q: What if I don't have a resume URL?**
A: Upload your resume to cloud storage (Google Drive, Dropbox, etc.) and get a shareable link.

**Q: How long does it take to hear back?**
A: Varies by company. Check your application status in "My Applications" section.

**Q: Can I delete my account?**
A: Contact support to request account deletion.

## Contact & Support

For issues or questions:
- Email: support@umangstaffing.com
- Phone: 1-800-STAFFING
- Portal: Use the support chat in the portal

---

**Portal Version**: 1.0
**Last Updated**: December 2, 2025
**Status**: ✅ Live
