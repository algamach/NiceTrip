create database NiceTrip
use NiceTrip
create table client(client_num NUMERIC(9) IDENTITY PRIMARY KEY,
			        client_lname VARCHAR(30) NOT NULL,
		 	        client_name VARCHAR(30) NOT NULL,
			        client_mname VARCHAR(30),
		 	        client_pasport NUMERIC(10)NOT NULL,
			        client_phone NUMERIC(11)
			       )
create table route(route_num NUMERIC(9) IDENTITY PRIMARY KEY,
				   route_type VARCHAR(11) DEFAULT 'авиаперелет' NOT NULL,
				   route_date_leaving DATETIME,
				   route_date_arrival DATETIME,
				   check (route_date_arrival>route_date_leaving)
				   )
create table staff(staff_num NUMERIC(9) IDENTITY PRIMARY KEY,
			       staff_lname VARCHAR(30) NOT NULL,
		 	       staff_name VARCHAR(30) NOT NULL,
			       staff_mname VARCHAR(30),
			       staff_phone NUMERIC(11)
			       )
create table country(country_code NUMERIC(3) NOT NULL,
					 country_name VARCHAR(30) NOT NULL,
					 country_city VARCHAR(30) NOT NULL,
					 country_hotel_addr VARCHAR(60) NOT NULL,
					 country_num NUMERIC(9) IDENTITY PRIMARY KEY NOT NULL
			        )
create table tour(tour_num NUMERIC(9) IDENTITY PRIMARY KEY NOT NULL,
				  route_num NUMERIC(9),
				  country_num NUMERIC(9),

				  CONSTRAINT fk_tour_route_num
				  FOREIGN KEY (route_num) 
				  REFERENCES route (route_num),

				  CONSTRAINT fk_tour_country_num
				  FOREIGN KEY (country_num) 
				  REFERENCES country (country_num)
			      )	 
