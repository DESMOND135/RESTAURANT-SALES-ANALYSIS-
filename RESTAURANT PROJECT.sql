-- viewing the menue items table 

select *
from menu_items;

-- finding the number of items on the menue

select  count(*) as total_item
from menu_items ;
-- group by price 

-- total number of item/dishes on each category 

select  category, item_name, count(item_name ) as total_item
from menu_items 
group by category; 

-- least expensive  element in the menue

select  price, item_name  as total_item
from menu_items 
order by price 
limit 5;

-- most expensive elements in the menue

select  price, item_name  as total_item
from menu_items 
order by price desc
limit 5; 

-- how many italian dishes are on the menue 

 select  category, count(item_name ) as Italian_dishes
from menu_items 
where category = 'Italian'
group by category; 

 --  italian dishes in the menu 
 
select  category, item_name as Italian_dishes
from menu_items 
where category = 'Italian';

-- 3 least expensive italian dishes

select  price, category, item_name as Italian_dishes
from menu_items 
where category = 'Italian' 
order by price 
limit 3; 

-- 3 most expensive italian dishes 

select  price, category, item_name as Italian_dishes
from menu_items 
where category = 'Italian' 
order by price desc
limit 3 ;

-- average price for each category 

select  category, max(item_name), avg( price ) as average_price
from menu_items 
group by category; 

-- returning order table

select * 
from order_details;

-- customers order date range

select  min(order_date) as start_order_date, max(order_date) as end_order_date
from order_details; 

-- how many order was made 

select  count(distinct order_id) as num_of_order
from order_details;

-- how many number of item ordered

select count(order_details_id) 
from order_details;

-- order with the n]most number of item 

select order_id, count(item_id) as num_items
from order_details 
group by order_id
order by num_items desc; 

-- how many order has more than 12 items

select count(order_id)
from 

    (select  order_id, count(item_id) as num_items
    from order_details 
	group by order_id 
    having num_items > 12) as item;
-- order by num_items desc 

-- combine menu and order table using inner join

select * 
from menu_items mi 
join order_details od 
    on mi.menu_item_id = od.item_id;

-- least order item 

select
 mi.item_name,
 count(od.order_details_id) as num_purchase
from menu_items mi 
join order_details od 
    on mi.menu_item_id = od.item_id 
group by mi.item_name , category
order by num_purchase;

-- most order item 

select
 mi.item_name,
 count(od.order_details_id) as num_purchase
from menu_items mi 
join order_details od 
    on mi.menu_item_id = od.item_id 
group by mi.item_name , category
order by num_purchase desc;

-- top 5 order that spemd the most  

select mi.item_name,od.order_id, sum(mi.price) as top_exp
from menu_items mi 
join order_details od 
    on mi.menu_item_id = od.item_id 
group by od.order_id
order by top_exp desc
limit 5; 

-- insight gotten from the order with the highest expeniture 
-- Italian item been the most order 

select mi.category, mi.price,
 count(od.item_id) as num_items
from menu_items mi 
join order_details od 
    on mi.menu_item_id = od.item_id 
where od.order_id = 440
group by  mi.category;
-- order by top_exp desc
-- limit 5

 -- insight gotten from the 5 most orders with the highest expeniture 
-- Asian item been the most order 

select 
od.order_id,
mi.category,
mi.price, 
count(od.item_id) as num_items , sum(mi.price) as price
from menu_items mi 
join order_details od 
    on mi.menu_item_id = od.item_id 
group by  od.order_id
having price  >= 185.10 










