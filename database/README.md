# Database Documentation

## Database Name: Umang_Staffing_DB

### Structure
- **schema/** - Contains database structure and DDL scripts
  - `complete_database.sql` - Full database export with structure and sample data
- **sample_data/** - Contains sample data inserts
- **backups/** - Database backup files

### Tables
1. **Clients** - Client companies using staffing services
2. **Candidates** - Job seekers registered in the system
3. **Skills** - Master list of technical and soft skills
4. **CANDIDATE_SKILLS** - Junction table linking candidates to their skills
5. **HR** - HR/Recruiter information
6. **JOBS** - Job postings from client companies
7. **ELIGIBLE_CANDIDATES** - Job applications from candidates
8. **PLACEMENTS** - Successful job placements

### Views
- `vw_technologyclients` - Technology industry clients
- `vw_activejobapplications` - Active job applications with details
- `vw_candidateplacementhistory` - Candidate placement history

### How to Import
```sql
mysql -u username -p database_name < database/schema/complete_database.sql
```

### Last Updated: December 2, 2025