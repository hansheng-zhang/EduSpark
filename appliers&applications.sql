-- Create the 'database
CREATE SCHEMA IF NOT EXISTS `EduSpark` DEFAULT CHARACTER SET utf8 ;
USE EduSpark;


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
  GPA DECIMAL(3,2) NOT NULL,
  toefl_score INT,
  ielts_score DECIMAL(2,1),
  gre_score INT,
  gmat_score INT
);

-- Create the 'applications' table
CREATE TABLE applications (
  program_id INT REFERENCES Program(Program_ID),
  applier_id INT REFERENCES appliers(applier_id),
  status VARCHAR(20),
  date DATE,
  recom_id INT,
  ps_id INT,
  PRIMARY KEY(program_id, applier_id)
);

-- Create the 'undergraduate universities' table
CREATE TABLE undergra_univers(
	univer_id INT PRIMARY KEY,
    univer_name VARCHAR(100) NOT NULL,
    univer_city VARCHAR(50) NOT NULL
 );

INSERT INTO appliers (applier_id, first_name, last_name, email_address, phone_number, gender, date_of_birth, undergraduate_program, univer_id, GPA, toefl_score, ielts_score, gre_score, gmat_score)
VALUES
  (1, 'Robin', 'Lin', 'RobinLin@example.com', '555-1234', 'M', '2002-05-01', 'Data Science', 10, 3.4, 105, null, 325, null),
  (2, 'Larry', 'Zhou', 'LarryZhou@example.com', '555-5678', 'M', '2002-08-26', 'Data Science', 10, 3.8, 110, null, 330, null),
  (3, 'Bob', 'Qin', 'BobQin@example.com', '555-2468', 'M', '1997-03-03', 'Physics', 2, 3.2, null, 6.5, null, 690),
  (4, 'Hessian', 'Deng', 'HessianDeng@example.com', '555-3698', 'M', '1998-04-04', 'Mathematics', 2, 3.9, 120, null, 340, null),
  (5, 'Mike', 'Brown', 'mike.brown@example.com', '555-1357', 'M', '1999-05-05', 'Mechanical Engineering', 3, 3.6, 105, null, 325, null),
  (6, 'Emily', 'Liang', 'emily.davis@example.com', '555-5791', 'F', '2000-06-06', 'Environmental Science', 3, 3.1, null, 6.0, null, 670),
  (7, 'David', 'Garcia', 'david.garcia@example.com', '555-8642', 'M', '2001-07-07',  'Chemistry', 4, 3.7, 115, null, 325, null),
  (8, 'Olivia', 'Wilson', 'olivia.wilson@example.com', '555-2379', 'F', '2002-08-08', 'Business Administration', 4, 3.4, 95, null, 310, null),
  (9, 'William', 'Lee', 'william.lee@example.com', '555-4682', 'M', '2003-09-09', 'Psychology', 5, 3.3, 95, null, 310, null),
  (10, 'Sophia', 'Taylor', 'sophia.taylor@example.com', '555-7913', 'F', '2004-10-10', 'Political Science', 5, 3.8, 110, null, 330, null),
  (11, 'James', 'Martin', 'james.martin@example.com', '555-2345', 'M', '2005-11-11', 'Computer Engineering', 6, 3.6, null, 7.0, null, 740),
  (12, 'Ava', 'Anderson', 'ava.anderson@example.com', '555-6789', 'F', '2006-12-12',  'Biology', 6, 3.9, 120, null, 340, null),
  (13, 'Daniel', 'Wilson', 'daniel.wilson@example.com', '555-1357', 'M', '2007-01-01',  'Civil Engineering',7, 3.5, 100, null, 325, null),
  (14, 'Mia', 'Smith', 'mia.smith@example.com', '555-2468', 'F', '2008-02-02', 'English Literature', 7, 3.1, 80, null, 300, null),
  (15, 'Michael', 'Brown', 'michael.brown@example.com', '555-3698', 'M', '2009-03-03', 'Electrical Engineering', 8, 3.8, 115, null, 330, null),
  (16, 'Emma', 'Davis', 'emma.davis@example.com', '555-5791', 'F', '2010-04-04',  'Computer Science', 9, 3.4, 90, null, 310, null),
  (17, 'William', 'Garcia', 'william.garcia@example.com', '555-8642', 'M', '2011-05-05', 'Chemical Engineering', 9, 3.7, 110, null, 330, null),
  (18, 'Olivia', 'Wilson', 'olivia.wilson@example.com', '555-2379', 'F', '2012-06-06',  'Business Administration', 1, 3.5, 100, null, 320, null),
  (19, 'Ethan', 'Lee', 'ethan.lee@example.com', '555-4682', 'M', '2013-07-07', 'Marxism', 1, 3.6, null, 6.0, null, 700),
  (20, 'Edward', 'Qin', 'QinEdawrd@example.com', '555-4682', 'M', '2002-07-07', 'Finance', 10, 3.61, 110, null, 330, null);

