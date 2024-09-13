-- ==========================================
-- 1. Date-wise Insights
-- ==========================================
-- 1. Total amount per merchant by date
SELECT Merchantname, DATE(Datetime) AS TransactionDate, SUM(Amount) AS TotalAmount
FROM payin WHERE Status = 'Success' GROUP BY Merchantname, TransactionDate ORDER BY Merchantname, TransactionDate;

-- 2. Total number of transactions per merchant by date
SELECT Merchantname, DATE(Datetime) AS TransactionDate, COUNT(*) AS TransactionCount
FROM payin WHERE Status = 'Success' GROUP BY Merchantname, TransactionDate ORDER BY Merchantname, TransactionDate;

-- 3. Total amount for each day across all merchants
SELECT DATE(Datetime) AS TransactionDate, SUM(Amount) AS TotalAmount
FROM payin WHERE Status = 'Success' GROUP BY TransactionDate ORDER BY TransactionDate;

-- 4. Total transactions for each day across all merchants
SELECT DATE(Datetime) AS TransactionDate, COUNT(*) AS TransactionCount
FROM payin WHERE Status = 'Success' GROUP BY TransactionDate ORDER BY TransactionDate;

-- 5. Total amount per merchant on the last 7 days
SELECT Merchantname, DATE(Datetime) AS TransactionDate, SUM(Amount) AS TotalAmount
FROM payin WHERE Status = 'Success' AND Datetime >= CURDATE() - INTERVAL 7 DAY
GROUP BY Merchantname, TransactionDate ORDER BY Merchantname, TransactionDate;

-- 6. Average transaction amount per merchant by date
SELECT Merchantname, DATE(Datetime) AS TransactionDate, AVG(Amount) AS AvgAmount
FROM payin WHERE Status = 'Success' GROUP BY Merchantname, TransactionDate ORDER BY Merchantname, TransactionDate;

-- 7. Largest transaction per merchant by date
SELECT Merchantname, DATE(Datetime) AS TransactionDate, MAX(Amount) AS LargestTransaction
FROM payin WHERE Status = 'Success' GROUP BY Merchantname, TransactionDate ORDER BY Merchantname, TransactionDate;

-- ==========================================
-- 2. Month-wise Insights
-- ==========================================
-- 8. Total amount per merchant by month
SELECT Merchantname, DATE_FORMAT(Datetime, '%Y-%m') AS TransactionMonth, SUM(Amount) AS TotalAmount
FROM payin WHERE Status = 'Success' GROUP BY Merchantname, TransactionMonth ORDER BY Merchantname, TransactionMonth;

-- 9. Total transactions per merchant by month
SELECT Merchantname, DATE_FORMAT(Datetime, '%Y-%m') AS TransactionMonth, COUNT(*) AS TransactionCount
FROM payin WHERE Status = 'Success' GROUP BY Merchantname, TransactionMonth ORDER BY Merchantname, TransactionMonth;

-- 10. Total amount for each month across all merchants
SELECT DATE_FORMAT(Datetime, '%Y-%m') AS TransactionMonth, SUM(Amount) AS TotalAmount
FROM payin WHERE Status = 'Success' GROUP BY TransactionMonth ORDER BY TransactionMonth;

-- 11. Total transactions for each month across all merchants
SELECT DATE_FORMAT(Datetime, '%Y-%m') AS TransactionMonth, COUNT(*) AS TransactionCount
FROM payin WHERE Status = 'Success' GROUP BY TransactionMonth ORDER BY TransactionMonth;

-- 12. Top 5 merchants by amount in the last month
SELECT Merchantname, SUM(Amount) AS TotalAmount
FROM payin WHERE Status = 'Success' AND Datetime >= CURDATE() - INTERVAL 1 MONTH
GROUP BY Merchantname ORDER BY TotalAmount DESC LIMIT 5;

-- 13. Average transaction amount per merchant by month
SELECT Merchantname, DATE_FORMAT(Datetime, '%Y-%m') AS TransactionMonth, AVG(Amount) AS AvgAmount
FROM payin WHERE Status = 'Success' GROUP BY Merchantname, TransactionMonth ORDER BY Merchantname, TransactionMonth;

-- 14. Largest transaction per merchant by month
SELECT Merchantname, DATE_FORMAT(Datetime, '%Y-%m') AS TransactionMonth, MAX(Amount) AS LargestTransaction
FROM payin WHERE Status = 'Success' GROUP BY Merchantname, TransactionMonth ORDER BY Merchantname, TransactionMonth;

-- ==========================================
-- 3. Year-wise Insights
-- ==========================================
-- 15. Total amount per merchant by year
SELECT Merchantname, DATE_FORMAT(Datetime, '%Y') AS TransactionYear, SUM(Amount) AS TotalAmount
FROM payin WHERE Status = 'Success' GROUP BY Merchantname, TransactionYear ORDER BY Merchantname, TransactionYear;

-- 16. Total transactions per merchant by year
SELECT Merchantname, DATE_FORMAT(Datetime, '%Y') AS TransactionYear, COUNT(*) AS TransactionCount
FROM payin WHERE Status = 'Success' GROUP BY Merchantname, TransactionYear ORDER BY Merchantname, TransactionYear;

-- 17. Total amount for each year across all merchants
SELECT DATE_FORMAT(Datetime, '%Y') AS TransactionYear, SUM(Amount) AS TotalAmount
FROM payin WHERE Status = 'Success' GROUP BY TransactionYear ORDER BY TransactionYear;

-- 18. Total transactions for each year across all merchants
SELECT DATE_FORMAT(Datetime, '%Y') AS TransactionYear, COUNT(*) AS TransactionCount
FROM payin WHERE Status = 'Success' GROUP BY TransactionYear ORDER BY TransactionYear;

-- 19. Top 5 merchants by amount in the last year
SELECT Merchantname, SUM(Amount) AS TotalAmount
FROM payin WHERE Status = 'Success' AND Datetime >= CURDATE() - INTERVAL 1 YEAR
GROUP BY Merchantname ORDER BY TotalAmount DESC LIMIT 5;

-- 20. Average transaction amount per merchant by year
SELECT Merchantname, DATE_FORMAT(Datetime, '%Y') AS TransactionYear, AVG(Amount) AS AvgAmount
FROM payin WHERE Status = 'Success' GROUP BY Merchantname, TransactionYear ORDER BY Merchantname, TransactionYear;

-- 21. Largest transaction per merchant by year
SELECT Merchantname, DATE_FORMAT(Datetime, '%Y') AS TransactionYear, MAX(Amount) AS LargestTransaction
FROM payin WHERE Status = 'Success' GROUP BY Merchantname, TransactionYear ORDER BY Merchantname, TransactionYear;

-- ==========================================
-- 4. Week-wise Insights
-- ==========================================
-- 22. Total amount per merchant by week
SELECT Merchantname, CONCAT(YEAR(Datetime), '-W', WEEK(Datetime)) AS TransactionWeek, SUM(Amount) AS TotalAmount
FROM payin WHERE Status = 'Success' GROUP BY Merchantname, TransactionWeek ORDER BY Merchantname, TransactionWeek;

-- 23. Total transactions per merchant by week
SELECT Merchantname, CONCAT(YEAR(Datetime), '-W', WEEK(Datetime)) AS TransactionWeek, COUNT(*) AS TransactionCount
FROM payin WHERE Status = 'Success' GROUP BY Merchantname, TransactionWeek ORDER BY Merchantname, TransactionWeek;

-- 24. Total amount for each week across all merchants
SELECT CONCAT(YEAR(Datetime), '-W', WEEK(Datetime)) AS TransactionWeek, SUM(Amount) AS TotalAmount
FROM payin WHERE Status = 'Success' GROUP BY TransactionWeek ORDER BY TransactionWeek;

-- 25. Total transactions for each week across all merchants
SELECT CONCAT(YEAR(Datetime), '-W', WEEK(Datetime)) AS TransactionWeek, COUNT(*) AS TransactionCount
FROM payin WHERE Status = 'Success' GROUP BY TransactionWeek ORDER BY TransactionWeek;

-- 26. Average transaction amount per merchant by week
SELECT Merchantname, CONCAT(YEAR(Datetime), '-W', WEEK(Datetime)) AS TransactionWeek, AVG(Amount) AS AvgAmount
FROM payin WHERE Status = 'Success' GROUP BY Merchantname, TransactionWeek ORDER BY Merchantname, TransactionWeek;

