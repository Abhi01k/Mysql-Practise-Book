--- Intermediate Queries ---


-- 1. Retrieve Records with Amount Greater than Average Amount
SELECT * FROM Payin WHERE Amount > (SELECT AVG(Amount) FROM Payin);

-- 2. Retrieve Records Grouped by Status and Count
SELECT Status, COUNT(*) AS Count FROM Payin GROUP BY Status;

-- 3. Retrieve Records with DateTime in a Specific Year
SELECT * FROM Payin WHERE YEAR(DateTime) = 2024;

-- 4. Retrieve Records with Amount Greater than 100 and Less than 500
SELECT * FROM Payin WHERE Amount > 100 AND Amount < 500;

-- 5. Retrieve Records by MerchantName, Excluding Certain Names
SELECT * FROM Payin WHERE MerchantName NOT IN ('ABC Inc.', 'XYZ Ltd.');

-- 6. Retrieve Records with a Specific Commission Value and DateTime in a Range
SELECT * FROM Payin WHERE Commission = 0.00 AND DateTime BETWEEN '2024-07-01' AND '2024-07-31';


-- 8. Retrieve Records with DateTime Grouped by Year
SELECT YEAR(DateTime) AS Year, COUNT(*) AS Count FROM Payin GROUP BY YEAR(DateTime);

-- 9. Retrieve Records by MerchantEmail, Grouped by MerchantID
SELECT MerchantID, COUNT(*) AS Count FROM Payin WHERE MerchantEmail = 'avisu922@gmail.com' GROUP BY MerchantID;

-- 10. Retrieve Records with DateTime in the Last 6 Months
SELECT * FROM Payin WHERE DateTime > NOW() - INTERVAL 6 MONTH;

-- 11. Retrieve Records with Top 5 Amounts
SELECT * FROM Payin ORDER BY Amount DESC LIMIT 5;

-- 12. Retrieve Records with Amount in a Specific Range and Commission Greater than a Value
SELECT * FROM Payin WHERE Amount BETWEEN 200.00 AND 400.00 AND Commission > 0.00;

-- 13. Retrieve Records by MerchantName Starting with a Specific Letter and Status
SELECT * FROM Payin WHERE MerchantName LIKE 'A%' AND Status = 'Pending';

-- 14. Retrieve Records Grouped by MerchantEmail and Count
SELECT MerchantEmail, COUNT(*) AS Count FROM Payin GROUP BY MerchantEmail;

-- 15. Retrieve Records with a Specific VPA and Status
SELECT * FROM Payin WHERE VPA = 'peblitz.avisuraiumtech@timecosmos' AND Status = 'Completed';

-- 16. Retrieve Records by Commission, Sorted by Amount
SELECT * FROM Payin WHERE Commission > 0.00 ORDER BY Amount DESC;

-- 17. Retrieve Records with DateTime Between Two Specific Dates, Sorted by Amount
SELECT * FROM Payin WHERE DateTime BETWEEN '2024-07-01' AND '2024-07-31' ORDER BY Amount DESC;

-- 18. Retrieve Records with a Specific Gateway and DateTime in the Last Year
SELECT * FROM Payin WHERE Gateway = 'timepay' AND DateTime > NOW() - INTERVAL 1 YEAR;

-- 19. Retrieve Records with DateTime in the Last 180 Days
SELECT * FROM Payin WHERE DateTime > NOW() - INTERVAL 180 DAY;

-- 20. Retrieve Records Grouped by MerchantID and Sum of Amount
SELECT MerchantID, SUM(Amount) AS TotalAmount FROM Payin GROUP BY MerchantID;

-- 21. Retrieve Records by MerchantName and Order by DateTime
SELECT * FROM Payin WHERE MerchantName = 'Avisuraium Technology Private Limited' ORDER BY DateTime DESC;

-- 22. Retrieve Records by Specific Amount and Sort by DateTime
SELECT * FROM Payin WHERE Amount = 390.00 ORDER BY DateTime DESC;

-- 23. Retrieve Records with Commission Equal to Maximum Commission
SELECT * FROM Payin WHERE Commission = (SELECT MAX(Commission) FROM Payin);

-- 24. Retrieve Records with DateTime in the Last 365 Days
SELECT * FROM Payin WHERE DateTime > NOW() - INTERVAL 365 DAY;