INSERT INTO applications (program_id, applier_id, status, date, recom_id, ps_id)
VALUES
  (1, 1, 'Accepted', '2022-01-15', 1, 1),
  (2, 1, 'Accepted', '2022-01-15', 2, 2),
  (3, 2, 'Accepted', '2022-01-16', 3, 3),
  (4, 2, 'Pending', '2022-01-16', 4, 4),
  (5, 3, 'Rejected', '2022-01-17', 5, 5),
  (6, 3, 'Pending', '2022-01-17', 6, 6),
  (7, 4, 'Accepted', '2022-01-18', 7, 7),
  (8, 4, 'Accepted', '2022-01-18', 8, 8),
  (9, 5, 'Pending', '2022-01-19', 9, 9),
  (10, 5, 'Rejected', '2022-01-19', 10, 10),
  (1, 6, 'Accepted', '2022-01-20', 11, 11),
  (2, 6, 'Rejected', '2022-01-20', 12, 12),
  (3, 7, 'Pending', '2022-01-21', 13, 13),
  (4, 7, 'Accepted', '2022-01-21', 14, 14),
  (5, 8, 'Rejected', '2022-01-22', 15, 15),
  (6, 8, 'Pending', '2022-01-22', 16, 16),
  (7, 9, 'Accepted', '2022-01-23', 17, 17),
  (8, 9, 'Accepted', '2022-01-23', 18, 18),
  (9, 10, 'Pending', '2022-01-24', 19, 19),
  (10, 10, 'Rejected', '2022-01-24', 20, 20),
  (1, 11, 'Accepted', '2022-01-25', 21, 21),
  (2, 11, 'Rejected', '2022-01-25', 22, 22),
  (3, 12, 'Pending', '2022-01-26', 23, 23),
  (4, 12, 'Accepted', '2022-01-26', 24, 24),
  (5, 13, 'Rejected', '2022-01-27', 25, 25),
  (6, 13, 'Pending', '2022-01-27', 26, 26),
  (7, 14, 'Accepted', '2022-01-28', 27, 27),
  (8, 14, 'Accepted', '2022-01-28', 28, 28),
  (9, 15, 'Pending', '2022-01-29', 29, 29),
  (10, 15, 'Rejected', '2022-01-29', 30, 30),
  (1, 16,   'Accepted', '2022-01-30', 31, 31),
  (2, 16, 'Rejected', '2022-01-30', 32, 32),
  (3, 17, 'Pending', '2022-01-31', 33, 33),
  (4, 17, 'Accepted', '2022-01-31', 34, 34),
  (5, 18, 'Rejected', '2022-02-01', 35, 35),
  (6, 18, 'Pending', '2022-02-01', 36, 36),
  (7, 19, 'Accepted', '2022-02-02', 37, 37),
  (8, 19, 'Accepted', '2022-02-02', 38, 38),
  (9, 20, 'Pending', '2022-02-03', 39, 39),
  (10, 20, 'Rejected', '2022-02-03', 40, 40),
  (1, 1, 'Accepted', '2022-02-04', 1, 41),
  (2, 1, 'Rejected', '2022-02-04', 2, 42),
  (3, 2, 'Accepted', '2022-02-05', 3, 43),
  (4, 2, 'Pending', '2022-02-05', 4, 44),
  (5, 3, 'Rejected', '2022-02-06', 5, 45),
  (6, 3, 'Pending', '2022-02-06', 6, 46),
  (7, 4, 'Accepted', '2022-02-07', 7, 47),
  (8, 4, 'Accepted', '2022-02-07', 8, 48),
  (9, 5, 'Pending', '2022-02-08', 9, 49),
  (10, 5, 'Rejected', '2022-02-08', 10, 50),
  (1, 6, 'Accepted', '2022-02-09', 11, 51),
  (2, 6, 'Rejected', '2022-02-09', 12, 52),
  (3, 7, 'Pending', '2022-02-10', 13, 53),
  (4, 7, 'Accepted', '2022-02-10', 14, 54),
  (5, 8, 'Rejected', '2022-02-11', 15, 55),
  (6, 8, 'Pending', '2022-02-11', 16, 56),
  (7, 9, 'Accepted', '2022-02-12', 17, 57),
  (8, 9, 'Accepted', '2022-02-12', 18, 58),
  (9, 10, 'Pending', '2022-02-13', 19, 59),
  (10, 10, 'Rejected', '2022-02-13', 20, 60);

INSERT INTO undergra_univers (univer_id, univer_name, univer_city)
VALUES
  (1, 'Peking University', 'Beijing'),
  (2, 'Tsinghua University', 'Beijing'),
  (3, 'Fudan University', 'Shanghai'),
  (4, 'Shanghai Jiao Tong University', 'Shanghai'),
  (5, 'Zhejiang University', 'Hangzhou'),
  (6, 'Nanjing University', 'Nanjing'),
  (7, 'Wuhan University', 'Wuhan'),
  (8, 'Xiamen University', 'Xiamen'),
  (9, 'Sichuan University', 'Chengdu'),
  (10, 'Chinese University of Hong Kong, Shenzhen', 'Shenzhen');
