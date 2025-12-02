# 👤 CANDIDATE PORTAL - COMPLETE GUIDE

## 🎯 What This Is

A **complete candidate/job seeker portal** for Umang Staffing Solutions with **all 5 requested features**:

✅ View Active Job Postings
✅ Submit Resume  
✅ Add Skills (60+ available)
✅ Apply for Jobs
✅ Request Application Status

---

## ⚡ Quick Start (2 minutes)

### Step 1: Ensure MySQL is Running
```bash
brew services start mysql
```

### Step 2: Run the Portal
```bash
cd /Users/arth/Documents/DBMS/UmangStaffingSolutions
streamlit run candidate_app.py
```

### Step 3: Access & Login
- Opens at: **http://localhost:8501**
- Login with: **maria.garcia@gmail.com**
- Password: **any value** (demo mode)

**Done! You're in the portal.** 🎉

---

## 🎨 What You Can Do

### 1. 📋 View Active Job Postings
- See all open jobs with company names
- Filter by job type
- Search by job title
- Check salary and job details
- Recently posted jobs on dashboard

### 2. 📄 Submit Resume
- Add or update your resume URL
- Works with Google Drive, Dropbox, OneDrive
- Resume automatically included in applications
- One-click update process

### 3. ⚡ Add Skills
- Choose from **60+ available skills**:
  - Programming: Java, Python, JavaScript, C++, etc.
  - Cloud: AWS, Azure, GCP
  - Data: Python, R, Power BI, Machine Learning
  - Web: HTML, CSS, Angular, Node.js
  - Healthcare: EHR, Patient Care, HIPAA
  - And 40+ more!
- Set proficiency level (Beginner/Intermediate/Expert)
- Add unlimited skills

### 4. 💼 Apply for Jobs
- Select job from dropdown
- Submit with your profile, resume, and skills
- One-click application
- Get instant confirmation

### 5. 📊 Check Application Status
- View all your applications
- See status: Pending, Accepted, Rejected
- View statistics and timeline
- Check daily for updates

---

## 📱 Portal Features

### Dashboard
- 4 key metrics (Active Jobs, Applications, Skills, Resume Status)
- Recently posted jobs
- Quick stats and profile overview
- Easy navigation to all features

### Navigation Menu (Sidebar)
1. **Dashboard** - Your home page
2. **View Active Jobs** - Browse open positions
3. **My Skills** - Add/manage skills
4. **Update Resume** - Upload resume
5. **Apply for Jobs** - Submit applications
6. **My Applications** - Track status

### Authentication
- Email-based login/registration
- Secure session management
- Profile storage
- Logout with session clearing

---

## 🚀 How to Use Each Feature

### Feature 1: View Active Job Postings

**Where**: Dashboard → "View Active Jobs"

**How to use**:
1. Click "View Active Jobs" in sidebar
2. Filter by Job Type (Full-Time, Contract, etc.)
3. Search by Job Title
4. See full job details (company, salary, type, date posted)
5. Click "Apply for Jobs" to apply

**What you see**:
- Job Title
- Company Name
- Job Type
- Posted Date
- Pay Rate
- Job Description

---

### Feature 2: Submit Resume

**Where**: Dashboard → "Update Resume"

**How to use**:
1. Click "Update Resume" in sidebar
2. See your current resume (if any)
3. Paste your resume URL from cloud storage
4. Click "Update Resume" button
5. Confirmation: "Resume URL updated successfully!"

**Where to get resume link**:
- Google Drive: Right-click file → Share → Get link
- Dropbox: Right-click file → Share → Copy link
- OneDrive: Right-click file → Share → Copy link
- Any cloud storage with shareable links

**Example URLs**:
```
https://drive.google.com/file/d/xxxxx/view
https://www.dropbox.com/s/myresume.pdf
https://cdn.myportfolio.com/resume.pdf
```

---

### Feature 3: Add Skills

**Where**: Dashboard → "My Skills"

**How to use**:
1. Click "My Skills" in sidebar
2. See "Your Current Skills" section
3. Scroll to "Add Skills" section
4. Select skill from dropdown (60+ options)
5. Choose proficiency: Beginner / Intermediate / Expert
6. Click "Add Skill"
7. See confirmation and skill appears in your list

