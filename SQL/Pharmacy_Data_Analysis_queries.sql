SELECT * FROM hospital_analysis.`pharmacy-data`;

SELECT SUM(`Stock Quantity`) AS Total_Medicines_In_Stock
FROM `hospital_analysis`.`pharmacy-data`;

SELECT SUM(`Stock Value (?)`) AS Total_Stock_Value
FROM `hospital_analysis`.`pharmacy-data`;

SELECT MedicineID, `Medicine Name`, `Stock Quantity`, `Reorder Level`, Supplier
FROM `hospital_analysis`.`pharmacy-data`
WHERE `Stock Quantity` <= `Reorder Level`
ORDER BY `Stock Quantity`;

SELECT
    SUM(`Stock Quantity` > `Reorder Level`) AS In_Stock_Count,
    SUM(`Stock Quantity` <= `Reorder Level`) AS Low_Stock_Count
FROM `hospital_analysis`.`pharmacy-data`;

SELECT Category, COUNT(*) AS Medicine_Count
FROM `hospital_analysis`.`pharmacy-data`
GROUP BY Category
ORDER BY Medicine_Count DESC;

SELECT `Medicine Name`, Category, `Stock Value (?)`
FROM `hospital_analysis`.`pharmacy-data`
ORDER BY `Stock Value (?)` DESC
LIMIT 5;

SELECT COUNT(DISTINCT Supplier) AS Total_Suppliers
FROM `hospital_analysis`.`pharmacy-data`;

SELECT Supplier, SUM(`Stock Value (?)`) AS Total_Value
FROM `hospital_analysis`.`pharmacy-data`
GROUP BY Supplier
ORDER BY Total_Value DESC;

SELECT MedicineID, `Medicine Name`, `Expiry Date`, `Stock Quantity`
FROM `hospital_analysis`.`pharmacy-data`
WHERE `Expiry Date` BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 90 DAY)
ORDER BY `Expiry Date`;

SELECT MedicineID, `Medicine Name`, `Expiry Date`, `Stock Quantity`
FROM `hospital_analysis`.`pharmacy-data`
WHERE `Expiry Date` < CURDATE();

SELECT Category, ROUND(AVG(`Unit Price (?)`), 2) AS Avg_Unit_Price
FROM `hospital_analysis`.`pharmacy-data`
GROUP BY Category
ORDER BY Avg_Unit_Price DESC;

SELECT MedicineID, COUNT(*) AS Count
FROM `hospital_analysis`.`pharmacy-data`
GROUP BY MedicineID
HAVING COUNT(*) > 1;