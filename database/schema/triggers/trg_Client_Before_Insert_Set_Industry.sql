CREATE TRIGGER `trg_Client_Before_Insert_Set_Industry` BEFORE INSERT ON `Clients`
 FOR EACH ROW BEGIN
    -- If the new row is trying to insert a NULL value for Industry,
    -- set it to 'Unknown' instead.
    IF NEW.Industry IS NULL THEN
        SET NEW.Industry = 'Unknown';
    END IF;
END