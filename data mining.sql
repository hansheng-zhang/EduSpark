-- 1. Find the top 5 universities by average salary per year for a specific program:
SELECT u.University_name, e.Avg_Salary_Per_Year
FROM employment e
JOIN program p ON e.Program_ID = p.Program_ID
JOIN university u ON p.University_ID = u.UID
WHERE p.Program_Name = 'Data Science'
ORDER BY e.Avg_Salary_Per_Year DESC
LIMIT 5;

-- 2. Find the percentage of female applicants per program:
SELECT p.Program_Name, COUNT(a.gender) * 100.0 / COUNT(*) as Female_Percentage
FROM applications app
JOIN appliers a ON app.applier_id = a.applier_id
JOIN program p ON app.program_id = p.Program_ID
WHERE a.gender = 'F'
GROUP BY p.Program_Name;

-- 3. Find the average GPA of applicants per university:
SELECT u.University_name, AVG(a.GPA) as Avg_GPA
FROM applications app
JOIN appliers a ON app.applier_id = a.applier_id
JOIN program p ON app.program_id = p.Program_ID
JOIN university u ON p.University_ID = u.UID
GROUP BY u.University_name;

-- 4. Find the number of applicants per program who meet the minimum TOEFL requirements:
SELECT p.Program_Name, COUNT(a.applier_id) as Applicants_Meet_TOEFL
FROM applications app
JOIN appliers a ON app.applier_id = a.applier_id
JOIN program p ON app.program_id = p.Program_ID
JOIN standardized_test st ON p.Program_ID = st.Program_ID
WHERE a.toefl_score >= st.TOEFL_Requirement
GROUP BY p.Program_Name;

