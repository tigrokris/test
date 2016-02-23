CREATE DATABASE `test` CHARACTER SET utf8 COLLATE utf8_general_ci;
DROP TABLE User;
CREATE TABLE IF NOT EXISTS `User` (
  `id` INT(8) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(25) NOT NULL DEFAULT '',
  `age` INT NOT NULL DEFAULT 20,
  `isAdmin` BIT NOT NULL,
  `createDate` TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

DROP PROCEDURE IF EXISTS `random_data`;
DELIMITER $$
CREATE PROCEDURE `random_data`(IN counter INTEGER(11))
  BEGIN
    DECLARE id INT(8);
    DECLARE name VARCHAR(25);
    DECLARE age INT;
    DECLARE isAdmin BIT;
    DECLARE createDate TIMESTAMP;
    SET id = 1;
    WHILE id < counter DO
      SET name = CONCAT_WS(' ', 'name', id);
      SET age = FLOOR(RAND() * ( 100 - 1 ));
      SET isAdmin= b'1';
      SET createDate=NOW();
      INSERT INTO user VALUES (id,name,age,isAdmin,createDate);
      SET id = id + 1;
    END WHILE;
  END;$$
DELIMITER ;

CALL random_data(100);