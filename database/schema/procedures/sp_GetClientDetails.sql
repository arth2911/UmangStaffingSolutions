DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetClientDetails`(
    IN  companyNameQuery VARCHAR(50),
    OUT outClientID      BIGINT,
    OUT outContactPerson VARCHAR(50)
)
BEGIN
    SELECT
        ClientID,
        ContactPerson
    INTO
        outClientID,
        outContactPerson
    FROM
        Clients
    WHERE
        CompanyName = companyNameQuery;
END$$
DELIMITER ;