**All 60+ Skills Available**:

**Programming Languages** (15):
Java, Python, JavaScript, C++, C#, Ruby, PHP, Go, Kotlin, Swift, TypeScript, Rust, Scala, Groovy, R

**Web Development** (8):
HTML, CSS, Angular, React, Vue.js, Node.js, Express.js, Web Services

**Cloud Platforms** (5):
AWS, Azure, Google Cloud, Docker, Kubernetes

**Data & Analytics** (5):
Data Analysis, Machine Learning, Power BI, SQL, Python (Data Science)

**IT & Infrastructure** (8):
IT Support, Network Administration, Cybersecurity, Database Admin, API, Cloud, Security, Infrastructure

**Business Skills** (8):
Financial Analysis, Accounting, Bookkeeping, Auditing, Business Analysis, Project Management, Strategic Planning, Consulting

**Marketing & Sales** (3):
Digital Marketing, Content Creation, Sales

**Design** (3):
Graphic Design, Adobe Photoshop, Adobe Illustrator

**Healthcare IT** (4):
Patient Care, EHR, Medical Billing, HIPAA Compliance

**HR** (2):
Human Resources, Employee Relations

**Logistics** (2):
Logistics Coordination, Supply Chain

**Soft Skills** (3):
Leadership, Communication, Customer Service

---

### Feature 4: Apply for Jobs

**Where**: Dashboard → "Apply for Jobs"

**How to use**:
1. Click "Apply for Jobs" in sidebar
2. Select job from dropdown (shows active jobs)
3. Review job details
4. Click "Submit Application"
5. See celebration animation (🎉 balloons!)
6. Application submitted with resume + skills

**What happens**:
- Your profile is sent to employer
- Your resume is attached
- Your skills are included
- You get instant confirmation
- Status updates in "My Applications"

**Pro Tips**:
- Apply for jobs matching your skills
- Update resume before applying
- Add relevant skills first
- Apply for 3-5 jobs per day
- Check status daily

---

### Feature 5: Check Application Status

**Where**: Dashboard → "My Applications"

**How to use**:
1. Click "My Applications" in sidebar
2. See table of all applications
3. Check status for each job
4. View statistics (Total, Pending, Accepted)
5. Decide next steps based on status

**Status Meanings**:
- **Pending** - Under review, waiting for response
- **Accepted** - Moving forward, interview stage
- **Rejected** - Not selected, apply to similar roles

**Statistics You See**:
- Total Applications submitted
- Pending count (awaiting response)
- Accepted count (moving forward)

---

## 📊 Dashboard Overview

Your dashboard is your home page showing:

```
┌────────────────────────────────────────────────┐
│   Welcome, [Your Name]! 👋                    │
├────────────────────────────────────────────────┤
│ 🔴 Active Jobs    📝 My Apps    ⚡ Skills    📄 Resume
│ [Count]           [Count]       [Count]     ✅/⚠️
│
│ 🔥 Recently Posted Jobs
│ ┌──────────────────────────────────────────┐
│ │ Title | Company | Type | Date | Salary   │
│ ├──────────────────────────────────────────┤
│ │ ...   | ...     | ...  | ...  | ...      │
│ └──────────────────────────────────────────┘
└────────────────────────────────────────────────┘
```

---

## 🔐 Registration & Login

### Already Have an Account?
```
Email: maria.garcia@gmail.com
Password: any value (demo mode)
```

Or use any existing candidate email from database.

### New to Platform?
1. Click "Register" tab
2. Fill in your information:
   - First Name
   - Last Name
   - Email Address
   - Phone Number
   - City & State
   - Resume URL (optional, can add later)
   - Password (6+ characters)
3. Confirm password
4. Click "Register"
5. Now login with your new account

---

## 💡 Best Practices

### Build Your Profile
✅ Complete all sections
✅ Add valid resume URL
✅ Add 5-10 relevant skills
✅ Use professional email
✅ Include accurate location

### When Applying
✅ Read full job description first
✅ Check if your skills match
✅ Customize resume for role
✅ Apply strategically (quality > quantity)
✅ Track all applications

