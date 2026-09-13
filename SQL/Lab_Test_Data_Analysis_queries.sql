SELECT * FROM hospital_analysis.`lab-test-data`;

SELECT COUNT(*) AS Total_Tests
FROM `hospital_analysis`.`lab-test-data`;

SELECT COUNT(*) AS Tests_Today
FROM `hospital_analysis`.`lab-test-data`
WHERE `Test Date` = CURDATE();

SELECT `Test Name`, COUNT(*) AS Count
FROM `hospital_analysis`.`lab-test-data`
GROUP BY `Test Name`
ORDER BY Count DESC;

SELECT Result, COUNT(*) AS Count,
       ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM `hospital_analysis`.`lab-test-data`), 2) AS Percent
FROM `hospital_analysis`.`lab-test-data`
GROUP BY Result;

SELECT DATE_FORMAT(`Test Date`, '%Y-%m') AS Test_Month, COUNT(*) AS Test_Count
FROM `hospital_analysis`.`lab-test-data`
GROUP BY Test_Month
ORDER BY Test_Month;

SELECT `Technician Name`, COUNT(*) AS Tests_Handled
FROM `hospital_analysis`.`lab-test-data`
GROUP BY `Technician Name`
ORDER BY Tests_Handled DESC;

SELECT PatientID, `Patient Name`, `Test Name`, Result, `Test Date`
FROM `hospital_analysis`.`lab-test-data`
WHERE Result = 'Abnormal'
ORDER BY `Test Date` DESC;

SELECT `Test Name`, ROUND(AVG(`Cost (?)`), 2) AS Avg_Cost
FROM `hospital_analysis`.`lab-test-data`
GROUP BY `Test Name`
ORDER BY Avg_Cost DESC;

SELECT TestID, COUNT(*) AS Count
FROM `hospital_analysis`.`lab-test-data`
GROUP BY TestID
HAVING COUNT(*) > 1;