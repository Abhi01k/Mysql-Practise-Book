--- Advanced Queries ---

-- 1. Retrieve Records with Amount Greater than Average by MerchantName
SELECT MerchantName, COUNT(*) AS Count 
FROM Payin 
WHERE Amount > (SELECT AVG(Amount) FROM Payin) 
GROUP BY MerchantName;

-- 2. Retrieve Records with DateTime in the Last 365 Days and Amount Aggregated by Gateway
SELECT Gateway, SUM(Amount) AS TotalAmount 
FROM Payin 
WHERE DateTime > NOW() - INTERVAL 365 DAY 
GROUP BY Gateway;

-- 3. Retrieve Records with Commission Greater than 10% of the Average Amount
SELECT * 
FROM Payin 
WHERE Commission > 0.10 * (SELECT AVG(Amount) FROM Payin);

-- 4. Retrieve Records with the Most Frequent MerchantID
SELECT MerchantID, COUNT(*) AS Count 
FROM Payin 
GROUP BY MerchantID 
ORDER BY Count DESC 
LIMIT 1;

-- 5. Retrieve Records with DateTime Grouped by Month and Year, Showing the Total Amount
SELECT YEAR(DateTime) AS Year, MONTH(DateTime) AS Month, SUM(Amount) AS TotalAmount 
FROM Payin 
GROUP BY YEAR(DateTime), MONTH(DateTime);

-- 6. Retrieve Records with Amount Greater than the Average for a Specific MerchantID
SELECT * 
FROM Payin 
WHERE Amount > (SELECT AVG(Amount) FROM Payin WHERE MerchantID = 'Avisuraium_5j3xatgbj');

-- 7. Retrieve Records with a Specific Amount and Status Count in the Last 60 Days
SELECT Status, COUNT(*) AS Count 
FROM Payin 
WHERE Amount = 390.00 AND DateTime > NOW() - INTERVAL 60 DAY 
GROUP BY Status;

-- 8. Retrieve Records by MerchantEmail and Sum of Amount, Ordered by Total Amount
SELECT MerchantEmail, SUM(Amount) AS TotalAmount 
FROM Payin 
GROUP BY MerchantEmail 
ORDER BY TotalAmount DESC;

-- 9. Retrieve Records with DateTime in the Last 90 Days and MerchantID Count
SELECT MerchantID, COUNT(*) AS Count 
FROM Payin 
WHERE DateTime > NOW() - INTERVAL 90 DAY 
GROUP BY MerchantID;

-- 10. Retrieve Records with a Specific VPA and Sum of Commission
SELECT VPA, SUM(Commission) AS TotalCommission 
FROM Payin 
WHERE VPA = 'peblitz.avisuraiumtech@timecosmos' 
GROUP BY VPA;

-- 11. Retrieve Records with the Top 5 Highest Amounts and Their Corresponding MerchantNames
SELECT MerchantName, Amount 
FROM Payin 
ORDER BY Amount DESC 
LIMIT 5;

-- 12. Retrieve Records with DateTime in the Last 180 Days, Grouped by Status
SELECT Status, COUNT(*) AS Count 
FROM Payin 
WHERE DateTime > NOW() - INTERVAL 180 DAY 
GROUP BY Status;

-- 13. Retrieve Records with the Highest Total Amount by MerchantName
SELECT MerchantName, SUM(Amount) AS TotalAmount 
FROM Payin 
GROUP BY MerchantName 
ORDER BY TotalAmount DESC 
LIMIT 1;

-- 14. Retrieve Records with a Specific Commission and Count by MerchantEmail
SELECT MerchantEmail, COUNT(*) AS Count 
FROM Payin 
WHERE Commission = 0.00 
GROUP BY MerchantEmail;

-- 15. Retrieve Records with DateTime in the Last 30 Days, and Find the Merchant with Highest Total Amount
SELECT MerchantName, SUM(Amount) AS TotalAmount 
FROM Payin 
WHERE DateTime > NOW() - INTERVAL 30 DAY 
GROUP BY MerchantName 
ORDER BY TotalAmount DESC 
LIMIT 1;

-- 16. Retrieve Records with Specific Gateway and the Top 5 Highest Amounts
SELECT * 
FROM Payin 
WHERE Gateway = 'timepay' 
ORDER BY Amount DESC 
LIMIT 5;

-- 17. Retrieve Records with the Highest Commission and their MerchantName
SELECT MerchantName, Commission 
FROM Payin 
WHERE Commission = (SELECT MAX(Commission) FROM Payin);

-- 18. Retrieve Records with DateTime in the Last Year, Grouped by Month, and Total Amount
SELECT YEAR(DateTime) AS Year, MONTH(DateTime) AS Month, SUM(Amount) AS TotalAmount 
FROM Payin 
WHERE DateTime > NOW() - INTERVAL 1 YEAR 
GROUP BY YEAR(DateTime), MONTH(DateTime);


-- 21. Retrieve Records with DateTime in the Last 60 Days and the Merchant with the Lowest Total Amount
SELECT MerchantName, SUM(Amount) AS TotalAmount 
FROM Payin 
WHERE DateTime > NOW() - INTERVAL 60 DAY 
GROUP BY MerchantName 
ORDER BY TotalAmount ASC 
LIMIT 1;

-- 22. Retrieve Records with the Average Amount by Status, and List the Statuses with Above Average Amounts
SELECT Status, AVG(Amount) AS AverageAmount 
FROM Payin 
GROUP BY Status 
HAVING AVG(Amount) > (SELECT AVG(Amount) FROM Payin);


-- 24. Retrieve Records with MerchantID and the Sum of Amount Grouped by Status
SELECT Status, MerchantID, SUM(Amount) AS TotalAmount 
FROM Payin 
GROUP BY Status, MerchantID;

