CREATE DATABASE if not exists `travel-directory`;
use `travel-directory`;
create table if not exists `passenger` (`Passenger_name` varchar(20),
 `Category` varchar(20), 
 `Gender` varchar(10),
 `Boarding_City` varchar(30),
 `Destination_City` varchar(30),
 `Distance` int,
 `Bus_Type` varchar(20));

create table if not exists `price` (`bus_type` varchar(20), `distance` int, `price` int);

insert into `passenger` values("Sejal", "AC", 'F', "Bengaluru", "Chennai", 350, "Sleeper");
insert into `passenger` values("Anmol", "Non-AC", 'M', "Mumbai", "Hyderabad", 700, "Sitting");
insert into `passenger` values("Pallavi", "AC", 'F', "Panaji", "Bengaluru", 600, "Sleeper");
insert into `passenger` values("Khusboo", "AC", 'F', "Chennai", "Mumbai", 1500, "Sleeper");
insert into `passenger` values('Udit', 'Non-AC', 'M', 'Trivandrum', 'panaji', 1000, 'Sleeper');
insert into `passenger` values('Ankur', 'AC', 'M', 'Nagpur', 'Hyderabad', 500, 'Sitting');
insert into `passenger` values('Hemant', 'Non-AC', 'M', 'panaji', 'Mumbai', 700, 'Sleeper');
insert into `passenger` values('Manish', 'Non-AC', 'M', 'Hyderabad', 'Bengaluru', 500, 'Sitting');
insert into `passenger` values('Piyush', 'AC', 'M', 'Pune', 'Nagpur', 700, 'Sitting');

insert into `price` values('Sleeper', 350, 770);
insert into `price` values('Sleeper', 500, 1100);
insert into `price` values('Sleeper', 600, 1320);
insert into `price` values('Sleeper', 700, 1540);
insert into `price` values('Sleeper', 1000, 2200);
insert into `price` values('Sleeper', 1200, 2640);
insert into `price` values('Sleeper', 350, 434);
insert into `price` values('Sitting', 500, 620);
insert into `price` values('Sitting', 500, 620);
insert into `price` values('Sitting', 600, 744);
insert into `price` values('Sitting', 700, 868);
insert into `price` values('Sitting', 1000, 1240);
insert into `price` values('Sitting', 1200, 1488);
insert into `price` values('Sitting', 1500, 1860);

select count(gender) as gendercount, gender from passenger p where p.distance >= 600 group by gender;

select bus_type, min(price) from price group by bus_type;

select passenger_name from passenger where passenger_name like 'S%';
 
select distinct(passenger_name), Boarding_city, Destination_city, p.bus_type, p.price from passenger ps 
left join price p using(distance, bus_type) group by passenger_name;

select distinct(passenger_name), price from passenger ps inner join price p using(distance, bus_type) 
where ps.distance =1000 and p.bus_type = 'sitting';

select price, bus_type, passenger_name, Boarding_City, Destination_city from price p left join passenger ps using(distance, bus_type)
where distance = 600;

select distinct(distance) from passenger order by distance desc;

select passenger_name, distance*100/sum(distance) over() as percentagecovered
from passenger;

delimiter &&
create procedure displayPricing()
begin
select distance,price, 
case
when price > 1000 then 'Expensive'
when price < 1000 and price > 500 then 'Average cost'
else 'Cheap'
end as Verdict
from price;
end &&
call displayPricing();
 




 








 


