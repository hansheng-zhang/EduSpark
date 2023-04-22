-- 1. 地区查询
SELECT university.region, COUNT(*) AS num
FROM university, program, applications
WHERE university.UID = program.University_ID AND program.Program_ID = applications.program_id AND applications.status = 'Accepted' AND applications.applier_id IN (
    SELECT applier_id
    FROM appliers
    WHERE GPA < 3.3
)
GROUP BY Region

-- 2. 学校查询
SELECT AVG(appliers.GPA), AVG(appliers.GRE_score), AVG(appliers.TOEFL_score) 
FROM appliers
JOIN applications
ON appliers.applier_id = applications.applier_id
JOIN Program
ON applications.program_id = Program.Program_ID
JOIN undergra_univers
ON appliers.univer_id = undergra_univers.univer_id
WHERE Program_Name = 'CSE@MIT' AND status = 'Accepted' AND univer_name = 'Chinese University of Hong Kong, Shenzhen' AND YEAR(applications.date) = 2022;


-- 3. CUHKSZ的申请人
SELECT p.Program_Name, COUNT(a.applier_id) as number
FROM applications a
JOIN appliers ap ON a.applier_id = ap.applier_id
JOIN undergra_univers u ON ap.univer_id = u.univer_id
JOIN program p ON a.program_id = p.Program_ID
JOIN university un ON p.University_ID = un.UID
WHERE a.status = 'accepted'
AND u.univer_name = 'Chinese University of Hong Kong, Shenzhen'
AND un.Abbreviation = 'MIT'
GROUP BY p.Program_Name
ORDER BY number DESC;

-- 4. MIT最低分数线
SELECT ap.applier_id, ap.first_name, ap.last_name, ap.gender, ap.date_of_birth, ap.undergraduate_program, uu.univer_name, ap.GPA, ap.toefl_score, ap.ielts_score, ap.gre_score, ap.gmat_score
FROM appliers AS ap
JOIN applications AS a ON a.applier_id = ap.applier_id
JOIN program AS p ON a.program_id = p.Program_ID
JOIN university AS u ON p.University_ID = u.UID
JOIN undergra_univers AS uu ON ap.univer_id = uu.univer_id
WHERE u.University_name = 'Massachusetts Institute of Technology'
AND ap.GPA = (
    SELECT MIN(ap2.GPA)
    FROM appliers AS ap2
    JOIN applications AS a2 ON a2.applier_id = ap2.applier_id
    JOIN program AS p2 ON a2.program_id = p2.Program_ID
    JOIN university AS u2 ON p2.University_ID = u2.UID
    WHERE u2.University_name = 'Massachusetts Institute of Technology'
);

-- 5. CS项目成功录取
SELECT ap.applier_id, ap.first_name, ap.last_name, ap.undergraduate_program, uu.univer_name, ap.GPA, a.program_id, p.Program_Name, u.University_name, a.status
FROM applications AS a
JOIN appliers AS ap ON a.applier_id = ap.applier_id
JOIN program AS p ON a.program_id = p.Program_ID
JOIN university AS u ON p.University_ID = u.UID
JOIN uni_maj AS um ON u.UID = um.UID
JOIN undergra_univers AS uu ON ap.univer_id = uu.univer_id
WHERE a.status = 'Accepted' AND um.Major_name = 'Computer Science';

-- 6. 打标录取
SELECT ap.applier_id, ap.first_name, ap.last_name, ap.GPA, ap.gre_score, p.Program_ID, p.Program_Name, u.University_name, a.status
FROM applications AS a
JOIN appliers AS ap ON a.applier_id = ap.applier_id
JOIN program AS p ON a.program_id = p.Program_ID
JOIN university AS u ON p.University_ID = u.UID
WHERE a.status = 'Accepted' AND ap.GPA > 3.5 AND ap.gre_score > 320;