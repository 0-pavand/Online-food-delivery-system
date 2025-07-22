use ONLINE_FOOD_DEL;


-- 1.)

select count(o.order_id) as total_orders,c.customer_name
from customers c join orders o 
on c.customer_id=o.customer_id
group by customer_name;

-- 2.) 

select sum(m.price * od.quantity) as total_revenue, r.city 
from restaurant r join menu_item m
on r.hotel_id=m.hotel_id
join order_details od on od.item_id = m.item_id
group by r.city;

-- 3.) 

select m.item_name , count(od.order_id) as total_orders 
from order_details od join menu_item m
on od.item_id =m.item_id
group by item_name;


-- 4.) 

select c.city , avg(od.quantity * m.price) as order_value
from customers c join orders o
on c.customer_id = o.customer_id 
join order_details od on od.order_id = o.order_id
join menu_item m on od.item_id = m.item_id
group by city;

-- 5.) 

select r.rest_name , count( DISTINCT od.item_id) as Diff_items
from restaurant r join orders o
on r.hotel_id = o.hotel_id
join order_details od on o.order_id = od.order_id
group by rest_name ;


-- 6.) 

select r.city , count(o.order_id) as total_orders 
from restaurant r join orders o
on r.hotel_id = o.hotel_id
group by r.city 
having count(o.order_id)>5;

-- 7.)

select m.item_name , sum(m.price * od.quantity) as revenue
from menu_item m join order_details od
on m.item_id = od.item_id
group by m.item_name
having sum(m.price*od.quantity)>1000;

-- 8.) 

select c.customer_name , count(o.order_id) as total_orders
from customers c join orders o
on c.customer_id = o.customer_id
group by c.customer_name 
having count(o.order_id)>3;

-- 9.) 

select m.item_name , count(o.order_id) as total_orders
from menu_item m join orders o
on m.hotel_id = o.hotel_id
group by m.item_name
having count(o.order_id) > 2;


-- 10.)

select item_name , price ,(select avg(price) from menu_item )as avg_price
from menu_item;

-- 11.)

select customer_name , customer_id 
from customers 
where customer_id in (select customer_id from orders);

-- 12.) 

select item_name , price ,
(price - (select avg(price) from menu_item)) as price_diff 
from menu_item;

-- 13.) 

select item_name , price 
from menu_item
where price > (select avg(price) from menu_item);

-- 14.) 

select customer_name , customer_id 
from customers 
where customer_id not in (select customer_id from orders);



-- 15.) summary query 

select r.city , count(o.order_id) as total_orders
from orders o join restaurant r
on o.hotel_id = r.hotel_id
group by r.city order by total_orders desc;

-- jaipur , hyderabad , chennai have the highest no. of orders compared to others
-- active markets
-- focus - marketing efforts, special offers 
-- expansion statergies
-- improve operations in other cities 

-- 16.) revenue of each food item 

select m.item_name , sum(m.price*od.quantity) as tot_revenue
from menu_item m join order_details od
on m.item_id = od.item_id
group by m.item_name
order by tot_revenue desc;

-- best perfoming food item by earning is Aloo paratha
-- next is fish curry AND Momos are top 3
-- promote it more on app 
-- ensure consistent availability and faster delivery .

-- 17.) top 5 spending customers 

select c.customer_name , sum(m.price * od.quantity) as tot_spent
from customers c join orders o
on c.customer_id = o.customer_id
join order_details od on o.order_id = od.order_id
join menu_item m on m.item_id = od.item_id
group by c.customer_name
order by tot_spent desc
limit 5;

-- Top 5 customers are Aditya Verma,Reyansh Verma,Arjun Mehta,Krishna Sharma,Krishna Reddy
-- can give discounts to promote spending more

-- 18.) Restaurant wise order count

select r.rest_name , count(od.order_id) as tot_orders
from restaurant r join orders o 
on r.hotel_id = o.hotel_id
join order_details od on od.order_id = o.order_id
group by r.rest_name
order by tot_orders desc;

-- Big Table restaurant is first in total orders
-- can promote other nearby restaurants 

-- 19.) Average order value by city

select c.city , avg(od.quantity * m.price) as avg_order_value
from customers c join orders o
on c.customer_id = o.customer_id
join order_details od on od.order_id = o.order_id
join menu_item m on m.item_id = od.item_id
group by c.city
order by avg_order_value desc;


-- Delhi has the highest avg_order_value 
-- can promote more compared to other cities 
-- can promote top 3 



-- 20.) 

select month(order_date) as month_number,monthname(order_date) as month_name , count(order_id) as total_orders 
from orders o 
group by month(order_date) , monthname(order_date)
order by month_number;

-- 21.)

select c.city, sum(m.price * od.quantity) as tot_rev
from customers c join orders o
on c.customer_id = o.customer_id
join order_details od on od.order_id = o.order_id
join menu_item m on od.item_id = m.item_id
group by c.city
order by tot_rev desc
limit 3;

-- 22.) 

select city,count(distinct customer_id) as unique_customers
from customers 
group by city
order by unique_customers desc;

-- 23.) 

select m.item_name , sum(od.quantity) as tot_orders 
from order_details od join menu_item m
on od.item_id = m.item_id
group by m.item_name
order by tot_orders desc;

-- 24.) 

select r.rest_name , count(o.order_id) as tot_orders
from restaurant r join orders o
on r.hotel_id = o.hotel_id
group by r.rest_name
having count(o.order_id) < 30
order by tot_orders ;






