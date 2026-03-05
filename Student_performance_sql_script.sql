


USE tofunmi_senku_academy;
SHOW TABLES;

# Atttendance Table
DESC attendance;
SELECT * FROM attendance;
# Changing the data type of student_id & attendance_percent
ALTER TABLE attendance MODIFY student_id Varchar(50);
ALTER TABLE attendance MODIFY attendance_percent FLOAT;

# Extracurricular Table
DESC extracurricular;
SELECT * FROM extracurricular;
# Changing the data type for student_id $ extra_curricular
ALTER TABLE extracurricular MODIFY student_id Varchar(50);
ALTER TABLE extracurricular MODIFY extra_curricular Varchar(50);

# Scores Table
DESC scores;
SELECT * FROM scores;
SELECT count(Distinct subject) as subject_count FROM scores;
# Changing student_id & subject data type
ALTER TABLE Scores MODIFY student_id Varchar(50);
ALTER TABLE Scores MODIFY subject Varchar(50);


# What are the total number of subjects offered by the students ?
SELECT count(DISTINCT subject) AS Total_subject FROM scores;

# Total number of student offering each of the three subjects
SELECT subject, Count(student_id) AS Count_student FROM scores
GROUP BY subject;

# Cleaning the information in the column
SET SQL_SAFE_UPDATES=0;

# Changing Math_score to Mathematics
UPDATE scores
SET subject="Mathematics"
WHERE subject="Math_score";

# Changing science_score to Science
UPDATE scores
SET subject="Science"
WHERE subject="science_score";

# Changing english_score to English
UPDATE scores
SET subject="English"
WHERE subject="english_score";


# Students Table
DESC students;
SELECT * FROM students;

# Changing the data type of each column in the students table

# Student_id column
ALTER TABLE students MODIFY student_id Varchar(50);

# Gender column
ALTER TABLE students MODIFY gender Varchar(50);

# Grade_level column
ALTER TABLE students MODIFY grade_level Varchar(50);

# study_group column
ALTER TABLE students MODIFY study_group Varchar(50);

# Confirmation
DESC students;


SELECT * FROM attendance;
SELECT * FROM extracurricular;
SELECT * FROM scores;
SELECT * FROM students;

# Business Requirements

# Basic Insights – School Snapshot 
# 1. Provide a list of all students with their grade level and study group. (Principal wants a quick 
# overview.) 
SELECT student_id,grade_level,study_group FROM students;
# 2. Show the total number of students by gender. (School wants to track gender balance.) 
SELECT gender, COUNT(student_id) AS Total_students
FROM students
GROUP BY gender;
# 3. Calculate the average score in each subject across the school. (Academic board wants subject-level 
# insights.) 
SELECT subject,Round(AVG(score),1) AS Avg_score
FROM scores
GROUP BY subject;
# 4. Identify students who scored above 80 in Math. (Teachers want to recognize top performers.) 
SELECT student_id,subject,score
FROM scores
WHERE subject = "Mathematics" AND score>80;
# Knowing the top results
SELECT student_id,subject,score
FROM scores
WHERE subject = "Mathematics" AND score>80
ORDER BY score DESC;
# Additional insight (How many students scored above 80 in Math)
SELECT subject, COUNT(student_id) AS student_count
FROM scores
WHERE subject="Mathematics" AND score>80
GROUP BY subject;

# 5. How many students have an attendance rate above 90%? (School wants to reward consistent students.)
SELECT COUNT(student_id) AS student_count
FROM attendance
WHERE attendance_percent>90;
# THE ID of the students with attendance rate above 90%
SELECT student_id FROM attendance
WHERE attendance_percent>90;

# 6. What is the average attendance % per grade level? (Helps identify classes with weak attendance.) 
SELECT grade_level, Round(AVG(attendance_percent),1) AS Avg_attendance
FROM attendance
JOIN students ON attendance.student_id = students.student_id
GROUP BY grade_level
ORDER BY Avg_attendance;

# 7. Compare average Science scores by gender. (School wants to check performance gaps.) 
SELECT gender, subject,Round(AVG(score),1) AS Avg_score
FROM students
JOIN scores ON students.student_id = scores.student_id
WHERE subject ="Science"
GROUP BY gender,subject;