create table contract(contract_num NUMERIC(9) IDENTITY PRIMARY KEY NOT NULL, 
					  contract_cost MONEY NOT NULL,
					  client_num NUMERIC(9), 
					  staff_num NUMERIC(9),
					  tour_num NUMERIC(9),	  
					  
					  CONSTRAINT fk_contract_client_num
				     	  FOREIGN KEY (client_num) 
				      	  REFERENCES client (client_num),	

					  CONSTRAINT fk_contract_staff_num
			     	  	  FOREIGN KEY (staff_num) 
				      	  REFERENCES staff (staff_num),

					  CONSTRAINT fk_contract_tour_num
					  FOREIGN KEY (tour_num) 
					  REFERENCES tour (tour_num),
)
INSERT INTO staff(staff_lname,staff_name,staff_mname,staff_phone)
VALUES('Болокана ','Вероника ','Казимировна ','79958834585');
INSERT INTO staff(staff_lname,staff_name,staff_mname,staff_phone)
VALUES('Евдокимов  ','Виталий  ','Маркович  ','79958345585');
INSERT INTO staff(staff_lname,staff_name,staff_mname,staff_phone)
VALUES('Окрокверцхов  ','Семен  ','Мартьянович  ','79858964585');
INSERT INTO staff(staff_lname,staff_name,staff_mname,staff_phone)
VALUES('Мерзлов  ','Эмиль  ',null,'79876635875');
INSERT INTO staff(staff_lname,staff_name,staff_mname,staff_phone)
VALUES('Кропанин  ','Авдей  ','Ираклиевич  ','79377712777');
INSERT INTO staff(staff_lname,staff_name,staff_mname,staff_phone)
VALUES('Дейнекин  ','Емельян  ','Моисеевич  ','79989675315');
INSERT INTO staff(staff_lname,staff_name,staff_mname,staff_phone)
VALUES('Грибкова ','Ксения  ','Данилевна  ','79957778551');
INSERT INTO staff(staff_lname,staff_name,staff_mname,staff_phone)
VALUES('Наумов  ','Игнатий  ','Самуилович  ','79854692585');
INSERT INTO staff(staff_lname,staff_name,staff_mname,staff_phone)
VALUES('Блинова ','Галина  ','Фомевна  ','79952334585');
INSERT INTO staff(staff_lname,staff_name,staff_mname,staff_phone)
VALUES('Стукалов  ','Николай  ',null,'79956567585');
INSERT INTO client(client_lname,client_name,client_mname,client_phone,client_pasport)
VALUES('Ратников ','Артем  ','Агапович  ','79958834585', '9218789325');
INSERT INTO client(client_lname,client_name,client_phone,client_pasport)
VALUES('Эсмонд  ','Арсений  ','79872274585', '9218796532');
INSERT INTO client(client_lname,client_name,client_mname,client_phone,client_pasport)
VALUES('Фененко  ','Ипполит  ','Серафимович  ','79951234585', '9218785264');
INSERT INTO client(client_lname,client_name,client_mname,client_phone,client_pasport)
VALUES('Андрюхина  ','Влада  ','Глебовна  ','79958854321', '9218774521');
INSERT INTO client(client_lname,client_name,client_phone,client_pasport)
VALUES('Можаева  ','Владлена  ','79998534585', '9218788563');
INSERT INTO client(client_lname,client_name,client_mname,client_phone,client_pasport)
VALUES('Пустова  ','Людмила  ','Анатолиевна  ','79852834585', '9218785625');
INSERT INTO client(client_lname,client_name,client_mname,client_phone,client_pasport)
VALUES('Ростовцев  ','Филипп ','Мартьянович  ','79958895125', '9218759625');
INSERT INTO client(client_lname,client_name,client_mname,client_phone,client_pasport)
VALUES('Осенныха  ','Вероника ','Давидовна  ','79958956235', '9218965235');
INSERT INTO client(client_lname,client_name,client_mname,client_phone,client_pasport)
VALUES('Чугунов  ','Даниил  ','Потапович  ','79197334585', '9218152625');
INSERT INTO client(client_lname,client_name,client_mname,client_phone,client_pasport)
VALUES('Болокана ','Анастасия  ','Серафимовна  ','79958898653', '9218789708');
INSERT INTO route(route_type,route_date_leaving,route_date_arrival)
VALUES ('авиаперелет','02.01.2018','02.11.2018')
INSERT INTO route(route_type,route_date_leaving,route_date_arrival)
VALUES ('авиаперелет','01.12.2018','15.12.2018')
INSERT INTO route(route_type,route_date_leaving,route_date_arrival)
VALUES ('ж/д рейс','04.12.2018','16.12.2018')
INSERT INTO route(route_type,route_date_leaving,route_date_arrival)
VALUES ('авиаперелет','01.01.2019','15.01.2019')
INSERT INTO route(route_type,route_date_leaving,route_date_arrival)
VALUES ('авиаперелет','21.03.2019','31.03.2019')
INSERT INTO route(route_type,route_date_leaving,route_date_arrival)
VALUES ('авиаперелет','01.04.2019','11.04.2019')
INSERT INTO route(route_type,route_date_leaving,route_date_arrival)
VALUES ('ж/д рейс','12.05.2019','21.05.2019')
INSERT INTO route(route_type,route_date_leaving,route_date_arrival)
VALUES ('ж/д рейс','07.10.2019','16.10.2019')
INSERT INTO route(route_type,route_date_leaving,route_date_arrival)
VALUES ('ж/д рейс','11.07.2019','29.07.2019')
INSERT INTO route(route_type,route_date_leaving,route_date_arrival)
VALUES ('ж/д рейс','01.08.2019','11.08.2019')
INSERT INTO route(route_type,route_date_leaving,route_date_arrival)
VALUES ('ж/д рейс','01.08.2019','11.08.2019')
INSERT INTO route(route_date_leaving,route_date_arrival)
VALUES ('01.08.2019','11.08.2019')
INSERT INTO country(country_code,country_name,country_city,country_hotel_addr)
VALUES (032,'Аргентина','Буэнос-Айрес','Av Macacha Guemes 351')
INSERT INTO country(country_code,country_name,country_city,country_hotel_addr)
VALUES (032,'Аргентина','БуэносАйрес','San Martin 1275')
INSERT INTO country(country_code,country_name,country_city,country_hotel_addr)
VALUES (044,'Багамы','Нассау','1 Casino Drive 1')
INSERT INTO country(country_code,country_name,country_city,country_hotel_addr)
VALUES (056,'Бельгия','Брюссель','Rue Royale 120')
INSERT INTO country(country_code,country_name,country_city,country_hotel_addr)
VALUES (056,'Бельгия','Брюссель','Rue Joseph II 32')
INSERT INTO country(country_code,country_name,country_city,country_hotel_addr)
VALUES (076,'Бразилия','Бразилия','Kapucijnenstraat 52')
INSERT INTO country(country_code,country_name,country_city,country_hotel_addr)
VALUES (818,'Египет','Каир','3 Sphinx Street, Giza')
INSERT INTO country(country_code,country_name,country_city,country_hotel_addr)
VALUES (356,'Индия','Хинди','Ti Guemes 37')
INSERT INTO country(country_code,country_name,country_city,country_hotel_addr)
VALUES (724,'Испания','Мадрид','Al Muches 891')
INSERT INTO country(country_code,country_name,country_city,country_hotel_addr)
VALUES (440,'Литва','Вильнюс','Gairemess 8')
INSERT INTO tour(route_num, country_num)
VALUES (1,2)
INSERT INTO tour(route_num, country_num)
VALUES (1,1)
INSERT INTO tour(route_num, country_num)
VALUES (2,3)
INSERT INTO tour(route_num, country_num)
VALUES (3,5)
INSERT INTO tour(route_num, country_num)
VALUES (6,7)
INSERT INTO tour(route_num, country_num)
VALUES (1,3)
INSERT INTO tour(route_num, country_num)
VALUES (3,9)
INSERT INTO tour(route_num, country_num)
VALUES (10,2)
INSERT INTO tour(route_num, country_num)
VALUES (4,4)
INSERT INTO tour(route_num, country_num)
VALUES (7,1)
INSERT INTO contract(contract_cost,client_num,staff_num,tour_num)
VALUES(12312,1,3,2)
INSERT INTO contract(contract_cost,client_num,staff_num,tour_num)
VALUES(43244,2,3,4)
INSERT INTO contract(contract_cost,client_num,staff_num,tour_num)
VALUES(32424,5,2,10)
INSERT INTO contract(contract_cost,client_num,staff_num,tour_num)
VALUES(9354,9,1,3)
INSERT INTO contract(contract_cost,client_num,staff_num,tour_num)
VALUES(23455,3,1,9)
INSERT INTO contract(contract_cost,client_num,staff_num,tour_num)
VALUES(11335,7,7,7)
INSERT INTO contract(contract_cost,client_num,staff_num,tour_num)
VALUES(96532,2,3,1)
INSERT INTO contract(contract_cost,client_num,staff_num,tour_num)
VALUES(12345,9,9,1)
INSERT INTO contract(contract_cost,client_num,staff_num,tour_num)
VALUES(113043,1,1,2)
INSERT INTO contract(contract_cost,client_num,staff_num,tour_num)
VALUES(69105,9,1,1)

