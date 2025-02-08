INSERT INTO Room(type, floor,status) VALUES ('bedroom',2,'occupied')
INSERT INTO Room(type, floor,status) VALUES ('living room',1,'occupied')
INSERT INTO Room(type, floor,status) VALUES ('bedroom',3,'empty')
INSERT INTO Room(type, floor,status) VALUES ('bedroom',2,'empty')
INSERT INTO Room(type, floor,status) VALUES ('garden',1,'empty')
INSERT INTO Room(type, floor,status) VALUES ('kitchen',1,'empty')
INSERT INTO Room(type, floor,status) VALUES ('bedroom',3,'occupied')
INSERT INTO Room(type, floor,status) VALUES ('bedroom',2,'occupied')


INSERT INTO Users(f_name,l_name,password,email,preference,room,type,birth_date)
VALUES ('Mohamed','Hassan','123123','mohamedh21@gmail.com',NULL,1,'Admin','12/5/1999')
INSERT INTO Users(f_name,l_name,password,email,preference,room,type,birth_date)
VALUES ('Ayman','Mohsen','124124','aymanmoh@gmail.com',NULL,2,'Guest','3/6/2000')
INSERT INTO Users(f_name,l_name,password,email,preference,room,type,birth_date)
VALUES ('Ahmed','Raouf','134524','oufaa@gmail.com',NULL,2,'Guest','3/6/2000')
INSERT INTO Users(f_name,l_name,password,email,preference,room,type,birth_date)
VALUES ('Mahomoud','Alaa','131522','houda@gmail.com',NULL,2,'Guest','2/9/2001')
INSERT INTO Users(f_name,l_name,password,email,preference,room,type,birth_date)
VALUES ('Ahmed','Shafik','132472','ashafikk@gmail.com',NULL,3,'Admin','2/9/2001')
INSERT INTO Users(f_name,l_name,password,email,preference,room,type,birth_date)
VALUES ('Nour','Sherif','121722','noursherif@gmail.com',NULL,2,'Guest','9/2/2002')
INSERT INTO Users(f_name,l_name,password,email,preference,room,type,birth_date)
VALUES ('Amr','Hany','141422','amrhanyy@gmail.com',NULL,7,'Admin','2/7/1998')
INSERT INTO Users(f_name,l_name,password,email,preference,room,type,birth_date)
VALUES ('Ali','Walid','121222','aliwalid@gmail.com',NULL,8,'Admin','10/11/1998')
INSERT INTO Users(f_name,l_name,password,email,preference,room,type,birth_date)
VALUES ('Gamal','Ashraf','121723','gamalashraf@gmail.com',NULL,1,'Guest','9/4/2000')
INSERT INTO Users(f_name,l_name,password,email,preference,room,type,birth_date)
VALUES ('Mohamed','Mansour','131323','mans1997@gmail.com',NULL,1,'Admin','1/11/1997')

INSERT INTO Admin VALUES (1,3,120000.64)
INSERT INTO Admin VALUES (5,2,500000)
INSERT INTO Admin VALUES (7,4,750000.25)
INSERT INTO Admin VALUES (8,6,1000000)
INSERT INTO Admin VALUES (10,1,330000.50)

INSERT INTO Guest VALUES(2,1,'New Cairo','12/1/2022','1/1/2023',NULL)
INSERT INTO Guest VALUES(3,7,'Heliopolis','12/30/2022','1/16/2023',NULL)
INSERT INTO Guest VALUES(4,5,'Sheikh Zayed','11/28/2022','1/9/2023',NULL)
INSERT INTO Guest VALUES(6,7,'Obour','12/20/2022','2/2/2023',NULL)
INSERT INTO Guest VALUES(9,10,'Mokattam','11/2/2022','1/5/2023',NULL)





INSERT INTO Device(room,type,status,battery_status) VALUES (2,'TV','active','100')
INSERT INTO Device(room,type,status,battery_status) VALUES (6,'Microwave','active','100')
INSERT INTO Device(room,type,status,battery_status) VALUES (1,'iPad','inactive','24')
INSERT INTO Device(room,type,status,battery_status) VALUES (3,'iPhone','inactive','88')
INSERT INTO Device(room,type,status,battery_status) VALUES (7,'Air Conditioner','inactive','100')



