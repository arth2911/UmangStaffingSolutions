# 🔍 Find Matching Candidates - Feature Guide

## Overview

The **Find Matching Candidates** feature uses a stored procedure to intelligently match job requirements with candidate skills. This helps HR quickly find the best candidates for open positions.

---

## How It Works

### The Stored Procedure: `sp_FindMatchingCandidates_v2`

**Purpose**: Find candidates whose skills match job requirements

**Parameters**:
- `p_JobID` - The ID of the job to match
- `p_MinMatchPercentage` - Minimum skill match percentage (0-100%)

**Logic**:
1. Extracts required skills from job title and description
2. Compares with candidate skills in database
3. Calculates match percentage
4. Ranks by match quality and proficiency level
5. Excludes already-applied candidates
6. Returns results filtered by minimum match

---

## Using the Feature

### Step 1: Access Find Matching Candidates
```
Employee Portal → Jobs → "Find Matching Candidates" Tab
```

### Step 2: Select a Job
- Dropdown shows all **open jobs only**
- Shows: Job Title and Company Name
- Choose the job you want to match candidates for

### Step 3: Set Minimum Match Percentage
- Slider from 0% to 100%
- Default: 50%
- **0%** = Show all candidates (even with no matching skills)
- **50%** = Show candidates with 50%+ skill match
- **100%** = Show only candidates with all required skills

### Step 4: Find Matching Candidates
- Click "Find Matching Candidates" button
- System calls stored procedure
- Results appear instantly

---

## Understanding the Results

Each matching candidate card shows:

### Candidate Information
- **Name** (👤)
- **Email** (📧)
- **Phone** (📞)
- **Location** (📍 City, State)

### Match Metrics
- **Match %** - Percentage of job skills the candidate has
- **Skills** - Number of matching skills vs required skills (e.g., "3/5")

### Skills Display
- **Matching Skills** - List of skills they have that match the job
- Skills ordered by proficiency (Expert first, then Intermediate, etc.)

### Example Result
```
👤 Maria Garcia
📧 maria.garcia@gmail.com
📞 703-555-1001
📍 Arlington, VA

Match %: 80%
Skills: 4/5

Skills:
Python, Data Analysis, Machine Learning, SQL
```

---

## Example Scenarios

### Scenario 1: Full Stack Developer Job
```
Job: "Full Stack Developer"
Required Skills: JavaScript, Python, SQL, React, AWS
Min Match: 50%

Results:
✓ Maria Garcia - 100% match (has all 5 skills)
✓ David Smith - 80% match (has 4 of 5 skills)
✓ Jessica Chen - 60% match (has 3 of 5 skills)
```

### Scenario 2: Data Analyst Job
```
Job: "Data Analyst"
Required Skills: SQL, Power BI, Python, Excel
Min Match: 75%

Results:
✓ Michael Williams - 100% match (has all 4 skills)
✓ Sarah Johnson - 75% match (has 3 of 4 skills)
(No results with less than 75%)
```

---

## Features

### ✅ Intelligent Matching
- Extracts skills from job title and description
- Matches with candidate database
- Calculates proficiency levels

### ✅ Flexible Filtering
- Adjustable minimum match percentage
- Only shows open jobs
- Excludes already-applied candidates

### ✅ Detailed Results
- Shows match percentage
- Lists matching skills
- Sorts by match quality
- Orders skills by proficiency

### ✅ Export Results
- Download matching candidates as CSV
- Includes all details
- Ready for follow-up

---

## Database Tables Used

### Primary Tables
- **JOBS** - Job postings with descriptions
- **Candidates** - Candidate profiles
- **Skills** - Master list of skills
- **CANDIDATE_SKILLS** - Candidate skill mapping
- **ELIGIBLE_CANDIDATES** - Applied candidates tracking

### Logic
```
Job Description/Title
    ↓
Extract Required Skills
    ↓
Match with Candidates
    ↓
Calculate Match %
    ↓
Filter & Sort
    ↓
Return Results
```

---

## SQL Procedure Details

### How Match Percentage is Calculated

```sql
MatchPercentage = (Matching Skills / Required Skills) × 100
```