select *
from tour
join route
ON tour.tour_num=route.route_num
join country
ON tour.country_num=country.country_num
order by tour.route_num

select route_type, count (route_type) 'Количество' from route
group by route_type

select tour_num, country_name from tour 
join country on tour.country_num=country.country_num

select client_lname, client_name, client_mname, min(contract_cost) as 'Стоимость'
from contract
join client on contract.client_num=client.client_num
Group by client_lname, client_name, client_mname
HAVING min(contract_cost)>30000

select min(contract_cost) as 'Минимальная стоимость тура'
from contract

select max(contract_cost) as 'Максимальная стоимость тура'
from contract

select avg(contract_cost) as 'Средняя стоимость тура'
from contract

select sum(contract_cost) as 'Общая стоимость тура'
from contract

select count(contract_num) as 'Количество договоров'
from contract

select country_name, country_city, country_hotel_addr
from country

select country_name, country_city, country_hotel_addr
from country
where country_name <> 'Египет'

select country_name, country_city, country_hotel_addr
from country
where country_hotel_addr Like '%351'

select country_name, country_city, country_hotel_addr
from country
where country_hotel_addr NOT Like '%Casino%'

select c.client_name, r.route_date_leaving
from client c 
inner join contract ca
on c.client_num=contract_num
inner join tour t
on ca.tour_num=t.tour_num
inner join  route r
on t.route_num=r.route_num
where client_name = 'Артем'

select staff_lname, staff_name,staff_mname, contract_num,contract_cost,client_num,tour_num
from staff
inner join contract
on staff.staff_num=contract.staff_num
where staff_name = 'Семен' and staff_mname='Мартьянович'

select country_name, country_city, country_hotel_addr
from country
where country_city='Брюссель'

select client_name,client_pasport,route_type
from client 
inner join contract 
on client.client_num=contract.contract_num
inner join tour 
on contract.tour_num=tour.tour_num
inner join  route 
on tour.route_num=route.route_num
where route_type='авиаперелет'

