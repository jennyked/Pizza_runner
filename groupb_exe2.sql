--1 Add the unitcost column to the product table and insert into the unit_cost, 95% of the unit_price
Select * from products;
Alter table products
add column unit_cost decimal(5,2);

UPDATE products
SET unit_cost = unit_price * 0.95;

--2 Find the highest and lowest priced products along with their prices
Select product_name, max(unit_price) as highest_price
from products
group by product_name
order by highest_price desc
Limit 1;

Select product_name, min(unit_price) as lowest_price
from products
group by product_name
order by lowest_price asc
Limit 1;

--3 Find the total number of orders in each month in year 2022
Select * from orders;
SELECT EXTRACT(MONTH FROM order_date) AS order_month, COUNT(*) AS no_of_orders
FROM orders
WHERE EXTRACT(YEAR FROM order_date) = 2022
GROUP BY order_month;

SELECT to_char(order_date, 'Month') AS order_month, COUNT(*) AS no_of_orders
FROM orders
WHERE EXTRACT(YEAR FROM order_date) = 2022
GROUP BY order_month
order by no_of_orders desc;


--3a) Find the total number of orders in each month by year
SELECT EXTRACT(YEAR FROM order_date) AS order_year, COUNT(*) AS no_of_orders
FROM orders
GROUP BY order_year 
ORDER BY no_of_orders desc;

--4 count the number of payments made on April 14, 2023
Select * from payments;
Update payments
Set payment_date = '2023-04-14'
where payment_id = 2;

Select count(*)
from payments 
where payment_date = '2023-04-14';

---5 Which customer_id had the higest orders placed in the order table
select * from orders;
Select customer_id, count(*) as max_orders
from orders
group by customer_id
order by max_orders desc
limit 1;


--7 what is the total number of orders made by each customer_id
Select customer_id, count(*) as nom_of_orders
from orders
group by customer_id
order by nom_of_orders desc;

--8 How many orders were delivered between Jan and Feb 2023
select * from orders;

SELECT count(*) AS total_quantity
FROM orders
WHERE order_date >= date '2023-01-01' AND order_date < date '2023-03-01';

SELECT count(*) AS total_quantity
FROM orders
WHERE order_date Between '2023-01-01' AND '2023-03-01';


-----Add a Credit card table and populate the table
create table credit_card (
	Bank_id INT Primary key,
	customer_id INT,
	card_expiry_date DATE,
	bank_name VARCHAR(8),
	card_number VARCHAR(50), 
    Foreign key (customer_id) references customers(customer_id)
);

