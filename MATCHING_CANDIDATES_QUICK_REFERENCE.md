# 🎯 Quick Reference - Find Matching Candidates

## Installation (1 minute)

```bash
mysql -u root staffing_db < database/schema/procedures/sp_FindMatchingCandidates_v2.sql
```

## Using It (30 seconds)

```
1. Employee Portal → Jobs → "Find Matching Candidates" tab
2. Select job from dropdown
3. Adjust match % slider (default 50%)
4. Click "Find Matching Candidates"
5. View results, download CSV if needed
```

---

## What It Does

Finds candidates whose skills match job requirements

```
Select Job (e.g., "Python Developer")
         ↓
Extract Required Skills (Python, SQL, AWS, etc.)
         ↓
Search Candidate Database
         ↓
Calculate Match Percentages
         ↓
Rank by Best Fit
         ↓
Display Ranked Results
```

---

## Understanding Results

```
Candidate Card:
  Name, Email, Phone, Location
  
  Match %: 80%           ← (4 out of 5 required skills)
  Skills: 4/5
  
  Skills: Python, SQL, AWS, Docker
  
  Download as CSV
```

---

## Match % Meaning

| % | Interpretation | Use Case |
|---|---|---|
| **0-25%** | Few skills match | Cast wide net, consider training |
| **25-50%** | Some skills match | Good potential candidates |
| **50-75%** | Most skills match | Ready to interview |
| **75-100%** | All/nearly all match | Highly qualified candidates |

---

## Quick Examples

### Example 1: Data Analyst
```
Job: Data Analyst (requires SQL, Python, Power BI, Excel)
Min Match: 50%

Results:
✓ Michael - 100% match (has all 4)
✓ Sarah - 75% match (has 3 of 4)
✓ David - 50% match (has 2 of 4)
```

### Example 2: Junior Developer
```
Job: Junior Developer (requires JavaScript, HTML, CSS)
Min Match: 0% (willing to train)

Results:
✓ Jessica - 100% match (has all 3)
✓ Alex - 66% match (has 2 of 3)
✓ Emma - 33% match (has 1 of 3)
```

---

## Behind the Scenes

**Database Procedure**: `sp_FindMatchingCandidates_v2`

**Parameters**:
- Job ID (which job to match)
- Min Match % (50% by default)

**Returns**:
- Candidate name, email, phone, location
- Match percentage
- List of matching skills
- Proficiency level

---

## Common Actions

### Find Perfect Matches
```
Select Job → Set 90% min match → Find → Results show only experts
```

### Cast Wide Net
```
Select Job → Set 0% min match → Find → See all candidates
```

### Standard Search
```
Select Job → Set 50% min match (default) → Find → Good balance
```

### Export for Follow-up
```
Find matches → See results → Click "Download Results" → Get CSV
```

---

## Troubleshooting

**Problem**: "No matching candidates found"
```
Solution: Lower match % or update job description with skill names
```

**Problem**: "Error finding matching candidates"
```
Solution: Verify procedure installed:
mysql -u root staffing_db -e "SHOW PROCEDURE STATUS WHERE Name='sp_FindMatchingCandidates_v2';"
```

**Problem**: Procedure not showing results
```
Solution: Reinstall:
mysql -u root staffing_db < database/schema/procedures/sp_FindMatchingCandidates_v2.sql
```

---

## Keyboard Shortcuts

| Action | Shortcut |
|--------|----------|
| Refresh results | F5 |
| Clear cache | C (in Streamlit) |
| Download CSV | Click "📥 Download Results" |
| Go back | Click "Job Listings" tab |

---

## Tips

✅ Include skill names in job descriptions
✅ Encourage candidates to add skills to profiles
✅ Start with 50% match, adjust as needed
✅ Review top matches first
✅ Download results for bulk outreach

❌ Don't leave job description vague
❌ Don't ignore lower match candidates (trainable)
❌ Don't skip reviewing proficiency levels
❌ Don't forget to check candidate contact info

---

## Files

**Feature Implementation**: `app.py`
**Stored Procedure**: `database/schema/procedures/sp_FindMatchingCandidates_v2.sql`
**Setup Guide**: `MATCHING_CANDIDATES_SETUP.md`
**Full Guide**: `MATCHING_CANDIDATES_GUIDE.md`
**This File**: `MATCHING_CANDIDATES_QUICK_REFERENCE.md`

---

## Support

Need help?

1. **Setup Issues** → `MATCHING_CANDIDATES_SETUP.md`
2. **How to Use** → `MATCHING_CANDIDATES_GUIDE.md`
3. **Implementation Details** → `MATCHING_CANDIDATES_IMPLEMENTATION.md`

---

**Feature Ready**: December 2, 2025
**Installation Time**: 1 minute
**Learning Time**: 2 minutes
**First Use**: Instant results

🚀 **Ready to start matching candidates!**
