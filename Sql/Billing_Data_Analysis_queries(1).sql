-- 1. Total Bills
SELECT * FROM hospital_analysis.`billing-data-`;

SELECT COUNT(*) AS Total_Bills
FROM `hospital_analysis`.`billing-data-`;

-- 2. Total Amount, Amount Received and Pending Amount
SELECT
    SUM(`Total amount (?)`) AS Total_Amount,
    SUM(CASE WHEN `Payment Status` = 'Paid' THEN `Total amount (?)` ELSE 0 END) AS Amount_Received,
    SUM(CASE WHEN `Payment Status` IN ('Pending','Partially Paid') THEN `Total amount (?)` ELSE 0 END) AS Pending_Amount
FROM `hospital_analysis`.`billing-data-`;

-- 3. Today's Collection
SELECT SUM(`Total amount (?)`) AS Todays_Collection
FROM `hospital_analysis`.`billing-data-`
WHERE `Admission Date` = CURDATE()
  AND `Payment Status` = 'Paid';

-- 4. Average Bill Amount
SELECT ROUND(AVG(`Total amount (?)`), 2) AS Avg_Bill_Amount
FROM `hospital_analysis`.`billing-data-`;

-- 5. Payment Status Distribution
SELECT `Payment Status`, COUNT(*) AS Count,
       ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM `hospital_analysis`.`billing-data-`), 2) AS Percent
FROM `hospital_analysis`.`billing-data-`
GROUP BY `Payment Status`;

-- 6. Payment Mode Distribution
SELECT `Payment Mode`, COUNT(*) AS Count,
       ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM `hospital_analysis`.`billing-data-`), 2) AS Percent
FROM `hospital_analysis`.`billing-data-`
GROUP BY `Payment Mode`
ORDER BY Count DESC;

-- 7. Top 5 Patients by Doctor Fee
SELECT PatientID, `Doctor Fee (?)`
FROM `hospital_analysis`.`billing-data-`
ORDER BY `Doctor Fee (?)` DESC
LIMIT 5;

-- 8. Top 5 Patients by Room Charges
SELECT PatientID, `Room type`, `Room Charges (?)`
FROM `hospital_analysis`.`billing-data-`
ORDER BY `Room Charges (?)` DESC
LIMIT 5;

-- 9. Top 5 Patients by Medicine Charges
SELECT PatientID, `Medicine Charges (?)`
FROM `hospital_analysis`.`billing-data-`
ORDER BY `Medicine Charges (?)` DESC
LIMIT 5;

-- 10. Top 5 Patients by Lab Charges
SELECT PatientID, `Lab Charges (?)`
FROM `hospital_analysis`.`billing-data-`
ORDER BY `Lab Charges (?)` DESC
LIMIT 5;

-- 11. Revenue by Room Type
SELECT `Room type`, SUM(`Total amount (?)`) AS Revenue, COUNT(*) AS Bill_Count
FROM `hospital_analysis`.`billing-data-`
GROUP BY `Room type`
ORDER BY Revenue DESC;

-- 12. Unpaid and Partially Paid Bills
SELECT BillID, PatientID, `Patient Name`, `Total amount (?)`, `Payment Status`
FROM `hospital_analysis`.`billing-data-`
WHERE `Payment Status` != 'Paid'
ORDER BY `Total amount (?)` DESC;

-- 13. Monthly Billing Revenue
SELECT DATE_FORMAT(`Admission Date`, '%Y-%m') AS Bill_Month, SUM(`Total amount (?)`) AS Revenue
FROM `hospital_analysis`.`billing-data-`
GROUP BY Bill_Month
ORDER BY Bill_Month;

-- 14. Duplicate Bill Records
SELECT BillID, COUNT(*) AS Count
FROM `hospital_analysis`.`billing-data-`
GROUP BY BillID
HAVING COUNT(*) > 1;
