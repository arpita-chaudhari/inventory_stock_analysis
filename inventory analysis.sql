CREATE DATABASE InventoryAnalysis;

USE InventoryAnalysis;
SELECT COUNT(*) AS Total_Rows
FROM inventory;

SELECT
    SUM(OrderItemQuantity) AS Total_Units
FROM inventory;

SELECT
    ProductName,
    SUM(OrderItemQuantity) AS Total_Units_Sold,
    COUNT(*) AS Number_of_Orders
FROM inventory
GROUP BY ProductName
ORDER BY Total_Units_Sold DESC;

SELECT TOP 10
    ProductName,
    SUM(OrderItemQuantity) AS Total_Units_Sold
FROM inventory
GROUP BY ProductName
ORDER BY Total_Units_Sold DESC;

SELECT TOP 10
    ProductName,
    SUM(OrderItemQuantity) AS Total_Units_Sold
FROM inventory
GROUP BY ProductName
ORDER BY Total_Units_Sold ASC;

SELECT
    CategoryName,
    COUNT(*) AS Orders,
    SUM(OrderItemQuantity) AS Total_Units,
    SUM(OrderItemQuantity * PerUnitPrice) AS Revenue,
    SUM(Profit) AS Total_Profit
FROM inventory
GROUP BY CategoryName
ORDER BY Revenue DESC;

SELECT
    WarehouseName,
    COUNT(*) AS Orders,
    SUM(OrderItemQuantity) AS Total_Units,
    SUM(OrderItemQuantity * PerUnitPrice) AS Revenue,
    SUM(Profit) AS Total_Profit
FROM inventory
GROUP BY WarehouseName
ORDER BY Revenue DESC;

SELECT
    Status,
    COUNT(*) AS Orders,
    SUM(OrderItemQuantity) AS Total_Units,
    SUM(OrderItemQuantity * PerUnitPrice) AS Revenue
FROM inventory
GROUP BY Status
ORDER BY Orders DESC;

SELECT
    ProductName,
    COUNT(*) AS Canceled_Orders,
    SUM(OrderItemQuantity) AS Canceled_Units
FROM inventory
WHERE Status = 'Canceled'
GROUP BY ProductName
ORDER BY Canceled_Units DESC;

SELECT
    YEAR(OrderDate) AS Order_Year,
    MONTH(OrderDate) AS Order_Month,
    SUM(OrderItemQuantity) AS Total_Units,
    COUNT(*) AS Total_Orders
FROM inventory
GROUP BY
    YEAR(OrderDate),
    MONTH(OrderDate)
ORDER BY
    Order_Year,
    Order_Month;

    SELECT TOP 10
    ProductName,
    SUM(OrderItemQuantity * PerUnitPrice) AS Revenue,
    SUM(Profit) AS Total_Profit
FROM inventory
GROUP BY ProductName
ORDER BY Total_Profit DESC;

SELECT
    ProductName,
    SUM(OrderItemQuantity * PerUnitPrice) AS Revenue,
    SUM(Profit) AS Profit,
    ROUND(
        SUM(Profit) * 100.0 /
        NULLIF(SUM(OrderItemQuantity * PerUnitPrice), 0),
        2
    ) AS Profit_Margin_Percent
FROM inventory
GROUP BY ProductName
ORDER BY Profit_Margin_Percent DESC;