**Example**:
- Job requires: 5 skills (Java, Python, AWS, SQL, Docker)
- Candidate has: 4 matching skills (Java, Python, SQL, Docker)
- Match %: (4 / 5) × 100 = **80%**

### Skill Extraction

The procedure extracts required skills by searching:
1. Job Title (e.g., "Python Developer" → Python skill)
2. Job Description (full text search for skill names)
3. Database Skills table (60+ available skills)

### Sorting

Results are sorted by:
1. **Match Percentage** (highest first)
2. **Maximum Proficiency** (Expert > Intermediate > Beginner)

Example:
```
1. Candidate A - 100% match, Expert level
2. Candidate B - 100% match, Intermediate level
3. Candidate C - 80% match, Expert level
4. Candidate D - 80% match, Intermediate level
```

---

## Practical Use Cases

### Use Case 1: Quick Candidate Sourcing
**Situation**: New job posted, need candidates ASAP
**Action**: 
- Set job
- Set 50% minimum match
- Get candidates sorted by fit
- Review top 3-5 matches

### Use Case 2: Strict Requirements
**Situation**: Senior role, need highly skilled candidates
**Action**:
- Set job
- Set 90-100% minimum match
- Get only best matches
- Contact for interviews

### Use Case 3: Entry-Level Positions
**Situation**: Training program, willing to train
**Action**:
- Set job
- Set 0-25% minimum match
- Get all candidates
- Review potential for development

---

## Tips & Best Practices

### For Best Results

1. **Job Descriptions Matter**
   - Include specific technology names
   - Mention required skills explicitly
   - Use standard skill terminology

2. **Candidate Profiles**
   - Encourage candidates to add relevant skills
   - Use consistent skill naming
   - Set accurate proficiency levels

3. **Setting Match Percentage**
   - **0-25%** - Cast wide net, review many candidates
   - **25-50%** - Moderate filtering
   - **50-75%** - Good matches
   - **75-100%** - Only highly skilled candidates

4. **Review Results**
   - Look beyond match percentage
   - Consider experience level
   - Check proficiency levels
   - Review all candidate details

---

## Troubleshooting

| Issue | Cause | Solution |
|-------|-------|----------|
| "No matching candidates found" | No candidates with matching skills | Lower minimum match % or review job skills |
| No results appear | Procedure not installed | Run: `mysql -u root staffing_db < procedures/sp_FindMatchingCandidates_v2.sql` |
| Error calling procedure | Database connection issue | Verify MySQL is running and connected |
| Low match percentages | Job skills not matching database | Update job description with specific skill names |

---

## Advanced Usage

### Stored Procedure Parameters

```sql
CALL sp_FindMatchingCandidates_v2(JobID, MinMatchPercentage);
```

**Example Calls**:
```sql
-- Find all candidates for job 1001 with 50%+ match
CALL sp_FindMatchingCandidates_v2(1001, 50);

-- Find perfect matches for job 1002
CALL sp_FindMatchingCandidates_v2(1002, 100);

-- Find all possible candidates for job 1003 (no filter)
CALL sp_FindMatchingCandidates_v2(1003, 0);
```

---

## Data Export

### Download Results

Results can be exported as CSV with:
- CandidateID
- CandidateName
- Email
- Phone
- City, State
- MatchingSkills
- RequiredSkills
- MatchPercentage
- Skills List
- Max Proficiency Level

Use for:
- Bulk outreach
- Candidate tracking
- Hiring analytics
- External review

---

## Performance Notes

- **Processing Time**: <2 seconds for most jobs
- **Scalability**: Handles 1000+ candidates
- **Database Load**: Optimized with indexes
- **Results**: Sorted and paginated

---

## Summary

The **Find Matching Candidates** feature provides:
✅ Intelligent skill matching
✅ Flexible filtering
✅ Detailed candidate information
✅ Easy data export
✅ Quick hiring decisions

**Start Using**: Employee Portal → Jobs → Find Matching Candidates Tab

---

*Feature Implementation Date: December 2, 2025*
*Stored Procedure: sp_FindMatchingCandidates_v2*
*Status: Ready to Use*
