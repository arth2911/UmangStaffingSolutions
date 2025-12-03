# 🚀 Setup Guide - Find Matching Candidates Feature

## What This Feature Does

The **Find Matching Candidates** feature intelligently matches job requirements with candidate skills to help you quickly find the best candidates for open positions.

---

## Installation Steps

### Step 1: Install the Stored Procedure

Run this command in your terminal:

```bash
cd /Users/arth/Documents/DBMS/UmangStaffingSolutions
mysql -u root staffing_db < database/schema/procedures/sp_FindMatchingCandidates_v2.sql
```

**Expected Output**: No output means success ✅

### Step 2: Verify Installation

Check if the procedure was installed:

```bash
mysql -u root staffing_db -e "SHOW PROCEDURE STATUS WHERE Db='staffing_db' AND Name='sp_FindMatchingCandidates_v2';"
```

**Expected Output**:
```
| Db           | Name                          | Type      | ... |
| staffing_db  | sp_FindMatchingCandidates_v2  | PROCEDURE | ... |
```

### Step 3: Update Employee Portal

The employee portal (`app.py`) has already been updated with the new feature. Just restart the app:

```bash
streamlit run app.py
```

---

## Using the Feature

### 1. Login to Employee Portal
```
streamlit run app.py
```

### 2. Navigate to Jobs
Sidebar → "Jobs" page

### 3. Find Matching Candidates Tab
Click on "Find Matching Candidates" tab

### 4. Select Job & Set Match Percentage
- Select a job from dropdown
- Adjust minimum match % (default: 50%)
- Click "Find Matching Candidates"

### 5. Review Results
- See matching candidates ranked by fit
- View skill matches and proficiency levels
- Download results as CSV if needed

---

## Verification

### Quick Test

```sql
-- Test the procedure
CALL sp_FindMatchingCandidates_v2(3000, 50);
```

**Expected**: Returns candidates matching job 3000 with 50%+ skill match

---

## Frontend Implementation

### What Was Added to app.py

**1. New Tab in Jobs Page**
```
Tab 1: Job Listings (existing)
Tab 2: Find Matching Candidates (new)
```

**2. New Function**
```python
def find_matching_candidates(conn, job_id, min_match_percentage):
    """Call stored procedure to find matching candidates"""
```

**3. UI Components**
- Job selector dropdown
- Match percentage slider (0-100%)
- "Find Matching Candidates" button
- Results display with candidate cards
- CSV export button

---

## File Changes

### Modified Files
- ✅ `app.py` - Added matching candidates functionality

### New Documentation
- ✅ `MATCHING_CANDIDATES_GUIDE.md` - Feature documentation
- ✅ `MATCHING_CANDIDATES_SETUP.md` - This file

### Database Files
- ✅ `database/schema/procedures/sp_FindMatchingCandidates_v2.sql` - Stored procedure

---

## How It Works Behind the Scenes

### Stored Procedure Logic

```
1. Extract Required Skills
   ↓
   Search job title and description for skill names
   Match with Skills table

2. Find Matching Candidates
   ↓
   Query CANDIDATE_SKILLS table
   Compare with required skills

3. Calculate Match Percentage
   ↓
   (Matching Skills / Total Required Skills) × 100

4. Rank Results
   ↓
   Sort by match % (highest first)
   Then by proficiency level

5. Filter Candidates
   ↓
   Only show matches >= minimum %
   Exclude already-applied candidates

6. Return Results
   ↓
   CandidateID, Name, Email, Phone, Location
   Matching Skills, Match %, Proficiency
```

---

## Database Query (Behind the Scenes)

When you click "Find Matching Candidates", the app executes:

```sql
CALL sp_FindMatchingCandidates_v2(
    @p_JobID := 3001,              -- Selected job ID
    @p_MinMatchPercentage := 50    -- Minimum match % from slider
);
```

The procedure then:
1. Queries the JOBS table for job details
2. Extracts skills from job description
3. Finds candidates with those skills
4. Calculates match percentages
5. Returns ranked results

---

## Result Structure

Each result includes:

| Field | Example | Meaning |
|-------|---------|---------|
| CandidateID | 2001 | Unique candidate ID |
| CandidateName | Maria Garcia | Full name |
| Email | maria.garcia@gmail.com | Contact email |
| Phone | 703-555-1001 | Phone number |
| City | Arlington | City |
| State | VA | State |
| MatchingSkills | 4 | Skills candidate has that match |
| RequiredSkills | 5 | Total skills required by job |
| MatchPercentage | 80 | (4/5) × 100 = 80% |
| Skills | Python, SQL, AWS, Docker | Candidate's matching skills |
| MaxProficiencyLevel | 3 | Highest proficiency (1-4 scale) |

---

## Practical Examples

### Example 1: Python Developer Job

**Job**: Python Developer at TechCorp
```
Job Title: "Senior Python Developer"
Description: "We need Python, Django, PostgreSQL, Docker, Git"
Selected Job ID: 3001
Minimum Match: 50%
```

