# 🎓 student-performance-sql-excel-analysis

📌 Project Overview

Tofunmi Senku Academy (Osaka, Japan) required a data-driven strategy to unify fragmented student records into a centralized analytical system. This project identifies performance drivers, students at risk, and engagement gaps across a student body of 750 individuals.
________________________________________
❓ Problem Statement

The academy faced challenges correlating demographic data with academic and attendance outcomes because data was stored in siloed flat files. This made it difficult to pinpoint why certain grades or study groups were underperforming or disengaging.
________________________________________
💡 Solution & Key Insights

•	Relational Architecture: Engineered a MySQL schema to connect student demographics with scores and attendance.

•	Data Refinement: Cleaned and standardized data via SQL, including column renaming and datatype modifications for accurate time-series analysis.

•	Performance Drivers: Analysis revealed that Art and Music participation serves as a primary driver for higher attendance.

•	At-Risk Identification: Grade 12 was identified as a critical at-risk group, showing a significant dip in attendance below the 80.16% school average.
________________________________________
🏗️ Relational Schema & Connections

The database uses a 1:N (One-to-Many) Non-Identifying Relationship model to ensure data integrity.

•	The Hub: The Students table is the "Parent," containing the unique student_id, gender, and grade level.

•	The Connections: The Scores, Attendance, and Extracurricular tables are "Children".

•	The Link: These tables connect via the student_id Foreign Key, allowing for complex joins to track how study group dynamics affect specific subject outcomes.
________________________________________
📊 Key Analysis & Outcomes

📈 School-Wide Averages

Category	Average Metric

Math Score	69.91

English Score	69.82

Science Score	69.83

Attendance Rate	80.16%

🚻  1 Gender Performance Breakdown (Subject-by-Subject)

Analysis of subject scores reveals specific strengths across genders:

	Male Average	 and Female Average

Science	69.90	69.75

Mathematics	69.95	69.88

English	69.65	70.00

Attendance	80.05%	80.25%

 🏫 2. Grade Level & Study Group Standing
 
Segment	Metric / Status	Significance

Grade 9	80.52% Attendance	Highest engagement level.

Grade 12	79.80% Attendance	Lowest attendance; priority for intervention.

Group C	80.55% Presence	Academic and attendance leaders.

Group B	Lowest Engagement (79.64%)	High score volatility.
________________________________________
🎯 Priority Student Lists (Data-Driven Action)

These lists were generated using logic from the 28 SQL business questions to move from "Charts" to "Actions".

🌟 Academic Ambassadors (High Performers)

•	Criteria: Average score above 80%.

•	Student IDs: (SQL Q4, Q17)

•	Action: Candidates for Monthly Gifting and peer-mentorship roles.

⚠️ Academic Intervention (Poor Performance)
•	Criteria: Students performing below the school average of 69.83%.

•	Student IDs: (SQL Q21)

•	Action: Priority enrollment for Extra Classes and Reading Timetables.

📉 Attendance Recovery (At-Risk)

•	Criteria: Attendance rate below 75%.

•	Student IDs.: (SQL Q5)

•	Action: Scheduled for Mental Health Talk Sessions and counseling.
________________________________________
🚀 Strategic Recommendations

•	Continuous Recognition: Implement monthly gifting for high performers to maintain year-round motivation.

•	Group Reshuffling: Periodically mix Group A and B with members of Group C to foster peer-mentorship.

•	Holistic Wellness: Prioritize professional talk sessions to address mental health as a core component of success.

•	Targeted STEM: Encourage female students in Science to bridge the minor identified performance gap.
________________________________________
📖 How to Use

1.	Schema: Run the SQL script to build the tables and the 1:N connections.
   
2.	Import: Use the MySQL Import Wizard for the cleaned student datasets.
   
3.	Analyze: Open the Excel file and use the Slicers to filter performance by Gender, Grade, or Study Group.
________________________________________
