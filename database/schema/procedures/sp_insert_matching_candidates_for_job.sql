DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_matching_candidates_for_job`(
    IN p_job_id INT,
    IN p_min_match INT
)
proc_done: BEGIN
    DECLARE v_total_required INT DEFAULT 0;
    
    -- Build temporary table of required skills for the job
    CREATE TEMPORARY TABLE IF NOT EXISTS TempJobSkills (SkillID BIGINT PRIMARY KEY) ENGINE=MEMORY;
    TRUNCATE TABLE TempJobSkills;
    
    INSERT INTO TempJobSkills (SkillID)
    SELECT DISTINCT s.SkillID
    FROM Skills s
    WHERE EXISTS (
        SELECT 1 FROM JOBS j
        WHERE j.JobID = p_job_id
          AND (j.JobDescription LIKE CONCAT('%', s.SkillName, '%')
               OR j.JobTitle LIKE CONCAT('%', s.SkillName, '%'))
    );
    
    SELECT COUNT(*) INTO v_total_required FROM TempJobSkills;
    
    -- If no required skills, nothing to insert (avoid division by zero)
    IF v_total_required = 0 THEN
        DROP TEMPORARY TABLE IF EXISTS TempJobSkills;
        LEAVE proc_done;
    END IF;
    
    -- Insert matching candidates into ELIGIBLE_CANDIDATES only if they are not already present
    -- Compute MatchingSkills and MatchPercentage, then insert those >= p_min_match
    INSERT INTO ELIGIBLE_CANDIDATES (CandidateID, JobID, ApplicationStatus, ApplyDate)
    SELECT t.CandidateID, p_job_id, 'PENDING', CURRENT_DATE()
    FROM (
        SELECT
            c.CandidateID,
            COALESCE(m.MatchingSkills, 0) AS MatchingSkills,
            CASE
                WHEN v_total_required = 0 THEN 0
                ELSE ROUND((COALESCE(m.MatchingSkills, 0) * 100.0) / v_total_required, 2)
            END AS MatchPercentage
        FROM Candidates c
        LEFT JOIN (
            SELECT cs.CandidateID, COUNT(*) AS MatchingSkills
            FROM CANDIDATE_SKILLS cs
            WHERE cs.SkillID IN (SELECT SkillID FROM TempJobSkills)
            GROUP BY cs.CandidateID
        ) m ON c.CandidateID = m.CandidateID
    ) AS t
    LEFT JOIN ELIGIBLE_CANDIDATES ec
      ON ec.CandidateID = t.CandidateID AND ec.JobID = p_job_id
    WHERE ec.CandidateID IS NULL
      AND t.MatchPercentage >= p_min_match;
    
    DROP TEMPORARY TABLE IF EXISTS TempJobSkills;
    
END proc_done$$
DELIMITER ;