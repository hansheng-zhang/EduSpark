-- 1. Search for programs whose tuition fee is less than 50000
SELECT Program_ID, Program_Name, Tuition_Fee
FROM Program
WHERE Tuition_Fee < 50000;

-- 2. Get average GRE score of appliers from Peking University use join
SELECT AVG(gre_score)
FROM appliers
JOIN undergra_univers
ON appliers.univer_id = undergra_univers.univer_id
WHERE univer_name = 'Peking University';

-- 3. Get the average GPA of appliers who are accepted by CSE@MIT
SELECT AVG(appliers.GPA)
FROM appliers
JOIN applications
ON appliers.applier_id = applications.applier_id
JOIN Program
ON applications.program_id = Program.Program_ID
WHERE Program_Name = 'CSE@MIT' AND status = 'Accepted';