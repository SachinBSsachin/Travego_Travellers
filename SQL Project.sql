create database travego;
use travego;
drop table passenger;
drop table price;
create table passenger(
passenger_id int auto_increment primary key,
passenger_name varchar(20),
category varchar(20),
gender varchar(20),
boarding_city varchar(20),
destination_city varchar(20),
distance int,
bus_type varchar(20)
);
show tables;

insert into passenger (passenger_name, category, gender, boarding_city, destination_city, distance, bus_type)
values('sejal', 'ac', 'f', 'bengaluru', 'chennai', 350, 'sleeper'),
('anmol', 'non-ac', 'm', 'mumbai', 'hyderabad', 700, 'sitting'),
('pallavi', 'ac', 'f', 'panaji', 'bengaluru', 600, 'sleeper'),
('khusboo', 'ac', 'f', 'chennai', 'mumbai', 1500, 'sleeper'),
('udit', 'non-ac', 'm', 'trivandrum', 'panaji', 1000, 'sleeper'),
('ankur', 'ac', 'm', 'nagapur', 'hyderabad', 500, 'sitting'),
('hemant', 'non-ac', 'm', 'panaji', 'mumbai', 700, 'sleeper'),
('manish', 'non-ac', 'm', 'hyderabad', 'bengaluru', 500, 'sitting'),
('piyush', 'ac', 'm', 'pune', 'nagpur', 700, 'sitting');

select * from passenger;

create table price( id int auto_increment primary key, bus_type varchar(20), distance int, price int);
insert into price (bus_type, distance, price)
values('sleeper', 350, 770),
('sleeper', 500, 1100),
('sleeper', 600, 1320),
('sleeper', 700, 1540),
('sleeper', 1000, 2200),
('sleeper', 1200, 2640),
('sleeper', 1500, 2700),
('sitting', 500, 620),
('sitting', 600, 744),
('sitting', 700, 868),
('sitting', 1000, 1240),
('sitting', 1200, 1488),
('sitting', 1500, 1860);
select * from price;


-- a. How many females and how many male passengers traveled a minimum distance of 600 KMs?
select gender,distance,count(gender)
from passenger
where distance>=600
group by gender;


-- b. Find the minimum ticket price of a Sleeper Bus. 
select min(price),bus_type
from price
where bus_type='sleeper';

-- c. Select passenger names whose names start with character 'S' 
select passenger_name
from passenger 
where passenger_name like 's%';

-- d. Calculate price charged for each passenger displaying Passenger name, Boarding City,
-- Destination City, Bus_Type, Price in the output
select pr.price, pa.passenger_name, pa.boarding_city, pa.destination_city, pa.bus_type
from passenger as pa
left join price as pr
on pa.passenger_id=pr.id;

-- e. What are the passenger name(s) and the ticket price for those who traveled 1000 KMs Sitting in a bus?  
select pa.passenger_name, pr.price, pr.distance, pr.bus_type
from passenger as pa 
right join price as pr
on pa.passenger_id=pr.id
where pr.distance=1000 and pr.bus_type='sitting';
#from the given data set,No passenger have travelled 1000km by sitting

select * from passenger;
select * from price;


-- f. What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?
select a.passenger_name, b.bus_type, b.price, a.boarding_city, a.destination_city
from passenger as a
left join price as b
on a.distance = b.distance 
where passenger_name='pallavi' and boarding_city='panaji' and destination_city = 'bengaluru';

-- g. List the distances from the "Passenger" table which are unique (non-repeated distances) in descending order. 
select distinct  distance from passenger order by distance desc;

-- h.Display the passenger name and percentage of distance traveled by that passenger 
-- from the total distance traveled by all passengers without using user variables 
select passenger_name,((distance)/(select sum(distance) from passenger))*100
from passenger;
















