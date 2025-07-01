/*	Question Set 1 - Easy */

/* Q1: Who is the senior most employee based on job title? */
SELECT 
  CONCAT(first_name,last_name) AS emp_name
FROM 
  employee
ORDER BY 
  levels DESC 
LIMIT 1;

/* Q2: Which countries have the most Invoices? */
SELECT 
  count(*) AS num_of_invoices, billing_country FROM invoice
GROUP BY 
  billing_country
ORDER BY 
  num_of_invoices DESC
LIMIT 1;

/* Q3: What are top 3 values of total invoice? */
SELECT 
  billing_country, total 
FROM 
  invoice
ORDER BY 
  total DESC
LIMIT 3;

/* Q4: Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. 
Write a query that returns one city that has the highest sum of invoice totals. 
Return both the city name & sum of all invoice totals */
SELECT 
  billing_country, SUM(total) AS invoice_total
FROM 
  invoice
GROUP BY 
  billing_country
ORDER BY 
  invoice_total DESC
LIMIT 1;

/* Q5: Who is the best customer? The customer who has spent the most money will be declared the best customer. 
Write a query that returns the person who has spent the most money.*/
SELECT 
  SUM(invoice.total) AS invoice_total, customer.first_name, customer.last_name 
FROM 
  invoice
INNER JOIN 
  customer 
ON 
  invoice.customer_id = customer.customer_id
GROUP BY 
  invoice.customer_id, customer.first_name, customer.last_name
ORDER BY 
  invoice_total DESC
LIMIT 1;