select client_name,client_name,client_mname,client_phone, route_date_leaving
from client 
inner join contract 
on client.client_num=contract.contract_num
inner join tour 
on contract.tour_num=tour.tour_num
inner join  route 
on tour.route_num=route.route_num
where route_date_leaving between '2018-01-01' and '2018-01-05'

select staff_name, staff_phone
from staff
where staff_name = 'Вероника'

CREATE VIEW CLIENT_STAFF
AS
SELECT contract_num,client_lname,client_name,client_mname,client_phone,staff.* 
FROM contract join staff
ON contract.staff_num=staff.staff_num
Join client
ON contract.client_num=client.client_num  

CREATE VIEW TOURS_FOR_MONTH
AS
SELECT client_lname,client_name,client_mname,client_phone,contract.tour_num,route_type, country_name,country_city,country_hotel_addr,route_date_leaving,route_date_arrival
FROM contract join tour
ON contract.tour_num=tour.tour_num
JOIN route 
ON tour.route_num=route.route_num
join client
ON contract.client_num=client.client_num
JOIN country
ON tour.country_num=country.country_num
WHERE route_date_leaving BETWEEN GETDATE() and GETDATE()+30

CREATE  VIEW CLIENT_COST
AS
SELECT contract_num,client_lname,client_name,client_mname,client_phone,client_pasport,contract_cost 
FROM contract join client
ON contract.client_num=client.client_num 

CREATE VIEW CLIENT_INFO_TOUR
AS
SELECT client_lname,client_name,client_mname,client_phone,contract.tour_num,route_type, country_name,country_city,country_hotel_addr,route_date_leaving,route_date_arrival
FROM contract join tour
ON contract.tour_num=tour.tour_num
JOIN route

CREATE PROC TOUR_COUNTRY
 @country varchar(30)
AS
 SELECT client_lname,client_name,client_mname,client_phone,contract.tour_num,route_type, country_name,country_city,country_hotel_addr,route_date_leaving,route_date_arrival 
 FROM contract join tour
 ON contract.tour_num=tour.tour_num
 JOIN route 
 ON tour.route_num=route.route_num
 join client
 ON contract.client_num=client.client_num
 JOIN country
 ON tour.country_num=country.country_num
 WHERE country_name = @country
Исполнение процедуры:
EXEC TOUR_COUNTRY 'Бельгия'

CREATE PROC RICH_CLIENT
 @max money output
 AS
 set @max = ( SELECT MAX(contract_cost) FROM contract)
Исполнение процедуры:
declare @m money	
exec RICH_CLIENT @m output
select client_lname,client_name,client_mname, @m as 'Стоимость тура' ,client_phone,contract.tour_num,route_type, country_name,country_city,country_hotel_addr,route_date_leaving,route_date_arrival 
 FROM contract join tour
 ON contract.tour_num=tour.tour_num
 JOIN route 
 ON tour.route_num=route.route_num
 join client
 ON contract.client_num=client.client_num
 JOIN country
 ON tour.country_num=country.country_num
WHERE contract.contract_cost = @m

CREATE TRIGGER DONTTOUCH
ON contract 
INSTEAD OF DELETE
AS
PRINT 'Удаление не возможно'

INSTEAD OF INSERT
AS
DECLARE @PRICE MONEY, @CL_NUM NUMERIC, @S_NUM NUMERIC, @T_NUM NUMERIC
SET @PRICE = (SELECT contract_cost FROM inserted)
SET @CL_NUM = (SELECT client_num FROM inserted)
SET @S_NUM = (SELECT staff_num FROM inserted)
SET @T_NUM = (SELECT tour_num FROM inserted)
INSERT INTO contract(contract_cost,client_num,staff_num,tour_num)
VALUES(@PRICE*0.9, @CL_NUM, @S_NUM, @T_NUM)
SELECT @PRICE*0.9 as 'contract_num', client_num, staff_num, tour_num
FROM inserted
Вводим следующую команду:
INSERT INTO contract(contract_cost,client_num,staff_num,tour_num)
VALUES(50000,8,3,1)

CREATE TRIGGER CHECK_SALES
ON contract
AFTER INSERT
AS
IF OBJECT_ID ('SALES','TR') IS NOT NULL
PRINT 'Данные добавлены с учетом скидки 10%'
ELSE
SELECT * FROM inserted
Проверим работу триггера, при наличии триггера который предоставляет скидку:
INSERT INTO contract(contract_cost,client_num,staff_num,tour_num)
VALUES(25000,3,1,3)