-- 26. Retrieve Records Grouped by Gateway and Average Amount
SELECT Gateway, AVG(Amount) AS AverageAmount FROM Payin GROUP BY Gateway;

-- 27. Retrieve Records with DateTime in the Last 12 Months
SELECT * FROM Payin WHERE DateTime > NOW() - INTERVAL 12 MONTH;

-- 28. Retrieve Records with a Specific BankUTR and Sort by Amount
SELECT * FROM Payin WHERE BankUTR = 'Y1005K2024070910380055830450' ORDER BY Amount DESC;

-- 29. Retrieve Records with Status and Count by MerchantName
SELECT MerchantName, Status, COUNT(*) AS Count FROM Payin GROUP BY MerchantName, Status;

-- 30. Retrieve Records by MerchantEmail and DateTime in the Last 3 Months
SELECT * FROM Payin WHERE MerchantEmail = 'avisu922@gmail.com' AND DateTime > NOW() - INTERVAL 3 MONTH;

-- 32. Retrieve Records with Commission and Amount Greater than Specific Values
SELECT * FROM Payin WHERE Commission > 0.00 AND Amount > 300.00;

-- 33. Retrieve Records Grouped by Year and Month
SELECT YEAR(DateTime) AS Year, MONTH(DateTime) AS Month, COUNT(*) AS Count FROM Payin GROUP BY YEAR(DateTime), MONTH(DateTime);

-- 34. Retrieve Records with a Specific MerchantID and Sort by Commission
SELECT * FROM Payin WHERE MerchantID = 'Avisuraium_5j3xatgbj' ORDER BY Commission DESC;

-- 35. Retrieve Records with Specific UPI and Commission Greater than 0
SELECT * FROM Payin WHERE UPI = 'peblitz.avisuraiumtech@timecosmos' AND Commission > 0.00;

-- 36. Retrieve Records with Amount and Commission Sorted by DateTime
SELECT * FROM Payin WHERE Amount > 200.00 AND Commission < 50.00 ORDER BY DateTime DESC;

-- 37. Retrieve Records by MerchantName and DateTime in the Last 60 Days
SELECT * FROM Payin WHERE MerchantName = 'Avisuraium Technology Private Limited' AND DateTime > NOW() - INTERVAL 60 DAY;


-- 39. Retrieve Records by Exact Match of ExtTransactionID
SELECT * FROM Payin WHERE ExtTransactionID = 'PEBLITZ1720501680PB1T882950';

-- 40. Retrieve Records Grouped by MerchantName and Status
SELECT MerchantName, Status, COUNT(*) AS Count FROM Payin GROUP BY MerchantName, Status;

-- 41. Retrieve Records by MerchantName and DateTime in the Last 90 Days
SELECT * FROM Payin WHERE MerchantName = 'Avisuraium Technology Private Limited' AND DateTime > NOW() - INTERVAL 90 DAY;

-- 42. Retrieve Records with Status Count by DateTime Month
SELECT MONTH(DateTime) AS Month, Status, COUNT(*) AS Count FROM Payin GROUP BY MONTH(DateTime), Status;

-- 43. Retrieve Records Grouped by MerchantID and Average Commission
SELECT MerchantID, AVG(Commission) AS AverageCommission FROM Payin GROUP BY MerchantID;

-- 44. Retrieve Records with a Specific VPA and Commission
SELECT * FROM Payin WHERE VPA = 'peblitz.avisuraiumtech@timecosmos' AND Commission > 0.00;

-- 46. Retrieve Records with DateTime in the Last 3 Months and Specific Status
SELECT * FROM Payin WHERE DateTime > NOW() - INTERVAL 3 MONTH AND Status = 'Completed';

-- 47. Retrieve Records by MerchantName Containing Specific Keywords
SELECT * FROM Payin WHERE MerchantName LIKE '%Technology%';

-- 49. Retrieve Records with a Specific Amount and DateTime in the Last 6 Months
SELECT * FROM Payin WHERE Amount = 390.00 AND DateTime > NOW() - INTERVAL 6 MONTH;

-- 50. Retrieve Records with DateTime and MerchantEmail Sorted by Amount
SELECT * FROM Payin WHERE DateTime > NOW() - INTERVAL 1 YEAR ORDER BY MerchantEmail, Amount DESC;
