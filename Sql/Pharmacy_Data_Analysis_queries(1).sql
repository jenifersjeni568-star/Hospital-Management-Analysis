-- 1. Total Medicines in Stock
SELECT * FROM hospital_analysis.`pharmacy-data`;

SELECT SUM(`Stock Quantity`) AS Total_Medicines_In_Stock
FROM `hospital_analysis`.`pharmacy-data`;

-- 2. Total Stock Value
SELECT SUM(`Stock Value (?)`) AS Total_Stock_Value
FROM `hospital_analysis`.`pharmacy-data`;

-- 3. Low Stock Medicines
SELECT MedicineID, `Medicine Name`, `Stock Quantity`, `Reorder Level`, Supplier
FROM `hospital_analysis`.`pharmacy-data`
WHERE `Stock Quantity` <= `Reorder Level`
ORDER BY `Stock Quantity`;

-- 4. In-Stock and Low-Stock Count
SELECT
    SUM(`Stock Quantity` > `Reorder Level`) AS In_Stock_Count,
    SUM(`Stock Quantity` <= `Reorder Level`) AS Low_Stock_Count
FROM `hospital_analysis`.`pharmacy-data`;

-- 5. Medicines by Category
SELECT Category, COUNT(*) AS Medicine_Count
FROM `hospital_analysis`.`pharmacy-data`
GROUP BY Category
ORDER BY Medicine_Count DESC;

-- 6. Top 5 Medicines by Stock Value
SELECT `Medicine Name`, Category, `Stock Value (?)`
FROM `hospital_analysis`.`pharmacy-data`
ORDER BY `Stock Value (?)` DESC
LIMIT 5;

-- 7. Total Number of Suppliers
SELECT COUNT(DISTINCT Supplier) AS Total_Suppliers
FROM `hospital_analysis`.`pharmacy-data`;

-- 8. Stock Value by Supplier
SELECT Supplier, SUM(`Stock Value (?)`) AS Total_Value
FROM `hospital_analysis`.`pharmacy-data`
GROUP BY Supplier
ORDER BY Total_Value DESC;

-- 9. Medicines Expiring Within 90 Days
SELECT MedicineID, `Medicine Name`, `Expiry Date`, `Stock Quantity`
FROM `hospital_analysis`.`pharmacy-data`
WHERE `Expiry Date` BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 90 DAY)
ORDER BY `Expiry Date`;

-- 10. Expired Medicines
SELECT MedicineID, `Medicine Name`, `Expiry Date`, `Stock Quantity`
FROM `hospital_analysis`.`pharmacy-data`
WHERE `Expiry Date` < CURDATE();

-- 11. Average Unit Price by Category
SELECT Category, ROUND(AVG(`Unit Price (?)`), 2) AS Avg_Unit_Price
FROM `hospital_analysis`.`pharmacy-data`
GROUP BY Category
ORDER BY Avg_Unit_Price DESC;

-- 12. Duplicate Medicine Records
SELECT MedicineID, COUNT(*) AS Count
FROM `hospital_analysis`.`pharmacy-data`
GROUP BY MedicineID
HAVING COUNT(*) > 1;
