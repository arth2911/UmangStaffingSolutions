CREATE TRIGGER `trg_Candidates_Before_Insert_Lowercase_Email` BEFORE INSERT ON `Candidates`
 FOR EACH ROW BEGIN
    -- Set the Email value in the new row to its lowercase version
    SET NEW.Email = LOWER(NEW.Email);
END