**Results**:
```
✓ David Smith - 100% match (5/5 skills)
  Skills: Python, Django, PostgreSQL, Docker, Git
  Max Proficiency: Expert

✓ Maria Garcia - 80% match (4/5 skills)
  Skills: Python, PostgreSQL, Docker, Git
  (Missing: Django)
  Max Proficiency: Intermediate

✓ Jessica Chen - 60% match (3/5 skills)
  Skills: Python, PostgreSQL, Git
  (Missing: Django, Docker)
  Max Proficiency: Intermediate
```

### Example 2: Data Analyst Position

**Job**: Data Analyst at Analytics Inc
```
Job Title: "Data Analyst"
Description: "SQL, Python, Power BI, Excel"
Selected Job ID: 3002
Minimum Match: 75%
```

**Results**:
```
✓ Michael Williams - 100% match (4/4 skills)
  Skills: SQL, Python, Power BI, Excel
  Max Proficiency: Expert

✓ Sarah Johnson - 75% match (3/4 skills)
  Skills: SQL, Python, Excel
  (Missing: Power BI)
  Max Proficiency: Intermediate

(Candidates below 75% not shown)
```

---

## Troubleshooting

### Issue: "No matching candidates found"

**Causes**:
1. No candidates with matching skills
2. Minimum match % too high
3. Job description doesn't mention skill names

**Solutions**:
- Lower the minimum match percentage
- Update job description with specific skill names
- Check if candidates have skills in their profiles

### Issue: "Error finding matching candidates"

**Causes**:
1. Stored procedure not installed
2. Database connection problem
3. Incorrect procedure name

**Solutions**:
1. Verify procedure is installed:
   ```bash
   mysql -u root staffing_db -e "SHOW PROCEDURE STATUS WHERE Name='sp_FindMatchingCandidates_v2';"
   ```

2. Reinstall if needed:
   ```bash
   mysql -u root staffing_db < database/schema/procedures/sp_FindMatchingCandidates_v2.sql
   ```

3. Check MySQL is running:
   ```bash
   brew services start mysql
   ```

### Issue: Procedure returns 0 results

**Causes**:
1. Job has no clearly matching skills in description
2. No candidates with required skills
3. All matching candidates already applied

**Solutions**:
1. Update job description with specific skill names
2. Check candidate skill profiles
3. Use 0% minimum match to see all candidates

---

## Database Prerequisites

### Required Tables
- ✅ JOBS - Job postings
- ✅ Candidates - Candidate profiles
- ✅ Skills - Master skill list (60+)
- ✅ CANDIDATE_SKILLS - Candidate skill mapping
- ✅ Clients - Company information
- ✅ ELIGIBLE_CANDIDATES - Applied candidates

### Required Data
- At least one open job (IsOpen = 1)
- At least one candidate with skills
- Skills must exist in Skills table

---

## Performance Optimization

### For Better Performance

1. **Index on CANDIDATE_SKILLS**
   ```sql
   CREATE INDEX idx_candidate_skills ON CANDIDATE_SKILLS(CandidateID, SkillID);
   ```

2. **Index on JOBS**
   ```sql
   CREATE INDEX idx_jobs_open ON JOBS(IsOpen);
   ```

3. **Index on Skills**
   ```sql
   CREATE INDEX idx_skills_name ON Skills(SkillName);
   ```

---

## Customization Options

### Adjusting Skill Extraction

To change how skills are extracted from job descriptions, modify the procedure:

```sql
-- Search for exact skill names (case-insensitive)
WHERE j.JobDescription LIKE CONCAT('%', s.SkillName, '%')

-- Or search for variations
WHERE j.JobDescription LIKE CONCAT('%', LOWER(s.SkillName), '%')
```

### Changing Match Calculation

To use weighted proficiency in match percentage:

```sql
-- Current: Simple count
MatchPercentage = (Count / Total) * 100

-- Weighted: Consider proficiency
MatchPercentage = (Sum of Proficiency Scores / Max Possible) * 100
```

---

## Next Steps

1. ✅ Run the installation command
2. ✅ Verify procedure installation
3. ✅ Restart the employee portal
4. ✅ Test with "Find Matching Candidates" tab
5. ✅ Review candidate matches
6. ✅ Download results for follow-up

---

## Support & Documentation

- **Feature Guide**: `MATCHING_CANDIDATES_GUIDE.md`
- **Setup Guide**: This file
- **Employee Portal**: `app.py`
- **Stored Procedure**: `database/schema/procedures/sp_FindMatchingCandidates_v2.sql`

---

## Summary

✅ **Installation**: 1 command
✅ **Setup Time**: 2 minutes
✅ **Learning Time**: 5 minutes
✅ **Usage**: Very intuitive
✅ **Results**: Instant and accurate

**Status**: Ready to use immediately after installation

---

**Feature Added**: December 2, 2025
**Version**: 1.0
**Status**: Production Ready
