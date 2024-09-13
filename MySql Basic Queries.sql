--- Basic Queries---



-- 1. Retrieve All Records
SELECT * FROM Payin;

-- 2. Retrieve Specific Columns
SELECT ID, DateTime, MerchantEmail FROM Payin;

-- 3. Retrieve Records with Specific Status (e.g., 'Success')
SELECT * FROM Payin WHERE Status = 'Success';

-- 4. Retrieve Records within a Date Range
SELECT * FROM Payin WHERE DateTime BETWEEN '2024-01-01' AND '2024-01-31';

-- 5. Retrieve Records with a Specific Amount
SELECT * FROM Payin WHERE Amount = 390.00;

-- 6. Retrieve Records by MerchantID
SELECT * FROM Payin WHERE MerchantID = 'Avisuraium_5j3xatgbj';

-- 7. Count Total Records
SELECT COUNT(*) FROM Payin;

-- 8. Count Records by Status
SELECT Status, COUNT(*) FROM Payin GROUP BY Status;

-- 9. Retrieve Records with Specific UPI (if applicable)
SELECT * FROM Payin WHERE UPI = 'peblitz.avisuraiumtech@timecosmos';

-- 10. Retrieve Distinct Merchant Names
SELECT DISTINCT MerchantName FROM Payin;

-- 11. Retrieve Records with Amount Greater than a Value
SELECT * FROM Payin WHERE Amount > 100.00;

-- 12. Retrieve Records with Amount Less than a Value
SELECT * FROM Payin WHERE Amount < 500.00;

-- 13. Retrieve Records Sorted by DateTime
SELECT * FROM Payin ORDER BY DateTime DESC;

-- 14. Retrieve Records Sorted by Amount
SELECT * FROM Payin ORDER BY Amount DESC;

-- 15. Retrieve Records for a Specific MerchantEmail
SELECT * FROM Payin WHERE MerchantEmail = 'avisu922@gmail.com';

-- 16. Retrieve Records by BankUTR
SELECT * FROM Payin WHERE BankUTR = 'Y1005K2024070910380055830450';

-- 17. Retrieve Records by MOrderID
SELECT * FROM Payin WHERE MOrderID = 'Y1005K2024070910380055830450';

-- 18. Retrieve Records by VPA (if applicable)
SELECT * FROM Payin WHERE VPA = 'peblitz.avisuraiumtech@timecosmos';

-- 19. Retrieve Records with Commission Above a Certain Value
SELECT * FROM Payin WHERE Commission > 0.00;

-- 20. Retrieve Records with a Specific ExtTransactionID
SELECT * FROM Payin WHERE ExtTransactionID = 'PEBLITZ1720501680PB1T882950';

-- 21. Retrieve Records for Specific Gateway
SELECT * FROM Payin WHERE Gateway = 'timepay';

-- 22. Retrieve Records with Non-null SID (if applicable)
SELECT * FROM Payin WHERE SID IS NOT NULL;

-- 23. Retrieve Records with Null UPI (if applicable)
SELECT * FROM Payin WHERE UPI IS NULL;

-- 24. Retrieve Records by DateTime in a Specific Month (e.g., July 2024)
SELECT * FROM Payin WHERE MONTH(DateTime) = 7 AND YEAR(DateTime) = 2024;

-- 25. Retrieve Records for a Specific Date
SELECT * FROM Payin WHERE DATE(DateTime) = '2024-07-09';

-- 26. Retrieve Records with Amount Between Two Values
SELECT * FROM Payin WHERE Amount BETWEEN 300.00 AND 400.00;

-- 27. Retrieve Records with Commission Between Two Values
SELECT * FROM Payin WHERE Commission BETWEEN 0.00 AND 10.00;

-- 28. Retrieve Records Sorted by MerchantEmail
SELECT * FROM Payin ORDER BY MerchantEmail ASC;

-- 29. Retrieve Records with a Specific Commission Value
SELECT * FROM Payin WHERE Commission = 0.00;

-- 30. Retrieve Records with DateTime in the Last 30 Days
SELECT * FROM Payin WHERE DateTime > NOW() - INTERVAL 30 DAY;

-- 31. Retrieve Records by MerchantName Starting with a Letter
SELECT * FROM Payin WHERE MerchantName LIKE 'Avisu%';

-- 32. Retrieve Records with DateTime in the Last 7 Days
SELECT * FROM Payin WHERE DateTime > NOW() - INTERVAL 7 DAY;

-- 33. Retrieve Records with Amount Rounded to Nearest 10
SELECT * FROM Payin WHERE ROUND(Amount, -1) = 390.00;

-- 34. Retrieve Records with DateTime in the Last Year
SELECT * FROM Payin WHERE DateTime > NOW() - INTERVAL 1 YEAR;

-- 35. Retrieve Records by Partial MerchantEmail Match
SELECT * FROM Payin WHERE MerchantEmail LIKE '%@gmail.com';

-- 36. Retrieve Records with DateTime in the Current Year
SELECT * FROM Payin WHERE YEAR(DateTime) = YEAR(NOW());

-- 37. Retrieve Records with a Specific Amount or Commission
SELECT * FROM Payin WHERE Amount = 390.00 OR Commission = 0.00;

-- 38. Retrieve Records with MerchantName Containing 'Technology'
SELECT * FROM Payin WHERE MerchantName LIKE '%Technology%';

-- 39. Retrieve Records for a Specific MerchantID and Status
SELECT * FROM Payin WHERE MerchantID = 'Avisuraium_5j3xatgbj' AND Status = 'Completed';

-- 40. Retrieve Records with Commission Greater than Average
SELECT * FROM Payin WHERE Commission > (SELECT AVG(Commission) FROM Payin);

-- 41. Retrieve Records with DateTime on a Specific Day of the Week (e.g., Monday)
SELECT * FROM Payin WHERE DAYOFWEEK(DateTime) = 2; -- 2 = Monday

-- 42. Retrieve Records with a Range of Amount and Commission
SELECT * FROM Payin WHERE Amount BETWEEN 300.00 AND 400.00 AND Commission BETWEEN 0.00 AND 10.00;

-- 43. Retrieve Records Sorted by DateTime and Amount
SELECT * FROM Payin ORDER BY DateTime DESC, Amount ASC;

-- 44. Retrieve Records for Specific Date and Status
SELECT * FROM Payin WHERE DATE(DateTime) = '2024-07-09' AND Status = 'Completed';

-- 45. Retrieve Records by Exact Match of MerchantName
SELECT * FROM Payin WHERE MerchantName = 'Avisuraium Technology Private Limited';

-- 46. Retrieve Records with DateTime in the Last Month
SELECT * FROM Payin WHERE DateTime > NOW() - INTERVAL 1 MONTH;

-- 47. Retrieve Records by Partial Match of UPI (if applicable)
SELECT * FROM Payin WHERE UPI LIKE '%@timecosmos%';

-- 48. Retrieve Records with Commission Less than Average
SELECT * FROM Payin WHERE Commission < (SELECT AVG(Commission) FROM Payin);

-- 49. Retrieve Records by Exact Match of BankUTR
SELECT * FROM Payin WHERE BankUTR = 'Y1005K2024070910380055830450';

-- 50. Retrieve Records with DateTime in the Last 90 Days
SELECT * FROM Payin WHERE DateTime > NOW() - INTERVAL 90 DAY;