# 8. List the top 5 students with the highest average scores across all subjects. (Candidates for 
# scholarship awards.) 
SELECT subject,student_id,score FROM scores
ORDER BY score DESC LIMIT 5;

# 9. Show the average score per subject by grade level. (Teachers want to know where to improve.) 
SELECT grade_level,subject,Round(AVG(score),1) AS avg_score FROM students
JOIN scores ON students.student_id=scores.student_id
GROUP BY grade_level,subject;
# 10. Which students participate in Sports and have an attendance rate above 85%? (Sports master’s 
# request.) 
SELECT e.student_id,e.extra_curricular,a.attendance_percent FROM extracurricular e
LEFT JOIN attendance a ON e.student_id = a.student_id
WHERE extra_curricular = "sports" AND attendance_percent > 85;

# 11. Count the number of students in each extracurricular activity. (Helps plan budget allocation.) 
SELECT extra_curricular,COUNT(student_id) AS student_count FROM extracurricular
GROUP BY extra_curricular;
# 12. Which subject has the highest overall average score? (School wants to highlight academic strengths.) 
SELECT subject,Round(AVG(score),2) AS H_Avg_Score
FROM scores
GROUP BY subject
ORDER BY  H_Avg_Score DESC LIMIT 1;
# 13. Show average attendance percentage grouped by study group. (Track study group discipline.) 
SELECT s.study_group,Round(AVG(a.attendance_percent),2)AS Avg_attendance
FROM Students s
LEFT JOIN attendance a ON s.student_id = a.student_id
GROUP BY study_group
ORDER BY Avg_attendance DESC;

# 14. List students with perfect attendance (100%). (To be recognized on assembly ground.) 
SELECT *  FROM attendance
WHERE attendance_percent >=100;
# No student with pefect attendance
# 15. What is the average Math score of students who do not participate in extracurricular activities?
# (Check if academics-only students perform better.)
SELECT s.subject,s.score,s.student_id,e.extra_curricular,Round(AVG(score),1) AS Avg_math_score FROM scores s
RIGHT JOIN extracurricular e ON s.student_id = e.student_id
WHERE subject ="Mathematics" AND extra_curricular = "None"
GROUP BY s.subject,s.score,s.student_id,e.extra_curricular;

# Advanced Insights – Strategic Decisions 
# 16. Identify students whose average score is above the overall school average. (Spot rising stars.) 
SELECT student_id,score FROM scores 
WHERE score >(SELECT AVG(score)FROM scores);

# 17. Which students scored higher than the average English score of their grade level? (English 
# department review.) 
SELECT st.student_id,s.score,s.subject,st.grade_level FROM scores s
JOIN students st ON s.student_id=st.student_id
 WHERE s.subject = "English" AND s.score>(SELECT AVG(score) FROM scores s);

# 18. Which study group has the best average attendance? (School wants to reward the best group.) 
SELECT study_group, AVG(attendance_percent)FROM students
JOIN attendance ON students.student_id=attendance.student_id
WHERE attendance_percent = (SELECT AVG(attendance_percent) FROM attendance
 ORDER BY attendance_percent);
19. Identify the student(s) with the highest average Science score. (Nominees for Science competition.) 
20. Which grade level has the lowest Math average score? (Principal wants targeted intervention.) 
21. Retrieve the average attendance % by extracurricular activity and rank them. (Check which 
activities affect attendance positively.) 
22. Which students scored above their gender’s average in all three subjects? (Equity-focused 
performance check.) 
23. Show the difference between male and female average scores per subject. (Gender performance gap 
analysis.) 
24. Which Grade 12 students have attendance above the school-wide average? (Final-year students’ 
discipline check.) 
25. Identify top performers: students with an average score above 85 and attendance above 90%. 
(Candidates for “Student of the Year.”) 
Extended Insights – Going Beyond 
26. Which extracurricular activity has the highest number of participants in Grade 11? (Helps allocate
27. List the bottom 5 students with the lowest average scores. (For remedial class recommendation.) 
28. Show the grade level with the best overall performance across all subjects. (Principal wants to 
reward the best class.)






