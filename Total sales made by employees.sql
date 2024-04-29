
SELECT
    e.employeeNumber,
    CONCAT(e.firstName, ' ', e.lastName) AS full_Name,
    e.jobTitle,
    SUM(od.priceEach * od.quantityOrdered) AS totalSales
FROM
    mintclassics.employees AS e
LEFT JOIN
    mintclassics.customers AS c ON e.employeeNumber = c.salesRepEmployeeNumber
LEFT JOIN
    mintclassics.orders AS o ON c.customerNumber = o.customerNumber
LEFT JOIN
    mintclassics.orderdetails AS od ON o.orderNumber = od.orderNumber
GROUP BY
    e.employeeNumber, full_Name, e.jobTitle
ORDER BY
    totalSales DESC;