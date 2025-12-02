CREATE TRIGGER `trg_AutoCloseFilledJobs` AFTER INSERT ON `PLACEMENTS`
 FOR EACH ROW BEGIN
    DECLARE placement_count INT;
    DECLARE job_type VARCHAR(50);
    
    -- Get job type and count placements
    SELECT JobType INTO job_type
    FROM JOBS WHERE JobID = NEW.JobID;
    
    SELECT COUNT(*) INTO placement_count
    FROM PLACEMENTS WHERE JobID = NEW.JobID;
    
    -- Auto-close job based on type and placement count
    IF (job_type IN ('Full-Time', 'Part-Time') AND placement_count >= 1) OR
       (job_type IN ('Contract', 'Temporary') AND placement_count >= 3) THEN
        UPDATE JOBS
        SET IsOpen = 0
        WHERE JobID = NEW.JobID;
    END IF;
END