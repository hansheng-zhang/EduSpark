DROP SCHEMA IF EXISTS `EduSpark` ;
CREATE SCHEMA IF NOT EXISTS `EduSpark` DEFAULT CHARACTER SET utf8 ;
USE `EduSpark` ;


CREATE TABLE `university` (
  `iduniversity` INT NOT NULL,
  `University_name` VARCHAR(75) NOT NULL,
  `Branch_unniversity` Boolean NOT NULL, -- 是否是分校
  `Region` VARCHAR(45) NOT NULL,
  `Location` VARCHAR(45) NOT NULL,
  `QSranking` VARCHAR(45) NULL,
  PRIMARY KEY (`iduniversity`));

CREATE TABLE `uni_maj` (
  `Rank` INT NULL,
  `UID` INT NOT NULL,
  `MID` VARCHAR(45) NOT NULL,
  `Major_name` VARCHAR(45) NOT NULL,
  `Major_type` VARCHAR(45) NOT NULL, -- 研究型或授课型
  `Teaching_language` VARCHAR(45) NOT NULL,  
  `Major_scale` INT NULL, -- 人数
  PRIMARY KEY (`UID`, `MID`),
  foreign key (`UID`) references university(iduniversity));