INSERT INTO Calendar(user_assigned_to,name,description,location,reminder_date)
VALUES (1,'party','New Years Party','Sheikh Zayed','12/30/2023')
INSERT INTO Calendar(user_assigned_to,name,description,location,reminder_date)
VALUES (5,'business meeting','meeting with the employees','Maadi','9/10/2024')
INSERT INTO Calendar(user_assigned_to,name,description,location,reminder_date)
VALUES (7,'Graduation','Graduation Ceremony','New Cairo','8/17/2024')

INSERT INTO Task(name,creation_date,due_date,category,creator,status, reminder_date,priority)
VALUES('assignment','10/26/2023','11/8/2023','University', 1,'active','11/5/2023','low')
INSERT INTO Task(name,creation_date,due_date,category,creator,status, reminder_date,priority)
VALUES('Bug fixing','11/21/2023','1/1/2024','Corporate', 8,'done','11/5/2023','high')
INSERT INTO Task(name,creation_date,due_date,category,creator,status, reminder_date,priority)
VALUES('report analysis','11/17/2023','1/13/2024','Corporate', 5,'active' ,'11/5/2023','low')
INSERT INTO Task(name,creation_date,due_date,category,creator,status, reminder_date,priority)
VALUES('Campaign Launch','11/24/2023','1/20/2024','Marketing', 7,'active' ,'1/17/2024','high')
INSERT INTO Task(name,creation_date,due_date,category,creator,status, reminder_date,priority)
VALUES('Project Proposal','11/29/2023','1/28/2024','Project Management', 10,'active' ,'1/13/2024','high')
INSERT INTO Task(name,creation_date,due_date,category,creator,status, reminder_date,priority)
VALUES('Security Audit','11/30/2023','1/30/2024','Security', 10,'active' ,'1/14/2024','high')

INSERT INTO Assigned_to VALUES(1,1,2)
INSERT INTO Assigned_to VALUES(8,2,6)
INSERT INTO Assigned_to VALUES(5,3,4)
INSERT INTO Assigned_to VALUES(7,4,6)
INSERT INTO Assigned_to VALUES(10,5,6)


INSERT INTO Calendar(user_assigned_to,name,description,location,reminder_date) 
VALUES(2,'Piano','Formal Event','New cairo city','5/4/2024') 
INSERT INTO Calendar(user_assigned_to,name,description,location,reminder_date)
VALUES(4,'Pshyc','Party','Zamalek','12/14/2023')
INSERT INTO Calendar(user_assigned_to,name,description,location,reminder_date)
VALUES(2,'Psyhc','Party','Zamalek','12/14/2023')
INSERT INTO Calendar(user_assigned_to,name,description,location,reminder_date)
VALUES(9,'EBIS','Prom','Maadi','8/12/2024')

INSERT INTO Recommendation VALUES(4,'trips',NULL,'Bad')
INSERT INTO Recommendation VALUES(3,'Log',NULL,'GOOD')
INSERT INTO Recommendation VALUES(7,'Camera',NULL,'Execllent')
INSERT INTO Recommendation VALUES(9,'bill payments',NULL,'very bad')

INSERT INTO Finance (user_id,type,amount,status,deadline)
VALUES(2,'INGOING',4000.50,'PENDING','09/09/2023')
INSERT INTO Finance(user_id,type,amount,status,deadline)
VALUES(4,'OUTGOING',65321.50,'APPROVED','02/10/2023')
INSERT INTO Finance(user_id,type,amount,status,deadline)
VALUES(5,'INGOING',204.55,'PENDING','08/04/2023')


