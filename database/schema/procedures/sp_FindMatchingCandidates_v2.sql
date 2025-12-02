DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_FindMatchingCandidates_v2`(
    IN p_JobID BIGINT,
    IN p_MinMatchPercentage INT
)
BEGIN
    -- Temporary table to store required skills for the job
    CREATE TEMPORARY TABLE IF NOT EXISTS TempJobSkills (
        SkillID BIGINT
    );
    
    -- Insert required skills based on job description keywords
    INSERT INTO TempJobSkills
    SELECT DISTINCT s.SkillID
    FROM Skills s
    WHERE EXISTS (
        SELECT 1 FROM JOBS j 
        WHERE j.JobID = p_JobID 
        AND (j.JobDescription LIKE CONCAT('%', s.SkillName, '%')
        OR j.JobTitle LIKE CONCAT('%', s.SkillName, '%'))
    );
    
    -- Store the total required skills count
    SET @TotalRequiredSkills = (SELECT COUNT(*) FROM TempJobSkills);
    
    -- Find matching candidates including those with 0 matches
    SELECT 
        c.CandidateID,
        CONCAT(c.FirstName, ' ', c.LastName) AS CandidateName,
        c.Email,
        c.Phone,
        c.City,
        c.State,
        COALESCE(matched.MatchingSkills, 0) AS MatchingSkills,
        @TotalRequiredSkills AS RequiredSkills,
        CASE 
            WHEN @TotalRequiredSkills = 0 THEN 0
            ELSE ROUND((COALESCE(matched.MatchingSkills, 0) * 100.0) / @TotalRequiredSkills, 2)
        END AS MatchPercentage,
        COALESCE(matched.Skills, 'No matching skills') AS Skills,
        COALESCE(matched.MaxProficiency, 0) AS MaxProficiencyLevel
    FROM Candidates c
    LEFT JOIN (
        -- Subquery to get matching skills for each candidate
        SELECT 
            cs.CandidateID,
            COUNT(cs.SkillID) AS MatchingSkills,
            GROUP_CONCAT(s.SkillName ORDER BY 
                CASE cs.ProficiencyLevel 
                    WHEN 'Expert' THEN 4
                    WHEN 'Advanced' THEN 3
                    WHEN 'Intermediate' THEN 2
                    WHEN 'Beginner' THEN 1
                    ELSE 0 
                END DESC) AS Skills,
            MAX(CASE cs.ProficiencyLevel 
                WHEN 'Expert' THEN 4
                WHEN 'Advanced' THEN 3
                WHEN 'Intermediate' THEN 2
                WHEN 'Beginner' THEN 1
                ELSE 0 
            END) AS MaxProficiency
        FROM CANDIDATE_SKILLS cs
        INNER JOIN Skills s ON cs.SkillID = s.SkillID
        WHERE cs.SkillID IN (SELECT SkillID FROM TempJobSkills)
        GROUP BY cs.CandidateID
    ) matched ON c.CandidateID = matched.CandidateID
    WHERE NOT EXISTS (
        -- Exclude candidates who already applied
        SELECT 1 FROM ELIGIBLE_CANDIDATES ec
        WHERE ec.CandidateID = c.CandidateID
        AND ec.JOBID = p_JobID
    )
    HAVING MatchPercentage >= p_MinMatchPercentage
    ORDER BY MatchPercentage DESC, MaxProficiencyLevel DESC;
    
    DROP TEMPORARY TABLE IF EXISTS TempJobSkills;
END$$
DELIMITER ;