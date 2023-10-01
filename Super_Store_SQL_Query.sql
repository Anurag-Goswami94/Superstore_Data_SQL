SELECT * FROM super_store.store_orderdetails;
SELECT * FROM super_store.store_products;
SELECT * FROM super_store.store_propertyinfo;

## 1. Find the maximum Quantity sold in a Transaction.

SELECT max(Quantity), COUNT(*) FROM super_store.store_orderdetails;

## 2. Find the Unique products in all the Transaction. 

SELECT DISTINCT ProductID FROM super_store.store_orderdetails ORDER BY ProductID asc;

## 3. Find the Unique properties.

SELECT DISTINCT PropertyID FROM super_store.store_orderdetails ORDER BY PropertyID ASC;

## 4. Find the maximum number of Quantities sold for each of this product.

SELECT DISTINCT ProductID, COUNT(Quantity) FROM super_store.store_orderdetails GROUP BY ProductID ORDER BY ProductID ASC;

## 5. Find the Product Category that has maximum Products

SELECT DISTINCT ProductCategory, COUNT(ProductName) FROM super_store.store_products GROUP BY ProductCategory ORDER BY COUNT(ProductName) DESC;

## 6. Find the State where most stores are Present.alter

SELECT DISTINCT PropertyState, COUNT(PropertyCity) AS Total_of_Stores FROM super_store.store_propertyinfo GROUP BY PropertyState ORDER BY COUNT(PropertyCity) DESC;

## 7. Find the top 5 Product IDs that did Maximum SALES in the term of Quantity.

SELECT DISTINCT ProductID, SUM(Quantity) AS Sales FROM super_store.store_orderdetails GROUP BY ProductID ORDER BY sum(Quantity) DESC LIMIT 5;

## 8. Find the Top 5 property ID's that did maximum Quantity

SELECT DISTINCT PropertyID, SUM(Quantity) FROM super_store.store_orderdetails GROUP BY PropertyID ORDER BY SUM(Quantity) DESC LIMIT 5;  

## 9. Find the top 5 Product Names that did maximum Sales in Terms of Quantity. 

SELECT store_products.ProductName, SUM(store_orderdetails.Quantity) As Total_Quantity_Sold
FROM store_products LEFT JOIN store_orderdetails on store_products.ProductID= store_orderdetails.ProductID
GROUP BY store_products.ProductName ORDER BY SUM(store_orderdetails.Quantity)DESC;

## 10. Find the Top 5 products that did Maximum Sales.

SELECT store_products.ProductName, SUM(store_orderdetails.Quantity * store_products.Price) AS Sales FROM store_products 
LEFT JOIN store_orderdetails ON store_products.ProductID = store_orderdetails.ProductID
GROUP BY store_products.ProductName ORDER BY Sales DESC;

## 11. Find the Top 5 cities that did the Maximum sales.

SELECT store_propertyinfo.PropertyCity, SUM(store_orderdetails.Quantity * store_products.Price) AS Total_Sales 
FROM store_orderdetails 
LEFT JOIN store_products on store_products.ProductID = store_orderdetails.ProductID
LEFT JOIN store_propertyinfo on store_propertyinfo.PropID = store_orderdetails.PropertyID
GROUP BY store_propertyinfo.PropertyCity
ORDER BY Total_Sales DESC
LIMIT 5;