INSERT INTO Communication(sender_id,receiver_id,content,time_sent,time_received,time_read,title)
VALUES(2,5,'HELLO','17:00:00','17:00:20','17:01:00','GOOD MORNING')
INSERT INTO Communication(sender_id,receiver_id,content,time_sent,time_received,time_read,title)
VALUES(5,2,'HI','17:01:00','17:01:02','17:01:06','GOOD MORNING')
INSERT INTO Communication(sender_id,receiver_id,content,time_sent,time_received,time_read,title)
VALUES(2,5,'HOW ARE YOU','17:01:15','17:01:20','17:01:22','HOW ARE YOU')
INSERT INTO Communication(sender_id,receiver_id,content,time_sent,time_received,time_read,title)
VALUES(5,2,'ALL GOOD WHAT ABOUT YOU','17:01:25','17:01:28','17:01:32','ALL GOOD WHAT ABOUT YOU')
INSERT INTO Communication(sender_id,receiver_id,content,time_sent,time_received,time_read,title)
VALUES(2,5,'WELL I WANTED TO CHECK ON YOU','17:01:035','17:02:00','17:02:04','CHECKING')
INSERT INTO Communication(sender_id,receiver_id,content,time_sent,time_received,time_read,title)
VALUES(5,2,'THANK YOU','17:02:05','17:02:10','17:02:20','THANK YOU')

INSERT INTO Notes VALUES(1,'HOW TO WRITE A POEM' ,'05/05/2023','ROMANCE')
INSERT INTO Notes VALUES(3,'WHAT DID MY PARENTS GET ME IN MY BIRTHDAY' ,'07/02/2023','MY BIRTHDAY')
INSERT INTO Notes VALUES(5,'HOW DID IT GO' ,'08/09/2023','PROM')

INSERT INTO RoomSchedule VALUES(3,'Gaming',2,'14:00:00','15:00:00')
INSERT INTO RoomSchedule VALUES(4,'WORKING ROOM',3,'15:00:00','16:00:00')
INSERT INTO RoomSchedule VALUES(3,'CAFE',4,'16:00:00','17:00:00')

INSERT INTO Travel (hotel_name, destination, ingoing_flight_num, outgoing_flight_num, ingoing_flight_date, outgoing_flight_date, ingoing_flight_airport, outgoing_flight_airport, transport)
VALUES ('Hotel A', 'Beach', 1234, 5678, '2023-12-20', '2023-12-28', 'Airport A', 'Airport B', 'Airplane');
INSERT INTO Travel (hotel_name, destination, ingoing_flight_num, outgoing_flight_num, ingoing_flight_date, outgoing_flight_date, ingoing_flight_airport, outgoing_flight_airport, transport)
VALUES ('Resort X', 'Mountain', 4321, 8765, '2023-12-15', '2023-12-25', 'Airport C', 'Airport D', 'Airplane');


INSERT INTO Log (room_id, device_id, user_id, activity, date, duration) VALUES (2, 1, 1, 'Using Tablet', '2023-11-30 04:00:00', 0);
INSERT INTO Log (room_id, device_id, user_id, activity, date, duration) VALUES (6, 2, 4, 'Using Tablet', '2023-11-22 09:20:00', 0);
INSERT INTO Log (room_id, device_id, user_id, activity, date, duration) VALUES (1, 3, 5, 'Using Tablet', '2023-10-20 09:50:00', 0);
INSERT INTO Log (room_id, device_id, user_id, activity, date, duration) VALUES (3, 4, 7, 'Using Tablet', '2023-12-10 07:30:00', 0);
INSERT INTO Log (room_id, device_id, user_id, activity, date, duration) VALUES (7, 5, 3, 'Using Tablet', '2023-12-10 07:20:00', 1);

SET IDENTITY_INSERT Inventory ON;
INSERT INTO Inventory(supply_id,name,quantity,expiry_date,price,manufacturer,category) VALUES (9,'back Inventory',4,'9/10/2024',2000,'sweedy','electricity')
INSERT INTO Inventory(supply_id,name,quantity,expiry_date,price,manufacturer,category) VALUES (3,'front Inventory',3,'9/10/2025',2000,'oamr','cars')
INSERT INTO Inventory(supply_id,name,quantity,expiry_date,price,manufacturer,category) VALUES (2,'lab Inventory',6,'9/11/2026',2000,'ahmed','trains')
INSERT INTO Inventory(supply_id,name,quantity,expiry_date,price,manufacturer,category) VALUES (1,'giu Inventory',8,'10/10/2024',2000,'hamza','food')
INSERT INTO Inventory(supply_id,name,quantity,expiry_date,price,manufacturer,category) VALUES (66,'auc Inventory',3,'10/10/2026',5000,'youssef','food')

