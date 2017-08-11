DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_update`(IN `ter_id` INT(10), IN `met_key` VARCHAR(250), IN `met_val` VARCHAR(250))
BEGIN
DECLARE met_id Int Default 0;
IF (SELECT meta_id FROM table_name WHERE meta_key = met_key AND term_id = ter_id) THEN
BEGIN
    SELECT meta_id INTO met_id FROM table_name WHERE meta_key = met_key AND term_id = ter_id;
    UPDATE table_name SET meta_value = met_val WHERE meta_id = met_id;
END;
ELSE
BEGIN
	INSERT table_name SET meta_key = met_key, term_id = ter_id, meta_value = met_val;
    SET met_id = LAST_INSERT_ID();
END;
END IF;
SELECT met_id;
END$$
DELIMITER ;
