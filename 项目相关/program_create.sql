-- Create the database
CREATE SCHEMA IF NOT EXISTS `EduSpark` DEFAULT CHARACTER SET utf8 ;
USE EduSpark;

-- Create the 'Program' table
CREATE TABLE Program (
    Program_ID INT PRIMARY KEY,
    University_ID INT,
    Program_Name VARCHAR(255) NOT NULL,
    Early_DDL DATE,
    Final_DDL DATE,
    Program_Link VARCHAR(255),
    GPA DECIMAL(3,2),
    Recommendation_Min_Amount INT,
    Recommendation_Requirement VARCHAR(255),
    Tuition_Fee DECIMAL(10,2),
    FOREIGN KEY (University_ID) REFERENCES University(UID) ON DELETE CASCADE
);

-- Create the 'Standardized_Test' table (weak entity)
CREATE TABLE Standardized_Test (
    Program_ID INT PRIMARY KEY,
    GRE_Required BOOLEAN,
    Cut_Off_Point INT,
    TOEFL_Accepted BOOLEAN,
    TOEFL_Requirement INT,
    IELTS_Accepted BOOLEAN,
    IELTS_Requirement INT,
    FOREIGN KEY (Program_ID) REFERENCES Program(Program_ID) ON DELETE CASCADE
);

-- Create the 'Employment' table (weak entity)
CREATE TABLE Employment (
    Program_ID INT PRIMARY KEY,
    Avg_Salary_Per_Year DECIMAL(10,2),
    Employment_Rate DECIMAL(4,2),
    Employer_Satisfaction DECIMAL(4,2),
    Company VARCHAR(255),
    Industry VARCHAR(255),
    FOREIGN KEY (Program_ID) REFERENCES Program(Program_ID) ON DELETE CASCADE
);