drop table credit_card;
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (1, 14, '2022-09-23', 'Diamond', 'AL29 7185 1129 2N0M YVMP BOHM HLIY');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (2, 44, '2023-01-20', 'Diamond', 'GT36 ZGUL V9FK 6O6P 1MNZ XUJG OJXF');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (3, 39, '2022-06-07', 'UBA', 'FR82 1783 9573 08YB VRYY DFKZ M42');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (4, 21, '2022-11-16', 'Diamond', 'BE09 8767 9319 5025');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (5, 32, '2023-01-23', 'Zenith', 'HU63 2448 6669 5508 6504 9605 6489');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (6, 10, '2024-05-24', 'Polaris', 'CZ09 5036 0892 7929 2507 6652');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (7, 18, '2023-06-16', 'Diamond', 'KW24 RAFM NY6G 78HO IKKT KMIC ODZT O7');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (8, 12, '2023-06-03', 'GTB', 'KZ49 136C PPZP S4BS L84B');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (9, 8, '2022-10-06', 'Fidelity', 'CY07 5008 4574 NNTZ JLIO 31PY 8E2Y');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (10, 41, '2024-01-18', 'Polaris', 'AD28 1680 4583 6TQT ZC7I NKXK');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (11, 29, '2024-06-06', 'Zenith', 'IL06 9401 6316 8021 1969 194');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (12, 22, '2022-10-13', 'Fidelity', 'ME10 4783 3884 4042 5009 36');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (13, 48, '2023-05-02', 'Polaris', 'DK17 3892 1309 6750 00');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (14, 56, '2023-11-07', 'Union', 'LV87 NZQU UUEF FNGA X9RZ W');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (15, 30, '2022-03-24', 'Diamond', 'FR30 9001 6298 83OE GRHR E9FR C13');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (16, 68, '2024-02-25', 'Access', 'SM92 H173 8937 5935 0EGA DNJP 8GG');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (17, 8, '2023-03-11', 'GTB', 'LU59 961E F0WJ 84WL VPV1');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (18, 29, '2024-04-09', 'Fidelity', 'FR53 6009 2110 05FB AC3Z RLX9 O60');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (19, 35, '2022-03-18', 'OPay', 'FO40 2641 2557 4428 53');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (20, 27, '2023-03-12', 'GTB', 'FR81 5302 5400 54MQ 5JCH O7UQ T68');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (21, 18, '2023-07-29', 'Access', 'ME79 9040 2648 1215 0046 33');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (22, 66, '2022-01-13', 'GTB', 'LU36 408Q HIWR ZB1M 0CJG');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (23, 22, '2022-09-16', 'Fidelity', 'PL41 2857 6114 1748 1033 9652 9401');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (24, 21, '2022-08-09', 'Diamond', 'NL60 SSDW 5746 5455 75');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (25, 66, '2023-12-16', 'UBA', 'KZ31 763O X810 TYE5 OIUI');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (26, 2, '2023-05-30', 'GTB', 'SE34 1736 8348 6768 8306 0517');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (27, 5, '2023-11-15', 'Polaris', 'FR49 2476 5185 33IG ZHIY IYTS S68');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (28, 37, '2022-05-06', 'OPay', 'SI18 5193 0012 0205 541');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (29, 63, '2022-04-25', 'OPay', 'GL02 1218 7942 7434 53');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (30, 40, '2023-02-22', 'Polaris', 'GT59 R2KK SUR6 BOPT 3RSI W4BO MKEY');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (31, 41, '2022-09-12', 'Fidelity', 'FR78 4528 2249 70RP ADWB W1AZ U20');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (32, 21, '2023-06-23', 'Zenith', 'ES56 2664 7654 1510 1508 2217');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (33, 66, '2023-03-22', 'GTB', 'IT40 Q977 3425 651U 0CVF WKXV JSS');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (34, 62, '2023-02-23', 'Fidelity', 'ES37 8545 2383 0603 8427 3863');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (35, 20, '2022-11-17', 'GTB', 'MC84 7021 6508 762F DFKI DJJZ O71');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (36, 63, '2023-10-02', 'Union', 'BR28 3005 3087 1249 7852 2963 898G K');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (37, 30, '2022-07-03', 'Polaris', 'MD70 XZSF LZYB KU93 T2XB P3YB');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (38, 7, '2023-02-12', 'GTB', 'FR36 5757 1128 95IT WWSD DOS8 X89');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (39, 66, '2023-06-06', 'UBA', 'CH86 8137 4YKV BJGU 5L0N N');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (40, 30, '2024-03-21', 'GTB', 'FR14 9248 4124 34T6 PSZQ TPET K03');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (41, 6, '2022-01-17', 'Access', 'GB46 DVAA 9402 5462 9480 69');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (42, 30, '2024-03-28', 'OPay', 'HU06 1504 4938 9279 7640 0517 8449');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (43, 64, '2023-05-24', 'Polaris', 'BE73 3042 6188 5248');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (44, 28, '2023-08-29', 'GTB', 'MK60 233X JYXH UOTL C72');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (45, 11, '2023-07-30', 'GTB', 'LI29 8687 7WQR J264 JOLM 7');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (46, 35, '2023-12-23', 'Fidelity', 'SE98 7613 7999 0006 7453 7535');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (47, 59, '2024-01-12', 'Union', 'DE74 7092 6669 2143 4042 53');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (48, 63, '2023-07-19', 'Fidelity', 'AE93 0794 7726 9374 3922 414');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (49, 61, '2024-04-10', 'Polaris', 'FI22 5841 3836 2311 19');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (50, 66, '2023-05-28', 'GTB', 'MD59 KAXJ ZOMM CSTI W01Z WAGN');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (51, 65, '2023-05-10', 'Fidelity', 'CZ76 7836 6863 9253 4916 3443');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (52, 8, '2023-12-27', 'Diamond', 'FR34 9331 6397 96YT WQA6 NOAJ S58');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (53, 24, '2024-03-06', 'Fidelity', 'SE63 0651 1385 2366 1433 4678');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (54, 69, '2024-02-03', 'Fidelity', 'GL89 4179 0972 2375 20');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (55, 57, '2023-12-22', 'Fidelity', 'GI91 SDHH 9UEE BOHZ MGC7 TFV');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (56, 51, '2024-04-28', 'Union', 'MK90 573I 683I URQZ T57');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (57, 30, '2022-10-28', 'Access', 'AT88 4825 6011 3812 6762');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (58, 10, '2023-06-01', 'Union', 'FR37 0268 7671 64XW B8H3 TZYC X02');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (59, 60, '2023-04-11', 'Fidelity', 'BE09 3753 1282 5476');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (60, 54, '2023-03-21', 'Zenith', 'NO69 0455 3960 036');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (61, 51, '2023-02-09', 'Diamond', 'MD68 IWAR K83B 8HGD NJTB QWTA');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (62, 4, '2022-10-21', 'Union', 'FR23 0053 9652 35IA VCKC DNPM I92');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (63, 17, '2022-06-26', 'UBA', 'LV49 AJUS YFVZ C40V OBBS 7');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (64, 45, '2023-09-03', 'Fidelity', 'MD69 JHI7 A4XQ FCVM 4SOT GF42');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (65, 55, '2022-10-31', 'OPay', 'MC27 2331 5780 31PI MJIZ 3CRC C50');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (66, 25, '2023-10-24', 'Zenith', 'KZ33 978N LSQQ 8VD0 GJ7F');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (67, 50, '2024-04-28', 'Diamond', 'PT93 6834 5643 2712 7384 7861 2');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (68, 8, '2022-01-24', 'Access', 'HU56 1936 1598 7528 5742 7451 8313');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (69, 56, '2023-05-09', 'Fidelity', 'GR16 3149 505X OO2H R2TB YCTZ RNB');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (70, 40, '2022-08-22', 'Access', 'IS74 2871 9904 5211 8262 8292 56');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (71, 23, '2022-06-22', 'GTB', 'AE22 5163 7586 5345 5472 792');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (72, 4, '2022-12-17', 'Union', 'FR54 1600 1050 258D HR8O ECHD 699');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (73, 37, '2023-12-31', 'Diamond', 'IE77 RYZV 3375 9096 1062 58');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (74, 11, '2023-05-22', 'Access', 'AZ53 IYHW 7EAX MN5S BHS7 OPXP QEWI');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (75, 60, '2023-03-18', 'GTB', 'RO36 SHQA 2V9E DMWG 7SLC WQ4K');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (76, 14, '2022-04-28', 'Zenith', 'IT76 E548 3901 280Y RJ9K ZQ8F 7G9');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (77, 53, '2022-06-02', 'Zenith', 'FR88 6235 3280 78VQ P5FW PNPW C37');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (78, 36, '2023-04-30', 'Polaris', 'CZ62 0069 3276 1727 3813 1792');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (79, 25, '2024-02-17', 'OPay', 'GE98 EZ93 5974 9266 9827 52');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (80, 68, '2022-12-01', 'Access', 'KW28 QCRA X47P L6UA RAEA B13S TVRV 1G');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (81, 1, '2022-11-27', 'Access', 'FR79 7501 9770 80GV X9QB HJNN R96');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (82, 60, '2024-04-11', 'Zenith', 'CZ89 8994 6801 0757 7477 9395');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (83, 41, '2022-04-14', 'Diamond', 'GE39 QG01 3696 4542 7012 60');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (84, 38, '2023-12-20', 'Union', 'HU11 8505 4607 6957 2429 7506 0858');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (85, 62, '2024-01-30', 'Zenith', 'DO42 DCQW 8598 8171 0390 9341 8658');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (86, 42, '2023-06-15', 'Access', 'SA87 86Z8 SXZZ T9N2 1J9T FGFC');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (87, 18, '2022-03-02', 'Union', 'HR36 4301 8604 3215 1320 7');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (88, 3, '2022-09-19', 'OPay', 'FR55 1981 5038 30PT 9DE4 SKSC 714');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (89, 18, '2022-08-17', 'UBA', 'TR48 6275 25LR C77G XIEP CLUU KH');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (90, 9, '2023-09-29', 'GTB', 'FR87 7616 1268 83AH AJGR 2VLT H72');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (91, 17, '2022-03-07', 'Access', 'RO26 ICWJ N3XL UQPE VHAC 63FP');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (92, 60, '2022-10-19', 'Polaris', 'BE94 7277 9417 3702');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (93, 54, '2022-06-24', 'Zenith', 'PT61 5967 1362 2997 4097 9388 9');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (94, 33, '2023-01-27', 'GTB', 'PL78 2434 3504 2356 2004 0023 6772');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (95, 3, '2022-11-17', 'Access', 'MU98 AZDI 5603 4569 3408 7639 218K FL');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (96, 28, '2023-09-03', 'Polaris', 'HU94 5056 9088 8239 1634 9515 2190');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (97, 70, '2023-10-21', 'Access', 'MD44 ZN1X GQMR SYSR W8IJ DLPZ');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (98, 33, '2022-10-25', 'GTB', 'RS98 5466 9791 7801 8994 19');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (99, 47, '2023-04-25', 'Polaris', 'GI17 OMAX W27C M2EO TAFK YOH');
insert into credit_card (Bank_id, customer_id, card_expiry_date, bank_name, card_number) values (100, 10, '2022-08-14', 'GTB', 'CH85 4734 6YUD AND3 E2UT 9');



Select max(card_expiry_date) from credit_card;


-------retrieve all info for credit cards that are next to expire. 
SELECT bank_id, customer_id, card_expiry_date, bank_name, card_number
FROM credit_card
WHERE card_expiry_date > DATE(NOW())
ORDER BY card_expiry_date ASC;




-----how many credit cards that have expired
Select count(card_expiry_date) as Expired_cards
from credit_card
where card_expiry_date < DATE(NOW());