-- 25. Retrieve Records with DateTime in the Last 90 Days and the Merchant with the Highest Commission
SELECT MerchantName, SUM(Commission) AS TotalCommission 
FROM Payin 
WHERE DateTime > NOW() - INTERVAL 90 DAY 
GROUP BY MerchantName 
ORDER BY TotalCommission DESC 
LIMIT 1;


-- 28. Retrieve Records with Status 'Pending' and MerchantName Containing 'Tech'
SELECT MerchantName, COUNT(*) AS Count 
FROM Payin 
WHERE Status = 'Pending' AND MerchantName LIKE '%Tech%' 
GROUP BY MerchantName;

-- 29. Retrieve Records Grouped by Gateway and Count of Transactions in the Last 30 Days
SELECT Gateway, COUNT(*) AS Count 
FROM Payin 
WHERE DateTime > NOW() - INTERVAL 30 DAY 
GROUP BY Gateway;

-- 30. Retrieve Records with the Lowest Total Commission by MerchantName
SELECT MerchantName, SUM(Commission) AS TotalCommission 
FROM Payin 
GROUP BY MerchantName 
ORDER BY TotalCommission ASC 
LIMIT 1;

-- 31. Retrieve Records with DateTime in the Last 365 Days and the Average Amount per Status
SELECT Status, AVG(Amount) AS AverageAmount 
FROM Payin 
WHERE DateTime > NOW() - INTERVAL 365 DAY 
GROUP BY Status;

-- 32. Retrieve Records by MerchantEmail and DateTime in the Last 90 Days, Grouped by MerchantID
SELECT MerchantID, MerchantEmail, COUNT(*) AS Count 
FROM Payin 
WHERE DateTime > NOW() - INTERVAL 90 DAY 
GROUP BY MerchantID, MerchantEmail;

-- 33. Retrieve Records with Commission Greater than Average and Amount Sorted by DateTime
SELECT * 
FROM Payin 
WHERE Commission > (SELECT AVG(Commission) FROM Payin) 
ORDER BY DateTime DESC;

-- 34. Retrieve Records with MerchantName Containing 'Private Limited' and Total Amount by MerchantEmail
SELECT MerchantEmail, SUM(Amount) AS TotalAmount 
FROM Payin 
WHERE MerchantName LIKE '%Private Limited%' 
GROUP BY MerchantEmail;

-- 35. Retrieve Records with DateTime in the Last 30 Days, Grouped by MerchantID and Status
SELECT MerchantID, Status, COUNT(*) AS Count 
FROM Payin 
WHERE DateTime > NOW() - INTERVAL 30 DAY 
GROUP BY MerchantID, Status;

-- 37. Retrieve Records with DateTime and MerchantName in the Last 6 Months, Grouped by Status
SELECT MerchantName, Status, COUNT(*) AS Count 
FROM Payin 
WHERE DateTime > NOW() - INTERVAL 6 MONTH 
GROUP BY MerchantName, Status;

-- 39. Retrieve Records with DateTime in the Last 90 Days and the Top 5 MerchantIDs by Total Amount
SELECT MerchantID, SUM(Amount) AS TotalAmount 
FROM Payin 
WHERE DateTime > NOW() - INTERVAL 90 DAY 
GROUP BY MerchantID 
ORDER BY TotalAmount DESC 
LIMIT 5;

-- 40. Retrieve Records Grouped by MerchantName and DateTime in the Last 180 Days, Showing Total Commission
SELECT MerchantName, SUM(Commission) AS TotalCommission 
FROM Payin 
WHERE DateTime > NOW() - INTERVAL 180 DAY 
GROUP BY MerchantName;

-- 41. Retrieve Records by Specific VPA and the Top 10 Amounts
SELECT * 
FROM Payin 
WHERE VPA = 'peblitz.avisuraiumtech@timecosmos' 
ORDER BY Amount DESC 
LIMIT 10;

-- 42. Retrieve Records with the Highest Total Amount by MerchantName and the DateTime Range
SELECT MerchantName, SUM(Amount) AS TotalAmount 
FROM Payin 
WHERE DateTime BETWEEN '2024-01-01' AND '2024-12-31' 
GROUP BY MerchantName 
ORDER BY TotalAmount DESC 
LIMIT 1;

-- 44. Retrieve Records with DateTime in the Last 60 Days and the Average Amount Grouped by MerchantName
SELECT MerchantName, AVG(Amount) AS AverageAmount 
FROM Payin 
WHERE DateTime > NOW() - INTERVAL 60 DAY 
GROUP BY MerchantName;

-- 45. Retrieve Records by MerchantID and DateTime, Showing the Count and Average Commission
SELECT MerchantID, COUNT(*) AS Count, AVG(Commission) AS AverageCommission 
FROM Payin 
WHERE DateTime > NOW() - INTERVAL 90 DAY 
GROUP BY MerchantID;

-- 46. Retrieve Records with Specific VPA and Status Count in the Last 90 Days
SELECT Status, COUNT(*) AS Count 
FROM Payin 
WHERE VPA = 'peblitz.avisuraiumtech@timecosmos' 
AND DateTime > NOW() - INTERVAL 90 DAY 
GROUP BY Status;

-- 48. Retrieve Records with the Most Recent DateTime and the Top 10 Highest Amounts
SELECT * 
FROM Payin 
WHERE DateTime = (SELECT MAX(DateTime) FROM Payin) 
ORDER BY Amount DESC 
LIMIT 10;

-- 49. Retrieve Records with DateTime in the Last 180 Days and the Average Commission Grouped by Status
SELECT Status, AVG(Commission) AS AverageCommission 
FROM Payin 
WHERE DateTime > NOW() - INTERVAL 180 DAY 
GROUP BY Status;
