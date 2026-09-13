-- 1. Total Doctors
SELECT * FROM hospital_analysis.`doctor-data`;

SELECT COUNT(*) AS Total_Doctors
FROM `hospital_analysis`.`doctor-data`;

-- 2. Doctors by Department
SELECT Department, COUNT(*) AS Doctor_Count
FROM `hospital_analysis`.`doctor-data`
GROUP BY Department
ORDER BY Doctor_Count DESC;

-- 3. Doctors by Experience Bracket
SELECT
    CASE
        WHEN `Experience (Years)` BETWEEN 0 AND 5 THEN '0-5 Years'
        WHEN `Experience (Years)` BETWEEN 6 AND 10 THEN '5-10 Years'
        WHEN `Experience (Years)` BETWEEN 11 AND 15 THEN '10-15 Years'
        ELSE '15+ Years'
    END AS Experience_Bracket,
    COUNT(*) AS Count
FROM `hospital_analysis`.`doctor-data`
GROUP BY Experience_Bracket;

-- 4. Average Consultation Fee
SELECT ROUND(AVG(`Consultation Fee (?)`), 2) AS Avg_Fee_Overall
FROM `hospital_analysis`.`doctor-data`;

-- 5. Average Consultation Fee by Department
SELECT Department, ROUND(AVG(`Consultation Fee (?)`), 2) AS Avg_Fee
FROM `hospital_analysis`.`doctor-data`
GROUP BY Department
ORDER BY Avg_Fee DESC;

-- 6. Average Experience by Department
SELECT Department, ROUND(AVG(`Experience (Years)`), 1) AS Avg_Experience
FROM `hospital_analysis`.`doctor-data`
GROUP BY Department
ORDER BY Avg_Experience DESC;

-- 7. Doctors by Gender
SELECT Gender, COUNT(*) AS Count
FROM `hospital_analysis`.`doctor-data`
GROUP BY Gender;

-- 8. Doctors with 15+ Years Experience
SELECT DoctorID, `Doctor Name`, Department, Specialization, `Experience (Years)`
FROM `hospital_analysis`.`doctor-data`
WHERE `Experience (Years)` >= 15
ORDER BY `Experience (Years)` DESC;

-- 9. Top 10 Doctors by Consultation Fee
SELECT `Doctor Name`, Department, `Consultation Fee (?)`
FROM `hospital_analysis`.`doctor-data`
ORDER BY `Consultation Fee (?)` DESC
LIMIT 10;

-- 10. Doctors by Qualification
SELECT Qualification, COUNT(*) AS Count
FROM `hospital_analysis`.`doctor-data`
GROUP BY Qualification
ORDER BY Count DESC;

-- 11. Duplicate Doctor Records
SELECT DoctorID, COUNT(*) AS Count
FROM `hospital_analysis`.`doctor-data`
GROUP BY DoctorID
HAVING COUNT(*) > 1;
