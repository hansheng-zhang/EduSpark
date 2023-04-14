DROP SCHEMA IF EXISTS `EduSpark`;

CREATE SCHEMA IF NOT EXISTS `EduSpark` DEFAULT CHARACTER SET utf8;

USE `EduSpark`;

CREATE TABLE `university` (
    `UID` INT NOT NULL,
    `University_name` VARCHAR(75) NOT NULL,
    `Abbreviation` VARCHAR(45) NOT NULL,
    `Branch_unniversity` Boolean NOT NULL,
    -- 是否是分校
    `Region` VARCHAR(45) NOT NULL,
    `Location` VARCHAR(45) NOT NULL,
    `QSranking` VARCHAR(45) NULL,
    PRIMARY KEY (`UID`)
);

CREATE TABLE `uni_maj` (
    `Rank` INT NULL,
    `UID` INT NOT NULL,
    `MID` VARCHAR(45) NOT NULL,
    `Major_name` VARCHAR(45) NOT NULL,
    `Major_type` VARCHAR(45) NOT NULL,
    -- 理科或文科
    `Teaching_language` VARCHAR(45) NOT NULL,
    `Major_scale` INT NULL,
    -- 人数
    PRIMARY KEY (`UID`, `MID`),
    foreign key (`UID`) references university(UID) ON DELETE CASCADE
);

-- Create the 'Program' table
CREATE TABLE program (
    Program_ID INT PRIMARY KEY,
    University_ID INT NOT NULL,
    Program_Name VARCHAR(255) NOT NULL,
    Early_DDL DATE,
    Final_DDL DATE,
    Program_Link VARCHAR(255),
    GPA DECIMAL(3, 2),
    Recommendation_Min_Amount INT,
    Recommendation_Requirement VARCHAR(255),
    Tuition_Fee DECIMAL(10, 2),
    FOREIGN KEY (University_ID) REFERENCES University(UID) ON DELETE CASCADE
);

-- Create the 'Standardized_Test' table (weak entity)
CREATE TABLE standardized_test (
    Program_ID INT PRIMARY KEY,
    GRE_Required BOOLEAN,
    Cut_Off_Point INT,
    TOEFL_Accepted BOOLEAN,
    TOEFL_Requirement INT,
    IELTS_Accepted BOOLEAN,
    IELTS_Requirement INT,
    FOREIGN KEY (Program_ID) REFERENCES program(Program_ID) ON DELETE CASCADE
);

-- Create the 'Employment' table (weak entity)
CREATE TABLE employment (
    Program_ID INT PRIMARY KEY,
    Avg_Salary_Per_Year DECIMAL(10, 2),
    Employment_Rate DECIMAL(4, 2),
    Employer_Satisfaction DECIMAL(4, 2),
    Company VARCHAR(255),
    Industry VARCHAR(255),
    FOREIGN KEY (Program_ID) REFERENCES program(Program_ID) ON DELETE CASCADE
);

-- Create the 'undergraduate universities' table
CREATE TABLE undergra_univers(
    univer_id INT PRIMARY KEY,
    univer_name VARCHAR(100) NOT NULL,
    univer_city VARCHAR(50) NOT NULL
);

-- Create the 'appliers' table
CREATE TABLE appliers (
    applier_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email_address VARCHAR(100),
    phone_number VARCHAR(20) NOT NULL,
    gender CHAR(1),
    date_of_birth DATE,
    undergraduate_program VARCHAR(100) NOT NULL,
    univer_id INT,
    GPA DECIMAL(3, 2) NOT NULL,
    toefl_score INT,
    ielts_score DECIMAL(2, 1),
    gre_score INT,
    gmat_score INT,
    FOREIGN KEY (univer_id) REFERENCES undergra_univers(univer_id)
);

-- Create the 'applications' table
CREATE TABLE applications (
    program_id INT,
    applier_id INT,
    status VARCHAR(20),
    date DATE,
    recom_id INT,
    ps_id INT,
    PRIMARY KEY(program_id, applier_id),
    FOREIGN KEY (program_id) REFERENCES Program(Program_ID),
    FOREIGN KEY (applier_id) REFERENCES appliers(applier_id)
);