INSERT INTO Preferences (user_id, category, preference_no, content)
VALUES
    (1, 'Room temperature', 1, '25'), 
    (2, 'Room temperature', 1, '27'), 
    (3, 'Room temperature', 1, '28'), 
    (4, 'Room temperature', 1, '29'), 
    (5, 'Room temperature', 1, '26');

INSERT INTO Consumption (device_id, consumption, date)
VALUES 
    (1, 50, '2023-11-01 08:00:00'),
    (2, 75, '2023-11-01 12:00:00'),
    (1, 40, '2023-11-02 09:30:00'),
    (3, 60, '2023-11-02 14:45:00');

INSERT INTO Users(f_name,l_name,password,email,preference,room,type,birth_date)
VALUES ('omar','Mansour','131323','omar@gmail.com',NULL,1,'Admin','1/11/1960')


INSERT INTO Device ( type, status, room)
VALUES 
    ( 'Tablet', 'Active', 1), 
    ( 'Phone', 'Inactive', 2), 
    ( 'Laptop', 'Active', 1);

INSERT INTO Users Values ('Abdallah' , 'Ashraf' , '123159' , 'abdabd@gmail.com' , NULL , NULL , 'Admin' , '5/5/2002')

INSERT INTO Travel(outgoing_flight_num,outgoing_flight_date,destination) 
VALUES(20,'9/2/2023','NEW YORK')
INSERT INTO Travel(outgoing_flight_num,outgoing_flight_date,destination) 
VALUES(21,'6/6/2023','CUBA')
INSERT INTO Travel(outgoing_flight_num,outgoing_flight_date,destination) 
VALUES(23,'12/10/2023','CAIRO')

INSERT INTO Travel VALues('Mariott','Cairo',25,26,'2023-01-02 16:00:00.000','2023-01-02 17:00:00.000','Paris','CAIRO','Airplane')
INSERT INTO Travel VALues('La defense','Paris',27,28,'2023-01-05 21:00:00.000','2023-01-04 19:00:00.000','CAIRO','Paris','Airplane')
INSERT INTO Travel VALues('NOVOTEL','DUBAI',29,30,'2023-01-08 11:00:00.000','2023-01-08 10:00:00.000','NEW YORK','DUBAI','Airplane')
INSERT INTO Travel VALues('Hitlon','Rome',31,32,'2023-01-10 16:00:00.000','2023-01-09 19:00:00.000','BERLIN','ROME','Airplane')

INSERT INTO Device(room,type,status,battery_status) VALUES (7,'Ps Controller','active','100')
INSERT INTO Device(room,type,status,battery_status) VALUES (5,'iPhone','active','100')
INSERT INTO Device(room,type,status,battery_status) VALUES (3,'Remote','active','0')
INSERT INTO Device(room,type,status,battery_status) VALUES (4,'Sound bar','active','0')


insert INTO Device(room,type,status,battery_status) VALUES (8,'Air Conditioner','Dead Battery','0')
INSERT INTO Device(room,type,status,battery_status) VALUES (8,'tablet','Dead Battery','0')
INSERT INTO Device(room,type,status,battery_status) VALUES (8,'phone','Dead Battery','0')
INSERT INTO Users(f_name,l_name,password,email,preference,room,type,birth_date)
VALUES ('karim','Hany','165487','karimhany@gmail.com',NULL,7,'Guest','2/7/1998')
INSERT INTO Users(f_name,l_name,password,email,preference,room,type,birth_date)
VALUES ('karim','mahmoud','154832','karimmahmoud@gmail.com',NULL,7,'Guest','2/8/2005')
INSERT INTO Users(f_name,l_name,password,email,preference,room,type,birth_date)
VALUES ('alaa','mahmoud','154232','alaa@gmail.com',NULL,7,'Guest','2/8/2005')

INSERT INTO Guest VALUES(14,7,'Heliopolis','12/2/2022','1/16/2023',NULL)
INSERT INTO Guest VALUES(15,7,'Sheikh Zayed','11/28/2022','1/9/2023',NULL)


