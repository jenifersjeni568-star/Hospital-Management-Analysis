-- 1. Total Patients
SELECT * FROM hospital_analysis.`patient-data`;
SELECT COUNT(*) AS Total_Patients
FROM `hospital_analysis`.`patient-data`;

-- 2. Male and Female Patients
SELECT
    SUM(Gender = 'Male') AS Male_Patients,
    SUM(Gender = 'Female') AS Female_Patients
FROM `hospital_analysis`.`patient-data`;

-- 3. Patient Status Distribution
SELECT Status, COUNT(*) AS Count
FROM `hospital_analysis`.`patient-data`
GROUP BY Status;

-- 4. New Patients This Month
SELECT COUNT(*) AS New_Patients_This_Month
FROM `hospital_analysis`.`patient-data`
WHERE `Admission Date` >= DATE_FORMAT(CURDATE(), '%Y-%m-01');

-- 5. Patients by Department
SELECT Department, COUNT(*) AS Patient_Count
FROM `hospital_analysis`.`patient-data`
GROUP BY Department
ORDER BY Patient_Count DESC;

-- 6. Patients by Age Group
SELECT
    CASE
        WHEN Age BETWEEN 0 AND 18 THEN '0-18'
        WHEN Age BETWEEN 19 AND 35 THEN '19-35'
        WHEN Age BETWEEN 36 AND 50 THEN '36-50'
        WHEN Age BETWEEN 51 AND 65 THEN '51-65'
        ELSE '65+'
    END AS Age_Group,
    COUNT(*) AS Count
FROM `hospital_analysis`.`patient-data`
GROUP BY Age_Group
ORDER BY Age_Group;

-- 7. Blood Group Distribution
SELECT `Blood Group`, COUNT(*) AS Count
FROM `hospital_analysis`.`patient-data`
GROUP BY `Blood Group`
ORDER BY Count DESC;

-- 8. Room Type Distribution
SELECT `Room Type`, COUNT(*) AS Count
FROM `hospital_analysis`.`patient-data`
GROUP BY `Room Type`
ORDER BY Count DESC;

-- 9. Average Length of Stay by Diagnosis
SELECT Diagnosis, ROUND(AVG(`Length of Stay (Days)`), 1) AS Avg_Stay_Days
FROM `hospital_analysis`.`patient-data`
GROUP BY Diagnosis
ORDER BY Avg_Stay_Days DESC;

-- 10. Top 10 Diagnoses
SELECT Diagnosis, COUNT(*) AS Count
FROM `hospital_analysis`.`patient-data`
GROUP BY Diagnosis
ORDER BY Count DESC
LIMIT 10;

-- 11. Monthly Admissions
SELECT DATE_FORMAT(`Admission Date`, '%Y-%m') AS Admit_Month, COUNT(*) AS Admissions
FROM `hospital_analysis`.`patient-data`
GROUP BY Admit_Month
ORDER BY Admit_Month;

-- 12. Patients with Long Stay
SELECT PatientID, `Patient Name`, Diagnosis, `Length of Stay (Days)`, `Assigned Doctor`
FROM `hospital_analysis`.`patient-data`
WHERE `Length of Stay (Days)` > 10
ORDER BY `Length of Stay (Days)` DESC;

-- 13. Patients Handled by Each Doctor
SELECT `Assigned Doctor`, COUNT(*) AS Patients_Handled
FROM `hospital_analysis`.`patient-data`
GROUP BY `Assigned Doctor`
ORDER BY Patients_Handled DESC;

-- 14. Duplicate Patient Records
SELECT PatientID, COUNT(*) AS Count
FROM `hospital_analysis`.`patient-data`
GROUP BY PatientID
HAVING COUNT(*) > 1;
