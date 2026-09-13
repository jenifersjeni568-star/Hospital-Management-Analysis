-- 1. Total Departments
SELECT COUNT(*) AS Total_Departments
FROM `hospital_analysis`.`hospital-data`;

-- 2. Total Beds, Occupied, Available (overall)
SELECT
    SUM(`Total Beds`) AS Total_Beds,
    SUM(`Occupied Beds`) AS Occupied_Beds,
    SUM(`Available Beds`) AS Available_Beds
FROM `hospital_analysis`.`hospital-data`;

-- 3. Beds by Department
SELECT `Department Name`, SUM(`Total Beds`) AS Total_Beds
FROM `hospital_analysis`.`hospital-data`
GROUP BY `Department Name`
ORDER BY Total_Beds DESC;

-- 4. Bed Occupancy Rate by Department (%)
SELECT
    `Department Name`,
    SUM(`Occupied Beds`) AS Occupied,
    SUM(`Total Beds`) AS Total,
    ROUND(SUM(`Occupied Beds`) * 100.0 / SUM(`Total Beds`), 2) AS Occupancy_Percent
FROM `hospital_analysis`.`hospital-data`
GROUP BY `Department Name`
ORDER BY Occupancy_Percent DESC;

-- 5. Total Staff (Nursing + Support)
SELECT
    SUM(`Nursing Staff`) AS Total_Nursing_Staff,
    SUM(`Support Staff`) AS Total_Support_Staff,
    SUM(`Nursing Staff` + `Support Staff`) AS Total_Staff
FROM `hospital_analysis`.`hospital-data`;

-- 6. Total Doctors per Department
SELECT `Department Name`, SUM(`Total Doctors`) AS Total_Doctors
FROM `hospital_analysis`.`hospital-data`
GROUP BY `Department Name`
ORDER BY Total_Doctors DESC;

-- 7. Beds by Floor
SELECT `Floor No`, SUM(`Total Beds`) AS Total_Beds
FROM `hospital_analysis`.`hospital-data`
GROUP BY `Floor No`
ORDER BY `Floor No`;

-- 8. Departments with Low Bed Availability (<10% free)
SELECT `Department Name`, `Available Beds`, `Total Beds`,
       ROUND(`Available Beds` * 100.0 / `Total Beds`, 2) AS Available_Percent
FROM `hospital_analysis`.`hospital-data`
WHERE (`Available Beds` * 100.0 / `Total Beds`) < 10
ORDER BY Available_Percent;

-- 9. Head of Department list
SELECT `Department Name`, `Head of Department`
FROM `hospital_analysis`.`hospital-data`
ORDER BY `Department Name`;

-- 10. ICU Beds & Ventilators by Department
SELECT `Department Name`, `ICU Beds`, `Ventilators Count`
FROM `hospital_analysis`.`hospital-data`
ORDER BY `ICU Beds` DESC;

-- 11. Department Rating (Top rated)
SELECT `Department Name`, `Department Rating`
FROM `hospital_analysis`.`hospital-data`
ORDER BY `Department Rating` DESC
LIMIT 10;

-- 12. Emergency Service Availability
SELECT `Emergency Service (24/7)`, COUNT(*) AS Count
FROM `hospital_analysis`.`hospital-data`
GROUP BY `Emergency Service (24/7)`;

-- 13. Equipment Count by Department
SELECT `Department Name`, `Equipment Count`, `Maintenance Status`
FROM `hospital_analysis`.`hospital-data`
ORDER BY `Equipment Count` DESC;