-- ==========================================
-- 5. Top Merchant Insights
-- ==========================================
-- 27. Top 10 merchants by total amount
SELECT Merchantname, SUM(Amount) AS TotalAmount
FROM payin WHERE Status = 'Success'
GROUP BY Merchantname ORDER BY TotalAmount DESC LIMIT 10;

-- 28. Top 10 merchants by number of transactions
SELECT Merchantname, COUNT(*) AS TransactionCount
FROM payin WHERE Status = 'Success'
GROUP BY Merchantname ORDER BY TransactionCount DESC LIMIT 10;

-- 29. Top merchant by amount on a specific date
SELECT Merchantname, SUM(Amount) AS TotalAmount
FROM payin WHERE Status = 'Success' AND DATE(Datetime) = '2024-09-01'
GROUP BY Merchantname ORDER BY TotalAmount DESC LIMIT 1;

-- 30. Top merchant by amount in a specific month
SELECT Merchantname, SUM(Amount) AS TotalAmount
FROM payin WHERE Status = 'Success' AND DATE_FORMAT(Datetime, '%Y-%m') = '2024-08'
GROUP BY Merchantname ORDER BY TotalAmount DESC LIMIT 1;

-- 31. Top merchant by amount in a specific year
SELECT Merchantname, SUM(Amount) AS TotalAmount
FROM payin WHERE Status = 'Success' AND DATE_FORMAT(Datetime, '%Y') = '2024'
GROUP BY Merchantname ORDER BY TotalAmount DESC LIMIT 1;

-- ==========================================
-- 6. Specific Date Range Insights
-- ==========================================
-- 32. Total amount per merchant in a specific date range
SELECT Merchantname, SUM(Amount) AS TotalAmount
FROM payin WHERE Status = 'Success' AND Datetime BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY Merchantname ORDER BY TotalAmount DESC;

-- ==========================================
-- 6. Specific Date Range Insights (continued)
-- ==========================================
-- 33. Total transactions per merchant in a specific date range
SELECT Merchantname, COUNT(*) AS TransactionCount
FROM payin WHERE Status = 'Success' AND Datetime BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY Merchantname ORDER BY TransactionCount DESC;

-- 34. Total amount per merchant for the current quarter
SELECT Merchantname, SUM(Amount) AS TotalAmount
FROM payin WHERE Status = 'Success' AND QUARTER(Datetime) = QUARTER(CURDATE()) AND YEAR(Datetime) = YEAR(CURDATE())
GROUP BY Merchantname ORDER BY TotalAmount DESC;

-- 35. Total transactions per merchant for the current quarter
SELECT Merchantname, COUNT(*) AS TransactionCount
FROM payin WHERE Status = 'Success' AND QUARTER(Datetime) = QUARTER(CURDATE()) AND YEAR(Datetime) = YEAR(CURDATE())
GROUP BY Merchantname ORDER BY TransactionCount DESC;

-- 36. Total amount for a specific week of a specific year
SELECT CONCAT(YEAR(Datetime), '-W', WEEK(Datetime)) AS TransactionWeek, SUM(Amount) AS TotalAmount
FROM payin WHERE Status = 'Success' AND YEAR(Datetime) = 2024 AND WEEK(Datetime) = 36
GROUP BY TransactionWeek ORDER BY TotalAmount DESC;

-- 37. Total transactions for a specific week of a specific year
SELECT CONCAT(YEAR(Datetime), '-W', WEEK(Datetime)) AS TransactionWeek, COUNT(*) AS TransactionCount
FROM payin WHERE Status = 'Success' AND YEAR(Datetime) = 2024 AND WEEK(Datetime) = 36
GROUP BY TransactionWeek ORDER BY TransactionCount DESC;

-- ==========================================
-- 7. Merchant Performance Insights
-- ==========================================
-- 38. Total amount for each merchant sorted by performance
SELECT Merchantname, SUM(Amount) AS TotalAmount
FROM payin WHERE Status = 'Success'
GROUP BY Merchantname ORDER BY TotalAmount DESC;

-- 39. Number of successful transactions per merchant
SELECT Merchantname, COUNT(*) AS SuccessfulTransactionCount
FROM payin WHERE Status = 'Success'
GROUP BY Merchantname ORDER BY SuccessfulTransactionCount DESC;

-- 40. Average transaction amount per merchant
SELECT Merchantname, AVG(Amount) AS AvgAmount
FROM payin WHERE Status = 'Success'
GROUP BY Merchantname ORDER BY AvgAmount DESC;

-- 41. Merchant with the highest single transaction amount
SELECT Merchantname, MAX(Amount) AS HighestTransaction
FROM payin WHERE Status = 'Success'
GROUP BY Merchantname ORDER BY HighestTransaction DESC LIMIT 1;

-- 42. Merchant with the lowest single transaction amount
SELECT Merchantname, MIN(Amount) AS LowestTransaction
FROM payin WHERE Status = 'Success'
GROUP BY Merchantname ORDER BY LowestTransaction ASC LIMIT 1;

-- ==========================================
-- 8. Transaction Trends Insights
-- ==========================================
-- 43. Trend of total amounts over the last 12 months
SELECT DATE_FORMAT(Datetime, '%Y-%m') AS TransactionMonth, SUM(Amount) AS TotalAmount
FROM payin WHERE Status = 'Success' AND Datetime >= CURDATE() - INTERVAL 1 YEAR
GROUP BY TransactionMonth ORDER BY TransactionMonth;

-- 44. Monthly average transaction amount over the last 12 months
SELECT DATE_FORMAT(Datetime, '%Y-%m') AS TransactionMonth, AVG(Amount) AS AvgAmount
FROM payin WHERE Status = 'Success' AND Datetime >= CURDATE() - INTERVAL 1 YEAR
GROUP BY TransactionMonth ORDER BY TransactionMonth;

-- 45. Monthly transaction count trend over the last 12 months
SELECT DATE_FORMAT(Datetime, '%Y-%m') AS TransactionMonth, COUNT(*) AS TransactionCount
FROM payin WHERE Status = 'Success' AND Datetime >= CURDATE() - INTERVAL 1 YEAR
GROUP BY TransactionMonth ORDER BY TransactionMonth;

