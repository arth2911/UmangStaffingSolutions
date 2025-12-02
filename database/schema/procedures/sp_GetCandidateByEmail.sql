DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetCandidateByEmail`(
    IN  inEmail VARCHAR(100),
    OUT outFullName VARCHAR(101),
    OUT outPhone VARCHAR(30)
)
BEGIN
    SELECT
        CONCAT(FirstName, ' ', LastName),
        Phone
    INTO
        outFullName,
        outPhone
    FROM
        Candidates
    WHERE
        Email = inEmail;
END$$
DELIMITER ;