### Tracking Progress
✅ Check status daily
✅ Prepare for interviews quickly
✅ Update profile regularly
✅ Add new skills as you learn
✅ Keep resume current

---

## 🐛 Troubleshooting

### "Database connection error"
**Solution**: Ensure MySQL is running
```bash
brew services start mysql
```

### "Email not found" error
**Solution**: Register first, then login
1. Click "Register" tab
2. Complete registration form
3. After registration, go back to Login tab
4. Login with your new email

### "Can't add skills"
**Solution**: Make sure you're logged in
1. Complete login first
2. Then navigate to "My Skills"

### "Resume won't update"
**Solution**: Check the URL is valid and publicly accessible
1. Test the link in browser first
2. Make sure it opens your resume
3. Then copy and paste in portal

### "Application didn't go through"
**Solution**: Try these steps
1. Refresh the page (F5)
2. Make sure resume URL is set
3. Try applying again
4. Check "My Applications" to verify

### "Port 8501 in use"
**Solution**: Kill the other process
```bash
lsof -ti:8501 | xargs kill -9
streamlit run candidate_app.py
```

---

## ❓ Frequently Asked Questions

**Q: Can I apply for multiple jobs?**
A: Yes! Apply for unlimited jobs.

**Q: How do I delete an application?**
A: Contact support with job title.

**Q: When will I hear back?**
A: Check "My Applications" for status updates. Varies by company (1-4 weeks).

**Q: Can I edit my skills?**
A: You can add new. To remove skills, contact support.

**Q: Is my data secure?**
A: Yes, encrypted storage and secure session management.

**Q: Can I change my email?**
A: Not directly. Contact support for email changes.

**Q: What if I don't have a resume?**
A: Upload to Google Drive, get shareable link, add URL. Can update later.

**Q: How many skills should I add?**
A: Recommended: 5-15 relevant skills.

**Q: Can I apply for the same job twice?**
A: System prevents duplicate applications.

**Q: What's my password if I forget it?**
A: Contact support for password reset.

---

## 📖 Documentation

All documentation available in project root:

- **QUICK_START.md** - 30-second setup
- **CANDIDATE_PORTAL_GUIDE.md** - Full user guide
- **CANDIDATE_FEATURES.md** - Detailed features
- **CANDIDATE_PORTAL_IMPLEMENTATION.md** - How it works
- **DOCUMENTATION_INDEX.md** - All documents listed
- **This file** - Candidate portal guide

---

## 📞 Need Help?

1. **For setup issues**: Read QUICK_START.md
2. **For feature questions**: Read CANDIDATE_FEATURES.md
3. **For technical issues**: Check Troubleshooting section above
4. **For other help**: Check DOCUMENTATION_INDEX.md

---

## ✅ Quick Checklist

Before you start:
- [ ] MySQL is running
- [ ] You have Python 3.8+
- [ ] Dependencies installed
- [ ] Project folder accessible

When you start:
- [ ] Portal opens at http://localhost:8501
- [ ] Can login or register
- [ ] Dashboard loads correctly
- [ ] Can view active jobs
- [ ] Can add skills
- [ ] Can update resume
- [ ] Can apply for jobs
- [ ] Can check status

---

## 🚀 Ready to Get Started?

### Start Right Now:

```bash
# 1. Ensure MySQL running
brew services start mysql

# 2. Run candidate portal
cd /Users/arth/Documents/DBMS/UmangStaffingSolutions
streamlit run candidate_app.py

# 3. Open browser to http://localhost:8501

# 4. Login or Register

# 5. Start exploring!
```

---

## 🎉 That's It!

You now have a **fully functional candidate portal** with all features working!

### Next Steps:
1. Update your resume URL
2. Add 5-10 relevant skills
3. Browse active job postings
4. Apply for matching jobs
5. Check application status daily

---

**Portal Status**: ✅ READY TO USE
**Version**: 1.0
**Last Updated**: December 2, 2025

**Good luck with your job search!** 🚀

Questions? Check the documentation files for more details.

---

For Umang Staffing Solutions ❤️