-- 46. Total amount by day of the week
SELECT DAYNAME(Datetime) AS DayOfWeek, SUM(Amount) AS TotalAmount
FROM payin WHERE Status = 'Success'
GROUP BY DayOfWeek ORDER BY FIELD(DayOfWeek, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday');

-- 47. Total transactions by day of the week
SELECT DAYNAME(Datetime) AS DayOfWeek, COUNT(*) AS TransactionCount
FROM payin WHERE Status = 'Success'
GROUP BY DayOfWeek ORDER BY FIELD(DayOfWeek, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday');

-- 48. Monthly trend of transaction counts for a specific merchant
SELECT DATE_FORMAT(Datetime, '%Y-%m') AS TransactionMonth, COUNT(*) AS TransactionCount
FROM payin WHERE Status = 'Success' AND Merchantname = 'MerchantName'
GROUP BY TransactionMonth ORDER BY TransactionMonth;

-- 49. Monthly trend of transaction amounts for a specific merchant
SELECT DATE_FORMAT(Datetime, '%Y-%m') AS TransactionMonth, SUM(Amount) AS TotalAmount
FROM payin WHERE Status = 'Success' AND Merchantname = 'MerchantName'
GROUP BY TransactionMonth ORDER BY TransactionMonth;

-- 50. Monthly average transaction amount for a specific merchant
SELECT DATE_FORMAT(Datetime, '%Y-%m') AS TransactionMonth, AVG(Amount) AS AvgAmount
FROM payin WHERE Status = 'Success' AND Merchantname = 'MerchantName'
GROUP BY TransactionMonth ORDER BY TransactionMonth;

-- ==========================================
-- 9. Merchant Comparison Insights
-- ==========================================
-- 51. Compare total amounts between two specific merchants
SELECT Merchantname, SUM(Amount) AS TotalAmount
FROM payin WHERE Status = 'Success' AND Merchantname IN ('Merchant1', 'Merchant2')
GROUP BY Merchantname ORDER BY TotalAmount DESC;

-- 52. Compare transaction counts between two specific merchants
SELECT Merchantname, COUNT(*) AS TransactionCount
FROM payin WHERE Status = 'Success' AND Merchantname IN ('Merchant1', 'Merchant2')
GROUP BY Merchantname ORDER BY TransactionCount DESC;

-- 53. Monthly comparison of amounts between two specific merchants
SELECT DATE_FORMAT(Datetime, '%Y-%m') AS TransactionMonth, Merchantname, SUM(Amount) AS TotalAmount
FROM payin WHERE Status = 'Success' AND Merchantname IN ('Merchant1', 'Merchant2')
GROUP BY TransactionMonth, Merchantname ORDER BY TransactionMonth, Merchantname;

-- 54. Compare average transaction amounts between two specific merchants
SELECT Merchantname, AVG(Amount) AS AvgAmount
FROM payin WHERE Status = 'Success' AND Merchantname IN ('Merchant1', 'Merchant2')
GROUP BY Merchantname ORDER BY AvgAmount DESC;

-- 55. Compare the highest transaction amounts between two specific merchants
SELECT Merchantname, MAX(Amount) AS HighestTransaction
FROM payin WHERE Status = 'Success' AND Merchantname IN ('Merchant1', 'Merchant2')
GROUP BY Merchantname ORDER BY HighestTransaction DESC;

-- ==========================================
-- 10. Yearly Performance Analysis
-- ==========================================
-- 56. Total amount per merchant for each year of operation
SELECT Merchantname, DATE_FORMAT(Datetime, '%Y') AS TransactionYear, SUM(Amount) AS TotalAmount
FROM payin WHERE Status = 'Success' GROUP BY Merchantname, TransactionYear ORDER BY Merchantname, TransactionYear;

-- 57. Annual growth rate for each merchant
SELECT Merchantname, DATE_FORMAT(Datetime, '%Y') AS TransactionYear, 
       (SUM(Amount) - LAG(SUM(Amount)) OVER (PARTITION BY Merchantname ORDER BY DATE_FORMAT(Datetime, '%Y'))) / 
       LAG(SUM(Amount)) OVER (PARTITION BY Merchantname ORDER BY DATE_FORMAT(Datetime, '%Y')) * 100 AS GrowthRate
FROM payin WHERE Status = 'Success'
GROUP BY Merchantname, TransactionYear
ORDER BY Merchantname, TransactionYear;

-- 58. Yearly total amount for the top 5 merchants by total amount
SELECT Merchantname, DATE_FORMAT(Datetime, '%Y') AS TransactionYear, SUM(Amount) AS TotalAmount
FROM payin WHERE Status = 'Success'
GROUP BY Merchantname, TransactionYear
HAVING Merchantname IN (SELECT Merchantname FROM (SELECT Merchantname FROM payin WHERE Status = 'Success' GROUP BY Merchantname ORDER BY SUM(Amount) DESC LIMIT 5) AS TopMerchants)
ORDER BY TransactionYear, TotalAmount DESC;

-- 59. Yearly transaction counts for the top 5 merchants by transaction count
SELECT Merchantname, DATE_FORMAT(Datetime, '%Y') AS TransactionYear, COUNT(*) AS TransactionCount
FROM payin WHERE Status = 'Success'
GROUP BY Merchantname, TransactionYear
HAVING Merchantname IN (SELECT Merchantname FROM (SELECT Merchantname FROM payin WHERE Status = 'Success' GROUP BY Merchantname ORDER BY COUNT(*) DESC LIMIT 5) AS TopMerchants)
ORDER BY TransactionYear, TransactionCount DESC;

-- 60. Yearly average transaction amount for the top 5 merchants
SELECT Merchantname, DATE_FORMAT(Datetime, '%Y') AS TransactionYear, AVG(Amount) AS AvgAmount
FROM payin WHERE Status = 'Success'
GROUP BY Merchantname, TransactionYear
HAVING Merchantname IN (SELECT Merchantname FROM (SELECT Merchantname FROM payin WHERE Status = 'Success' GROUP BY Merchantname ORDER BY AVG(Amount) DESC LIMIT 5) AS TopMerchants)
ORDER BY TransactionYear, AvgAmount DESC;

-- ==========================================
-- 11. Specific Merchant Analysis
-- ==========================================
-- 61. Total amount for a specific merchant over time
SELECT DATE_FORMAT(Datetime, '%Y-%m') AS TransactionMonth, SUM(Amount) AS TotalAmount
FROM payin WHERE Status = 'Success' AND Merchantname = 'MerchantName'
GROUP BY TransactionMonth ORDER BY TransactionMonth;

-- 62. Transaction count over time for a specific merchant
SELECT DATE_FORMAT(Datetime, '%Y-%m') AS TransactionMonth, COUNT(*) AS TransactionCount
FROM payin WHERE Status = 'Success' AND Merchantname = 'MerchantName'
GROUP BY TransactionMonth ORDER BY TransactionMonth;

-- 63. Average transaction amount over time for a specific merchant
SELECT DATE_FORMAT(Datetime, '%Y-%m') AS TransactionMonth, AVG(Amount) AS AvgAmount
FROM payin WHERE Status = 'Success' AND Merchantname = 'MerchantName'
GROUP BY TransactionMonth ORDER BY TransactionMonth;

-- 64. Maximum transaction amount for a specific merchant in a specific year
SELECT YEAR(Datetime) AS TransactionYear, MAX(Amount) AS MaxAmount
FROM payin WHERE Status = 'Success' AND Merchantname = 'MerchantName' AND YEAR(Datetime) = 2024
GROUP BY TransactionYear;

-- 65. Minimum transaction amount for a specific merchant in a specific year
SELECT YEAR(Datetime) AS TransactionYear, MIN(Amount) AS MinAmount
FROM payin WHERE Status = 'Success' AND Merchantname = 'MerchantName' AND YEAR(Datetime) = 2024
GROUP BY TransactionYear;

-- ==========================================
-- 12. Merchant Insights
-- ==========================================
-- 66. Total amount for merchants with at least 10 transactions in the current year
SELECT Merchantname, SUM(Amount) AS TotalAmount
FROM payin WHERE Status = 'Success' AND YEAR(Datetime) = YEAR(CURDATE())
GROUP BY Merchantname
HAVING COUNT(*) >= 10
ORDER BY TotalAmount DESC;

-- 67. Average transaction amount for merchants with less than 5 transactions in the last month
SELECT Merchantname, AVG(Amount) AS AvgAmount
FROM payin WHERE Status = 'Success' AND Datetime >= CURDATE() - INTERVAL 1 MONTH
GROUP BY Merchantname
HAVING COUNT(*) < 5
ORDER BY AvgAmount DESC;

-- 68. Total amount by merchant for the top 10 merchants by total amount
SELECT Merchantname, SUM(Amount) AS TotalAmount
FROM payin WHERE Status = 'Success'
GROUP BY Merchantname
ORDER BY TotalAmount DESC
LIMIT 10;

-- 69. Merchant with the highest average transaction amount in the current quarter
SELECT Merchantname, AVG(Amount) AS AvgAmount
FROM payin WHERE Status = 'Success' AND QUARTER(Datetime) = QUARTER(CURDATE()) AND YEAR(Datetime) = YEAR(CURDATE())
GROUP BY Merchantname
ORDER BY AvgAmount DESC
LIMIT 1;

-- 70. Merchant with the highest number of transactions in the last week
SELECT Merchantname, COUNT(*) AS TransactionCount
FROM payin WHERE Status = 'Success' AND Datetime >= CURDATE() - INTERVAL 1 WEEK
GROUP BY Merchantname
ORDER BY TransactionCount DESC
LIMIT 1;

-- ==========================================
-- 13. Transaction Type Analysis
-- ==========================================
-- 71. Total amount by payment mode (e.g., Credit Card, Debit Card, etc.)
SELECT PaymentMode, SUM(Amount) AS TotalAmount
FROM payin WHERE Status = 'Success'
GROUP BY PaymentMode
ORDER BY TotalAmount DESC;

-- 72. Transaction count by payment mode
SELECT PaymentMode, COUNT(*) AS TransactionCount
FROM payin WHERE Status = 'Success'
GROUP BY PaymentMode
ORDER BY TransactionCount DESC;

-- 73. Average amount by payment mode
SELECT PaymentMode, AVG(Amount) AS AvgAmount
FROM payin WHERE Status = 'Success'
GROUP BY PaymentMode
ORDER BY AvgAmount DESC;

-- 74. Total amount for each transaction type (e.g., Credit, Debit)
SELECT TransactionType, SUM(Amount) AS TotalAmount
FROM payin WHERE Status = 'Success'
GROUP BY TransactionType
ORDER BY TotalAmount DESC;

-- 75. Number of transactions for each transaction type
SELECT TransactionType, COUNT(*) AS TransactionCount
FROM payin WHERE Status = 'Success'
GROUP BY TransactionType
ORDER BY TransactionCount DESC;

-- ==========================================
-- 14. Weekly and Monthly Comparisons
-- ==========================================
-- 76. Compare total transaction amounts between the current and previous months
SELECT
  'Current Month' AS Period,
  SUM(Amount) AS TotalAmount
FROM payin WHERE Status = 'Success' AND MONTH(Datetime) = MONTH(CURDATE()) AND YEAR(Datetime) = YEAR(CURDATE())
UNION ALL
SELECT
  'Previous Month' AS Period,
  SUM(Amount) AS TotalAmount
FROM payin WHERE Status = 'Success' AND MONTH(Datetime) = MONTH(CURDATE()) - 1 AND YEAR(Datetime) = YEAR(CURDATE());

-- 77. Compare transaction counts between the current and previous months
SELECT
  'Current Month' AS Period,
  COUNT(*) AS TransactionCount
FROM payin WHERE Status = 'Success' AND MONTH(Datetime) = MONTH(CURDATE()) AND YEAR(Datetime) = YEAR(CURDATE())
UNION ALL
SELECT
  'Previous Month' AS Period,
  COUNT(*) AS TransactionCount
FROM payin WHERE Status = 'Success' AND MONTH(Datetime) = MONTH(CURDATE()) - 1 AND YEAR(Datetime) = YEAR(CURDATE());

-- 78. Compare weekly transaction amounts for the current and previous weeks
SELECT
  'Current Week' AS Period,
  SUM(Amount) AS TotalAmount
FROM payin WHERE Status = 'Success' AND YEARWEEK(Datetime, 1) = YEARWEEK(CURDATE(), 1)
UNION ALL
SELECT
  'Previous Week' AS Period,
  SUM(Amount) AS TotalAmount
FROM payin WHERE Status = 'Success' AND YEARWEEK(Datetime, 1) = YEARWEEK(CURDATE(), 1) - 1;

-- 79. Compare weekly transaction counts for the current and previous weeks
SELECT
  'Current Week' AS Period,
  COUNT(*) AS TransactionCount
FROM payin WHERE Status = 'Success' AND YEARWEEK(Datetime, 1) = YEARWEEK(CURDATE(), 1)
UNION ALL
SELECT
  'Previous Week' AS Period,
  COUNT(*) AS TransactionCount
FROM payin WHERE Status = 'Success' AND YEARWEEK(Datetime, 1) = YEARWEEK(CURDATE(), 1) - 1;

-- ==========================================
-- 15. Merchant Payment Mode Analysis
-- ==========================================
-- 80. Total amount by merchant and payment mode
SELECT Merchantname, PaymentMode, SUM(Amount) AS TotalAmount
FROM payin WHERE Status = 'Success'
GROUP BY Merchantname, PaymentMode
ORDER BY TotalAmount DESC;

-- 81. Transaction count by merchant and payment mode
SELECT Merchantname, PaymentMode, COUNT(*) AS TransactionCount
FROM payin WHERE Status = 'Success'
GROUP BY Merchantname, PaymentMode
ORDER BY TransactionCount DESC;

-- 82. Average transaction amount by merchant and payment mode
SELECT Merchantname, PaymentMode, AVG(Amount) AS AvgAmount
FROM payin WHERE Status = 'Success'
GROUP BY Merchantname, PaymentMode
ORDER BY AvgAmount DESC;

-- 83. Total amount by merchant and transaction type
SELECT Merchantname, TransactionType, SUM(Amount) AS TotalAmount
FROM payin WHERE Status = 'Success'
GROUP BY Merchantname, TransactionType
ORDER BY TotalAmount DESC;

-- 84. Transaction count by merchant and transaction type
SELECT Merchantname, TransactionType, COUNT(*) AS TransactionCount
FROM payin WHERE Status = 'Success'
GROUP BY Merchantname, TransactionType
ORDER BY TransactionCount DESC;

-- ==========================================
-- 16. Merchant Payment Mode and Transaction Type Trends
-- ==========================================
-- 85. Monthly trend of total amounts by payment mode
SELECT DATE_FORMAT(Datetime, '%Y-%m') AS TransactionMonth, PaymentMode, SUM(Amount) AS TotalAmount
FROM payin WHERE Status = 'Success'
GROUP BY TransactionMonth, PaymentMode
ORDER BY TransactionMonth, PaymentMode;

-- 86. Monthly trend of transaction counts by payment mode
SELECT DATE_FORMAT(Datetime, '%Y-%m') AS TransactionMonth, PaymentMode, COUNT(*) AS TransactionCount
FROM payin WHERE Status = 'Success'
GROUP BY TransactionMonth, PaymentMode
ORDER BY TransactionMonth, PaymentMode;

-- 87. Monthly trend of average transaction amounts by payment mode
SELECT DATE_FORMAT(Datetime, '%Y-%m') AS TransactionMonth, PaymentMode, AVG(Amount) AS AvgAmount
FROM payin WHERE Status = 'Success'
GROUP BY TransactionMonth, PaymentMode
ORDER BY TransactionMonth, PaymentMode;

-- 88. Monthly trend of total amounts by transaction type
SELECT DATE_FORMAT(Datetime, '%Y-%m') AS TransactionMonth, TransactionType, SUM(Amount) AS TotalAmount
FROM payin WHERE Status = 'Success'
GROUP BY TransactionMonth, TransactionType
ORDER BY TransactionMonth, TransactionType;

-- 89. Monthly trend of transaction counts by transaction type
SELECT DATE_FORMAT(Datetime, '%Y-%m') AS TransactionMonth, TransactionType, COUNT(*) AS TransactionCount
FROM payin WHERE Status = 'Success'
GROUP BY TransactionMonth, TransactionType
ORDER BY TransactionMonth, TransactionType;

-- ==========================================
-- 17. Merchant Transaction Trends
-- ==========================================
-- 90. Monthly total amounts for a specific merchant by payment mode
SELECT DATE_FORMAT(Datetime, '%Y-%m') AS TransactionMonth, PaymentMode, SUM(Amount) AS TotalAmount
FROM payin WHERE Status = 'Success' AND Merchantname = 'MerchantName'
GROUP BY TransactionMonth, PaymentMode
ORDER BY TransactionMonth, PaymentMode;

-- 91. Monthly transaction counts for a specific merchant by payment mode
SELECT DATE_FORMAT(Datetime, '%Y-%m') AS TransactionMonth, PaymentMode, COUNT(*) AS TransactionCount
FROM payin WHERE Status = 'Success' AND Merchantname = 'MerchantName'
GROUP BY TransactionMonth, PaymentMode
ORDER BY TransactionMonth, PaymentMode;

-- 92. Monthly average transaction amounts for a specific merchant by payment mode
SELECT DATE_FORMAT(Datetime, '%Y-%m') AS TransactionMonth, PaymentMode, AVG(Amount) AS AvgAmount
FROM payin WHERE Status = 'Success' AND Merchantname = 'MerchantName'
GROUP BY TransactionMonth, PaymentMode
ORDER BY TransactionMonth, PaymentMode;

-- 93. Monthly total amounts for a specific merchant by transaction type
SELECT DATE_FORMAT(Datetime, '%Y-%m') AS TransactionMonth, TransactionType, SUM(Amount) AS TotalAmount
FROM payin WHERE Status = 'Success' AND Merchantname = 'MerchantName'
GROUP BY TransactionMonth, TransactionType
ORDER BY TransactionMonth, TransactionType;

-- ==========================================
-- 17. Merchant Transaction Trends (Continued)
-- ==========================================
-- 94. Monthly transaction counts for a specific merchant by transaction type
SELECT DATE_FORMAT(Datetime, '%Y-%m') AS TransactionMonth, TransactionType, COUNT(*) AS TransactionCount
FROM payin WHERE Status = 'Success' AND Merchantname = 'MerchantName'
GROUP BY TransactionMonth, TransactionType
ORDER BY TransactionMonth, TransactionType;

-- 95. Monthly average transaction amounts for a specific merchant by transaction type
SELECT DATE_FORMAT(Datetime, '%Y-%m') AS TransactionMonth, TransactionType, AVG(Amount) AS AvgAmount
FROM payin WHERE Status = 'Success' AND Merchantname = 'MerchantName'
GROUP BY TransactionMonth, TransactionType
ORDER BY TransactionMonth, TransactionType;

-- 96. Weekly total amounts for a specific merchant by payment mode
SELECT YEARWEEK(Datetime, 1) AS TransactionWeek, PaymentMode, SUM(Amount) AS TotalAmount
FROM payin WHERE Status = 'Success' AND Merchantname = 'MerchantName'
GROUP BY TransactionWeek, PaymentMode
ORDER BY TransactionWeek, PaymentMode;

-- 97. Weekly transaction counts for a specific merchant by payment mode
SELECT YEARWEEK(Datetime, 1) AS TransactionWeek, PaymentMode, COUNT(*) AS TransactionCount
FROM payin WHERE Status = 'Success' AND Merchantname = 'MerchantName'
GROUP BY TransactionWeek, PaymentMode
ORDER BY TransactionWeek, PaymentMode;

-- 98. Weekly average transaction amounts for a specific merchant by payment mode
SELECT YEARWEEK(Datetime, 1) AS TransactionWeek, PaymentMode, AVG(Amount) AS AvgAmount
FROM payin WHERE Status = 'Success' AND Merchantname = 'MerchantName'
GROUP BY TransactionWeek, PaymentMode
ORDER BY TransactionWeek, PaymentMode;

-- 99. Weekly total amounts for a specific merchant by transaction type
SELECT YEARWEEK(Datetime, 1) AS TransactionWeek, TransactionType, SUM(Amount) AS TotalAmount
FROM payin WHERE Status = 'Success' AND Merchantname = 'MerchantName'
GROUP BY TransactionWeek, TransactionType
ORDER BY TransactionWeek, TransactionType;

-- 100. Weekly transaction counts for a specific merchant by transaction type
SELECT YEARWEEK(Datetime, 1) AS TransactionWeek, TransactionType, COUNT(*) AS TransactionCount
FROM payin WHERE Status = 'Success' AND Merchantname = 'MerchantName'
GROUP BY TransactionWeek, TransactionType
ORDER BY TransactionWeek, TransactionType;










-- Basic JOIN Conditions

-- 1. Inner Join on ID
SELECT a.ID, a.DateTime, a.MerchantName, b.Amount
FROM Database1.Table1 a
INNER JOIN Database2.Table2 b ON a.ID = b.ID;

-- 2. Left Join on MerchantID
SELECT a.MerchantID, a.MerchantName, b.Status
FROM Database1.Table1 a
LEFT JOIN Database2.Table2 b ON a.MerchantID = b.MerchantID;

-- 3. Right Join on BankUTR
SELECT a.BankUTR, b.Amount
FROM Database1.Table1 a
RIGHT JOIN Database2.Table2 b ON a.BankUTR = b.BankUTR;

-- 4. Full Join on ExtTransactionID
SELECT a.ExtTransactionID, b.DateTime, a.Amount
FROM Database1.Table1 a
FULL JOIN Database2.Table2 b ON a.ExtTransactionID = b.ExtTransactionID;

-- 5. Self Join on MerchantName
SELECT a.ID, a.MerchantName, b.Amount
FROM Database1.Table1 a
INNER JOIN Database1.Table1 b ON a.MerchantName = b.MerchantName AND a.ID != b.ID;

-- 6. Join on Date with Date Range
SELECT a.DateTime, b.Amount
FROM Database1.Table1 a
INNER JOIN Database2.Table2 b ON a.DateTime BETWEEN b.StartDate AND b.EndDate;

-- 7. Join on Email with Wildcard
SELECT a.MerchantEmail, b.Commission
FROM Database1.Table1 a
INNER JOIN Database2.Table2 b ON a.MerchantEmail LIKE CONCAT('%', b.MerchantEmail, '%');

-- 8. Join on Multiple Columns
SELECT a.ID, a.MerchantID, b.Amount
FROM Database1.Table1 a
INNER JOIN Database2.Table2 b ON a.ID = b.ID AND a.MerchantID = b.MerchantID;

-- 9. Join with Aggregation
SELECT a.MerchantName, SUM(b.Amount) AS TotalAmount
FROM Database1.Table1 a
INNER JOIN Database2.Table2 b ON a.MerchantName = b.MerchantName
GROUP BY a.MerchantName;

-- 10. Join with Condition on Aggregated Data
SELECT a.MerchantName, b.TotalAmount
FROM Database1.Table1 a
INNER JOIN (
  SELECT MerchantName, SUM(Amount) AS TotalAmount
  FROM Database2.Table2
  GROUP BY MerchantName
) b ON a.MerchantName = b.MerchantName
WHERE b.TotalAmount > 1000;

-- Intermediate JOIN Conditions

-- 11. Cross Join Example
SELECT a.ID, b.Amount
FROM Database1.Table1 a
CROSS JOIN Database2.Table2 b;

-- 12. Join with Subquery
SELECT a.ID, b.Amount
FROM Database1.Table1 a
INNER JOIN (
  SELECT ID, Amount
  FROM Database2.Table2
  WHERE Amount > 50
) b ON a.ID = b.ID;

-- 13. Join on Calculated Column
SELECT a.ID, b.Commission
FROM Database1.Table1 a
INNER JOIN Database2.Table2 b ON a.Commission = b.Commission * 2;

-- 14. Join with Multiple Conditions
SELECT a.ID, b.MerchantName, a.Amount
FROM Database1.Table1 a
INNER JOIN Database2.Table2 b ON a.MerchantID = b.MerchantID AND a.DateTime = b.DateTime;

-- 15. Join with Multiple Tables
SELECT a.ID, b.Amount, c.Status
FROM Database1.Table1 a
INNER JOIN Database2.Table2 b ON a.ID = b.ID
INNER JOIN Database2.Table3 c ON b.StatusID = c.StatusID;

-- 16. Left Join with Aggregated Data
SELECT a.MerchantName, COALESCE(SUM(b.Amount), 0) AS TotalAmount
FROM Database1.Table1 a
LEFT JOIN Database2.Table2 b ON a.MerchantName = b.MerchantName
GROUP BY a.MerchantName;

-- 17. Join with Union
SELECT a.ID, b.Amount
FROM Database1.Table1 a
INNER JOIN Database2.Table2 b ON a.ID = b.ID
UNION
SELECT a.ID, c.Amount
FROM Database1.Table1 a
INNER JOIN Database2.Table3 c ON a.ID = c.ID;

-- 18. Join with Date Functions
SELECT a.DateTime, b.Amount
FROM Database1.Table1 a
INNER JOIN Database2.Table2 b ON MONTH(a.DateTime) = MONTH(b.DateTime) AND YEAR(a.DateTime) = YEAR(b.DateTime);

-- 19. Join with Filtering on Join Conditions
SELECT a.ID, b.Amount
FROM Database1.Table1 a
INNER JOIN Database2.Table2 b ON a.ID = b.ID
WHERE a.Amount > 100 AND b.Amount < 200;

-- 20. Join with Conditional Aggregation
SELECT a.MerchantName, COUNT(b.ID) AS TransactionCount
FROM Database1.Table1 a
INNER JOIN Database2.Table2 b ON a.MerchantName = b.MerchantName
GROUP BY a.MerchantName
HAVING COUNT(b.ID) > 5;

-- Advanced JOIN Conditions

-- 21. Self Join with Hierarchical Data
SELECT a.ID AS ParentID, b.ID AS ChildID
FROM Database1.Table1 a
INNER JOIN Database1.Table1 b ON a.ID = b.ParentID;

-- 22. Join with Window Functions
SELECT a.ID, b.Amount, ROW_NUMBER() OVER (PARTITION BY a.MerchantName ORDER BY b.Amount DESC) AS RowNum
FROM Database1.Table1 a
INNER JOIN Database2.Table2 b ON a.ID = b.ID;

-- 23. Join with CTE (Common Table Expression)
WITH CTE AS (
  SELECT ID, Amount
  FROM Database2.Table2
  WHERE Amount > 100
)
SELECT a.ID, b.Amount
FROM Database1.Table1 a
INNER JOIN CTE b ON a.ID = b.ID;

-- 24. Join with Subquery in WHERE Clause
SELECT a.ID, b.Amount
FROM Database1.Table1 a
INNER JOIN Database2.Table2 b ON a.ID = b.ID
WHERE a.ID IN (SELECT ID FROM Database2.Table2 WHERE Amount > 100);

-- 25. Join with Derived Tables
SELECT a.ID, b.TotalAmount
FROM Database1.Table1 a
INNER JOIN (
  SELECT MerchantName, SUM(Amount) AS TotalAmount
  FROM Database2.Table2
  GROUP BY MerchantName
) b ON a.MerchantName = b.MerchantName;

-- 26. Join with Lateral Subquery (if supported)
SELECT a.ID, b.Amount
FROM Database1.Table1 a
CROSS JOIN LATERAL (
  SELECT Amount
  FROM Database2.Table2 b
  WHERE a.ID = b.ID
  ORDER BY Amount DESC
  LIMIT 1
) b;

-- 27. Join with Dynamic Conditions
SELECT a.ID, b.Amount
FROM Database1.Table1 a
INNER JOIN Database2.Table2 b ON a.ID = b.ID
WHERE (a.Amount > b.Amount AND a.Status = 'Active') OR (a.Amount < b.Amount AND b.Status = 'Pending');

-- 28. Join on Multiple Databases
SELECT a.ID, b.Amount
FROM Database1.Table1 a
INNER JOIN Database2.Database2.Table2 b ON a.ID = b.ID;

-- 29. Join with Conditional Aggregation and Grouping
SELECT a.MerchantName, SUM(b.Amount) AS TotalAmount, COUNT(b.ID) AS TransactionCount
FROM Database1.Table1 a
INNER JOIN Database2.Table2 b ON a.MerchantName = b.MerchantName
GROUP BY a.MerchantName
HAVING SUM(b.Amount) > 1000;

-- 30. Join with Mixed JOIN Types
SELECT a.ID, b.Amount, c.Status
FROM Database1.Table1 a
LEFT JOIN Database2.Table2 b ON a.ID = b.ID
RIGHT JOIN Database2.Table3 c ON b.StatusID = c.StatusID;

-- Additional Queries for Better Practice

-- 31. Query with UNION ALL
SELECT ID, Amount FROM Database1.Table1
UNION ALL
SELECT ID, Amount FROM Database2.Table2;

-- 32. Query with INTERSECT (if supported)
SELECT ID, Amount FROM Database1.Table1
INTERSECT
SELECT ID, Amount FROM Database2.Table2;

-- 33. Query with EXCEPT (if supported)
SELECT ID, Amount FROM Database1.Table1
EXCEPT
SELECT ID, Amount FROM Database2.Table2;

-- 34. Query with Advanced Filtering
SELECT a.ID, b.Amount
FROM Database1.Table1 a
INNER JOIN Database2.Table2 b ON a.ID = b.ID
WHERE a.DateTime BETWEEN '2024-01-01' AND '2024-12-31' AND b.Amount > 100;

-- 35. Query with JSON Functions (if supported)
SELECT a.ID, JSON_EXTRACT(b.Data, '$.Amount') AS Amount
FROM Database1.Table1 a
INNER JOIN Database2.Table2 b ON a.ID = b.ID;

-- 36. Query with String Functions
SELECT a.ID, CONCAT(a.MerchantName, ' - ', b.Amount) AS MerchantDetails
FROM Database1.Table1 a
INNER JOIN Database2.Table2 b ON a.ID = b.ID;

-- 37. Query with Date Functions
SELECT a.ID, a.DateTime, DATE_FORMAT(b.DateTime, '%Y-%m') AS TransactionMonth, b.Amount
FROM Database1.Table1 a
INNER JOIN Database2.Table2 b ON a.ID = b.ID;

-- 38. Query with Aggregate Functions
SELECT a.MerchantName, AVG(b.Amount) AS AverageAmount
FROM Database1.Table1 a
INNER JOIN Database2.Table2 b ON a.MerchantName = b.MerchantName
GROUP BY a.MerchantName;

-- 39. Query with Ranking Functions
SELECT a.ID, b.Amount, RANK() OVER (PARTITION BY a.MerchantName ORDER BY b.Amount DESC) AS Rank
FROM Database1.Table1 a
INNER JOIN Database2.Table2 b ON a.ID = b.ID;

-- 40. Query with Subqueries in SELECT Clause
SELECT a.ID, (SELECT MAX(Amount) FROM Database2.Table2 WHERE ID = a.ID) AS MaxAmount
FROM Database1.Table1 a;

-- Advanced Queries for Better Practice

-- 41. Query with Window Function and Partitioning
SELECT a.ID, b.Amount, LAG(b.Amount) OVER (PARTITION BY a.MerchantName ORDER BY b.DateTime) AS PreviousAmount
FROM Database1.Table1 a
INNER JOIN Database2.Table2 b ON a.ID = b.ID;

-- 42. Query with Recursive CTE (if supported)
WITH RECURSIVE CTE AS (
  SELECT ID, Amount, 1 AS Level
  FROM Database1.Table1
  WHERE ParentID IS NULL
  UNION ALL
  SELECT a.ID, a.Amount, c.Level + 1
  FROM Database1.Table1 a
  INNER JOIN CTE c ON a.ParentID = c.ID
)
SELECT * FROM CTE;

-- 43. Query with Pivoting (if supported)
SELECT MerchantName, 
       SUM(CASE WHEN MONTH(DateTime) = 1 THEN Amount ELSE 0 END) AS JanAmount,
       SUM(CASE WHEN MONTH(DateTime) = 2 THEN Amount ELSE 0 END) AS FebAmount
FROM Database1.Table1
GROUP BY MerchantName;

-- 44. Query with Correlated Subquery
SELECT a.ID, a.Amount
FROM Database1.Table1 a
WHERE a.Amount > (
  SELECT AVG(b.Amount)
  FROM Database2.Table2 b
  WHERE a.MerchantName = b.MerchantName
);

-- 45. Query with Conditional Aggregation and Case Statement
SELECT a.MerchantName,
       SUM(CASE WHEN b.Status = 'Success' THEN b.Amount ELSE 0 END) AS SuccessAmount,
       SUM(CASE WHEN b.Status = 'Failed' THEN b.Amount ELSE 0 END) AS FailedAmount
FROM Database1.Table1 a
INNER JOIN Database2.Table2 b ON a.MerchantName = b.MerchantName
GROUP BY a.MerchantName;

-- 46. Query with Index Optimization
CREATE INDEX idx_merchantname ON Database1.Table1 (MerchantName);
SELECT a.ID, b.Amount
FROM Database1.Table1 a
INNER JOIN Database2.Table2 b ON a.MerchantName = b.MerchantName;

-- 47. Query with Hierarchical Data (Adjacency List Model)
SELECT a.ID, b.Amount
FROM Database1.Table1 a
INNER JOIN Database2.Table2 b ON a.ID = b.ID
WHERE a.ParentID IS NULL;

-- 48. Query with Multiple Joins and Aggregations
SELECT a.MerchantName, COUNT(b.ID) AS TransactionCount, SUM(c.Amount) AS TotalAmount
FROM Database1.Table1 a
INNER JOIN Database2.Table2 b ON a.ID = b.ID
INNER JOIN Database2.Table3 c ON b.MerchantID = c.MerchantID
GROUP BY a.MerchantName;

-- 49. Query with Cross Database Joins
SELECT a.ID, b.Amount
FROM Database1.Table1 a
INNER JOIN Database2.Database2.Table2 b ON a.ID = b.ID;

-- 50. Query with Join and Full Text Search (if supported)
SELECT a.ID, b.Amount
FROM Database1.Table1 a
INNER JOIN Database2.Table2 b ON MATCH(a.MerchantName) AGAINST(b.MerchantName IN BOOLEAN MODE);

-- Additional Advanced Queries

-- 51. Query with JSON Data Handling (if supported)
SELECT a.ID, JSON_EXTRACT(b.Data, '$.Amount') AS Amount
FROM Database1.Table1 a
INNER JOIN Database2.Table2 b ON a.ID = b.ID;

-- 52. Query with Dynamic SQL (if supported)
SET @sql = CONCAT('SELECT a.ID, b.Amount FROM Database1.Table1 a INNER JOIN Database2.Table2 b ON a.ID = b.ID WHERE a.DateTime > "', CURDATE(), '"');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- 53. Query with Data Integrity Checks
SELECT a.ID, b.Amount
FROM Database1.Table1 a
INNER JOIN Database2.Table2 b ON a.ID = b.ID
WHERE a.Amount IS NOT NULL AND b.Amount IS NOT NULL;

-- 54. Query with Multiple Aggregations and Filters
SELECT a.MerchantName,
       COUNT(b.ID) AS TransactionCount,
       SUM(b.Amount) AS TotalAmount
FROM Database1.Table1 a
INNER JOIN Database2.Table2 b ON a.MerchantName = b.MerchantName
GROUP BY a.MerchantName
HAVING COUNT(b.ID) > 5;

-- 55. Query with Date Range and Aggregation
SELECT a.DateTime, SUM(b.Amount) AS TotalAmount
FROM Database1.Table1 a
INNER JOIN Database2.Table2 b ON a.DateTime = b.DateTime
WHERE a.DateTime BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY a.DateTime;

-- 56. Query with Advanced Self Join
WITH RecursiveCTE AS (
  SELECT ID, MerchantName, ParentID, 1 AS Level
  FROM Database1.Table1
  WHERE ParentID IS NULL
  UNION ALL
  SELECT a.ID, a.MerchantName, a.ParentID, c.Level + 1
  FROM Database1.Table1 a
  INNER JOIN RecursiveCTE c ON a.ParentID = c.ID
)
SELECT ID, MerchantName, Level
FROM RecursiveCTE;

-- 57. Query with Join on Multiple Conditions and Aggregations
SELECT a.ID, a.MerchantName, b.Amount, COUNT(c.ID) AS RelatedCount
FROM Database1.Table1 a
INNER JOIN Database2.Table2 b ON a.MerchantID = b.MerchantID
LEFT JOIN Database3.Table3 c ON a.ID = c.ReferenceID
GROUP BY a.ID, a.MerchantName, b.Amount;

-- 58. Query with Aggregated Data Using GROUP_CONCAT
SELECT a.MerchantName, GROUP_CONCAT(b.Amount ORDER BY b.DateTime SEPARATOR ', ') AS Amounts
FROM Database1.Table1 a
INNER JOIN Database2.Table2 b ON a.ID = b.ID
GROUP BY a.MerchantName;

-- 59. Query with Conditional Joins and Filters
SELECT a.ID, a.MerchantName, b.Amount, 
       CASE 
         WHEN b.Amount > 100 THEN 'High'
         WHEN b.Amount BETWEEN 50 AND 100 THEN 'Medium'
         ELSE 'Low'
       END AS AmountCategory
FROM Database1.Table1 a
INNER JOIN Database2.Table2 b ON a.ID = b.ID
WHERE b.DateTime > '2024-01-01';

-- 60. Query with Multiple Subqueries
SELECT a.ID, b.Amount
FROM Database1.Table1 a
INNER JOIN Database2.Table2 b ON a.ID = b.ID
WHERE b.Amount > (
  SELECT AVG(Amount) 
  FROM Database2.Table2 
  WHERE MerchantName = a.MerchantName
);

-- 61. Query with Temporal Data
SELECT a.MerchantName, 
       SUM(CASE WHEN a.DateTime BETWEEN '2024-01-01' AND '2024-06-30' THEN b.Amount ELSE 0 END) AS H1_Amount,
       SUM(CASE WHEN a.DateTime BETWEEN '2024-07-01' AND '2024-12-31' THEN b.Amount ELSE 0 END) AS H2_Amount
FROM Database1.Table1 a
INNER JOIN Database2.Table2 b ON a.ID = b.ID
GROUP BY a.MerchantName;

-- 62. Query with Full Outer Join (if supported)
SELECT a.ID, a.MerchantName, b.Amount
FROM Database1.Table1 a
FULL OUTER JOIN Database2.Table2 b ON a.ID = b.ID;

-- 63. Query with Joins and Complex Conditions
SELECT a.ID, a.MerchantName, b.Amount, c.Status
FROM Database1.Table1 a
INNER JOIN Database2.Table2 b ON a.ID = b.ID
LEFT JOIN Database2.Table3 c ON b.StatusID = c.StatusID
WHERE (a.Amount > 100 AND c.Status = 'Active') OR (b.Amount < 50 AND c.Status = 'Pending');

-- 64. Query with Advanced Aggregation and Window Functions
SELECT a.MerchantName, 
       SUM(b.Amount) AS TotalAmount, 
       ROW_NUMBER() OVER (PARTITION BY a.MerchantName ORDER BY SUM(b.Amount) DESC) AS Rank
FROM Database1.Table1 a
INNER JOIN Database2.Table2 b ON a.ID = b.ID
GROUP BY a.MerchantName;

-- 65. Query with Subqueries in JOIN Clause
SELECT a.ID, b.Amount
FROM Database1.Table1 a
INNER JOIN (
  SELECT ID, Amount
  FROM Database2.Table2
  WHERE Amount > (SELECT AVG(Amount) FROM Database2.Table2)
) b ON a.ID = b.ID;

-- 66. Query with Multiple Joins and Subqueries
SELECT a.ID, b.MerchantName, c.Amount, d.Status
FROM Database1.Table1 a
INNER JOIN Database2.Table2 b ON a.ID = b.ID
LEFT JOIN Database3.Table3 c ON b.MerchantID = c.MerchantID
LEFT JOIN Database4.Table4 d ON c.StatusID = d.StatusID
WHERE d.Status IS NOT NULL;

-- 67. Query with Recursive Joins and CTE
WITH RecursiveCTE AS (
  SELECT ID, MerchantName, ParentID, 1 AS Level
  FROM Database1.Table1
  WHERE ParentID IS NULL
  UNION ALL
  SELECT a.ID, a.MerchantName, a.ParentID, c.Level + 1
  FROM Database1.Table1 a
  INNER JOIN RecursiveCTE c ON a.ParentID = c.ID
)
SELECT ID, MerchantName, Level
FROM RecursiveCTE;

-- 68. Query with Join on Data Across Different Databases
SELECT a.ID, a.MerchantName, b.Amount
FROM Database1.Table1 a
INNER JOIN Database2.Database2.Table2 b ON a.ID = b.ID
WHERE a.DateTime BETWEEN '2024-01-01' AND '2024-12-31';

-- 69. Query with Pivot Table Functionality
SELECT MerchantName, 
       SUM(CASE WHEN MONTH(DateTime) = 1 THEN Amount ELSE 0 END) AS Jan_Amount,
       SUM(CASE WHEN MONTH(DateTime) = 2 THEN Amount ELSE 0 END) AS Feb_Amount
FROM Database1.Table1
GROUP BY MerchantName;

-- 70. Query with Join and ROLLUP for Hierarchical Aggregation
SELECT MerchantName, 
       DATE_FORMAT(DateTime, '%Y-%m') AS Month, 
       SUM(Amount) AS TotalAmount
FROM Database1.Table1
GROUP BY MerchantName, DATE_FORMAT(DateTime, '%Y-%m') WITH ROLLUP;

-- 71. Query with Nested Joins and Filtering
SELECT a.ID, b.Amount, c.Status
FROM Database1.Table1 a
INNER JOIN Database2.Table2 b ON a.ID = b.ID
LEFT JOIN Database3.Table3 c ON b.StatusID = c.StatusID
WHERE c.Status = 'Completed';

-- 72. Query with Full Outer Join and Aggregation (if supported)
SELECT a.ID, COALESCE(b.Amount, 0) AS AmountA, COALESCE(c.Amount, 0) AS AmountB
FROM Database1.Table1 a
FULL OUTER JOIN Database2.Table2 b ON a.ID = b.ID
FULL OUTER JOIN Database3.Table3 c ON a.ID = c.ID;

-- 73. Query with Hierarchical Data and Path Enumeration
WITH RecursiveCTE AS (
  SELECT ID, MerchantName, ParentID, CAST(ID AS CHAR(255)) AS Path
  FROM Database1.Table1
  WHERE ParentID IS NULL
  UNION ALL
  SELECT a.ID, a.MerchantName, a.ParentID, CONCAT(c.Path, '->', a.ID)
  FROM Database1.Table1 a
  INNER JOIN RecursiveCTE c ON a.ParentID = c.ID
)
SELECT ID, MerchantName, Path
FROM RecursiveCTE;

-- 74. Query with Dynamic Pivot Table (if supported)
SET @sql = NULL;
SELECT
  GROUP_CONCAT(DISTINCT
    CONCAT(
      'SUM(CASE WHEN MONTH(DateTime) = ', MONTH(DateTime), ' THEN Amount ELSE 0 END) AS Month_', MONTH(DateTime)
    )
  ) INTO @sql
FROM Database1.Table1;

SET @sql = CONCAT('SELECT MerchantName, ', @sql, ' FROM Database1.Table1 GROUP BY MerchantName');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- 75. Query with Advanced Aggregate Functions
SELECT a.MerchantName,
       MAX(b.Amount) AS MaxAmount,
       MIN(b.Amount) AS MinAmount,
       AVG(b.Amount) AS AvgAmount
FROM Database1.Table1 a
INNER JOIN Database2.Table2 b ON a.ID = b.ID
GROUP BY a.MerchantName;

-- 76. Query with Join on Calculated Fields
SELECT a.ID, b.Amount * 1.1 AS AdjustedAmount
FROM Database1.Table1 a
INNER JOIN Database2.Table2 b ON a.ID = b.ID;

-- 77. Query with Self Join and Filtering on Hierarchical Levels
SELECT a.ID, a.MerchantName, b.ID AS ParentID
FROM Database1.Table1 a
INNER JOIN Database1.Table1 b ON a.ParentID = b.ID
WHERE a.Level > 1;

-- 78. Query with Aggregation and Subquery in SELECT Clause
SELECT a.MerchantName, 
       (SELECT SUM(b.Amount) FROM Database2.Table2 b WHERE a.MerchantName = b.MerchantName) AS TotalAmount
FROM Database1.Table1 a;

-- 79. Query with Multiple Aggregations in a Single Query
SELECT a.MerchantName,
       COUNT(b.ID) AS TransactionCount,
       SUM(b.Amount) AS TotalAmount,
       AVG(b.Amount) AS AvgAmount
FROM Database1.Table1 a
INNER JOIN Database2.Table2 b ON a.ID = b.ID
GROUP BY a.MerchantName;

-- 80. Query with Complex Case Statements in Aggregations
SELECT a.MerchantName, 
       SUM(CASE 
           WHEN b.Amount > 100 THEN b.Amount 
           ELSE 0 
       END) AS HighAmount,
       SUM(CASE 
           WHEN b.Amount <= 100 THEN b.Amount 
           ELSE 0 
       END) AS LowAmount
FROM Database1.Table1 a
INNER JOIN Database2.Table2 b ON a.ID = b.ID
GROUP BY a.MerchantName;

-- 81. Query with Filtering on Aggregated Data
SELECT MerchantName, 
       SUM(Amount) AS TotalAmount
FROM Database1.Table1
GROUP BY MerchantName
HAVING SUM(Amount) > 1000;

-- 82. Query with Join and Time-based Filtering
SELECT a.ID, b.Amount
FROM Database1.Table1 a
INNER JOIN Database2.Table2 b ON a.ID = b.ID
WHERE b.DateTime >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH);

-- 83. Query with Conditional Aggregation and Multiple Conditions
SELECT a.MerchantName, 
       SUM(CASE WHEN b.Status = 'Success' THEN b.Amount ELSE 0 END) AS SuccessAmount,
       SUM(CASE WHEN b.Status = 'Failed' THEN b.Amount ELSE 0 END) AS FailedAmount
FROM Database1.Table1 a
INNER JOIN Database2.Table2 b ON a.ID = b.ID
GROUP BY a.MerchantName;

-- 84. Query with JOIN and UNION
SELECT a.ID, a.MerchantName, b.Amount
FROM Database1.Table1 a
INNER JOIN Database2.Table2 b ON a.ID = b.ID
UNION
SELECT c.ID, c.MerchantName, d.Amount
FROM Database3.Table3 c
LEFT JOIN Database4.Table4 d ON c.ID = d.ID;

-- 85. Query with Aggregation and JOIN on Calculated Columns
SELECT a.MerchantName, 
       SUM(b.Amount) AS TotalAmount,
       AVG(b.Amount) AS AverageAmount
FROM Database1.Table1 a
INNER JOIN (
  SELECT ID, Amount
  FROM Database2.Table2
  WHERE Amount > 50
) b ON a.ID = b.ID
GROUP BY a.MerchantName;

-- 86. Query with LEFT JOIN and IS NULL Filtering
SELECT a.ID, a.MerchantName, b.Amount
FROM Database1.Table1 a
LEFT JOIN Database2.Table2 b ON a.ID = b.ID
WHERE b.ID IS NULL;

-- 87. Query with RIGHT JOIN and Aggregation
SELECT a.ID, a.MerchantName, SUM(b.Amount) AS TotalAmount
FROM Database1.Table1 a
RIGHT JOIN Database2.Table2 b ON a.ID = b.ID
GROUP BY a.ID, a.MerchantName;

-- 88. Query with Multi-level JOIN and Aggregations
SELECT a.MerchantName, 
       COUNT(DISTINCT b.ID) AS TransactionCount, 
       SUM(c.Amount) AS TotalAmount
FROM Database1.Table1 a
INNER JOIN Database2.Table2 b ON a.ID = b.ID
LEFT JOIN Database3.Table3 c ON b.MerchantID = c.MerchantID
GROUP BY a.MerchantName;

-- 89. Query with JOIN and Subquery in WHERE Clause
SELECT a.ID, a.MerchantName, b.Amount
FROM Database1.Table1 a
INNER JOIN Database2.Table2 b ON a.ID = b.ID
WHERE b.Amount > (
  SELECT AVG(Amount)
  FROM Database2.Table2
  WHERE MerchantName = a.MerchantName
);

-- 90. Query with CROSS JOIN for Cartesian Product
SELECT a.ID, a.MerchantName, b.Amount
FROM Database1.Table1 a
CROSS JOIN Database2.Table2 b;

-- 91. Query with Self JOIN and Aggregation
SELECT a.ID, a.MerchantName, 
       SUM(b.Amount) AS TotalAmount
FROM Database1.Table1 a
INNER JOIN Database1.Table1 b ON a.ParentID = b.ID
GROUP BY a.ID, a.MerchantName;

-- 92. Query with JOIN and String Matching
SELECT a.ID, a.MerchantName, b.Amount
FROM Database1.Table1 a
INNER JOIN Database2.Table2 b ON a.MerchantName LIKE CONCAT('%', b.MerchantName, '%');

-- 93. Query with JOIN and Date Range Filtering
SELECT a.ID, a.MerchantName, b.Amount
FROM Database1.Table1 a
INNER JOIN Database2.Table2 b ON a.ID = b.ID
WHERE b.DateTime BETWEEN '2024-01-01' AND '2024-12-31';

-- 94. Query with JOIN and Calculated Fields in WHERE Clause
SELECT a.ID, a.MerchantName, b.Amount
FROM Database1.Table1 a
INNER JOIN Database2.Table2 b ON a.ID = b.ID
WHERE b.Amount > (a.Amount * 0.1);

-- 95. Query with JOIN and Conditional Aggregation
SELECT a.MerchantName,
       SUM(CASE WHEN b.Status = 'Success' THEN b.Amount ELSE 0 END) AS SuccessAmount,
       SUM(CASE WHEN b.Status = 'Failed' THEN b.Amount ELSE 0 END) AS FailedAmount
FROM Database1.Table1 a
INNER JOIN Database2.Table2 b ON a.ID = b.ID
GROUP BY a.MerchantName;

-- 96. Query with JOIN and Temporary Table Usage
CREATE TEMPORARY TABLE TempTable AS
SELECT ID, Amount
FROM Database2.Table2
WHERE Amount > 100;

SELECT a.ID, a.MerchantName, b.Amount
FROM Database1.Table1 a
INNER JOIN TempTable b ON a.ID = b.ID;

-- 97. Query with JOIN and Common Table Expressions (CTE)
WITH CTE AS (
  SELECT ID, Amount
  FROM Database2.Table2
  WHERE Amount > 50
)
SELECT a.ID, a.MerchantName, b.Amount
FROM Database1.Table1 a
INNER JOIN CTE b ON a.ID = b.ID;

-- 98. Query with JOIN and Full Text Search (if supported)
SELECT a.ID, a.MerchantName, b.Amount
FROM Database1.Table1 a
INNER JOIN Database2.Table2 b ON MATCH(a.MerchantName) AGAINST(b.MerchantName IN BOOLEAN MODE);

-- 99. Query with JOIN and JSON Data Handling (if supported)
SELECT a.ID, a.MerchantName, JSON_EXTRACT(b.Data, '$.Amount') AS Amount
FROM Database1.Table1 a
INNER JOIN Database2.Table2 b ON a.ID = b.ID;

-- 100. Query with JOIN and Recursive Data Retrieval (if supported)
WITH RECURSIVE CTE AS (
  SELECT ID, MerchantName, ParentID, 1 AS Level
  FROM Database1.Table1
  WHERE ParentID IS NULL
  UNION ALL
  SELECT a.ID, a.MerchantName, a.ParentID, c.Level + 1
  FROM Database1.Table1 a
  INNER JOIN CTE c ON a.ParentID = c.ID
)
SELECT ID, MerchantName, Level
FROM CTE;



