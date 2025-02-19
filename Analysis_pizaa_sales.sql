# Q1. Retrieve the total number of orders placed.
select count(orders.order_id) as total_orders from orders;


# Q2. Calculate the total revenue generated from pizza sales.
SELECT 
    SUM(od.quantity * p.price) AS Total_Renvenue
FROM
    order_details AS od
        JOIN
    pizzas AS p ON od.piza_id = p.pizza_id;
    
  
  # Q3. Identify the highest-priced pizza.
  SELECT 
    p.price AS highest_price, pt.name
FROM
    pizzas AS p
        JOIN
    pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
ORDER BY p.price DESC
LIMIT 1;


# Q4. Identify the most common pizza size ordered.
SELECT 
    p.size, COUNT(od.order_details_id) AS size_orderd
FROM
    pizzas AS p
        JOIN
    order_details AS od ON p.pizza_id = od.piza_id
GROUP BY p.size
ORDER BY size_orderd DESC
LIMIT 1;



# Q5. List the top 5 most ordered pizza types along with their quantities.
with CTE as (SELECT 
    od.quantity, p.pizza_type_id
FROM
    pizzas p
        JOIN
    order_details od ON p.pizza_id = od.piza_id)

SELECT 
    pt.name, SUM(c.quantity) AS Quantity
FROM
    CTE c
        JOIN
    pizza_types pt ON c.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY Quantity DESC
LIMIT 5;


    
    
