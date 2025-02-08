


CREATE DATABASE HomeSync;
USE HomeSync;



CREATE TABLE Room(
	room_id INT IDENTITY,
	type VARCHAR(15),
	floor INT,
	status VARCHAR(15),
	PRIMARY KEY(room_id)
)



CREATE TABLE Users(
	id INT IDENTITY,
	f_name VARCHAR(20),
	l_name VARCHAR(20),
	password VARCHAR(10),
	email VARCHAR(50) UNIQUE,
	preference VARCHAR(20),
	room INT,
	type VARCHAR(20),
	birth_date DATETIME, 
	age AS (YEAR(CURRENT_TIMESTAMP)- YEAR(birth_date)),
	PRIMARY KEY(id),
	FOREIGN KEY(room) REFERENCES Room(room_id) 

)

CREATE TABLE Admin(
	admin_id INT,
	no_of_guests_allowed INT,
	salary DECIMAL(10,2),
	PRIMARY KEY(admin_id),
	FOREIGN KEY(admin_id) REFERENCES Users(id) 

)

CREATE TABLE Guest(
	
	guest_id INT,
	guest_of INT,
	address VARCHAR(20),
	arrival_date DATETIME,
	departure_date DATETIME,
	residential VARCHAR(20)
	PRIMARY KEY(guest_id),
	FOREIGN KEY(guest_id) REFERENCES Users(id),
	FOREIGN KEY(guest_of) REFERENCES Users(id)

)

CREATE TABLE Task(
	task_id INT IDENTITY,
	name VARCHAR(30),
	creation_date DATETIME,
	due_date DATETIME,
	category VARCHAR(30),
	creator INT,
	status VARCHAR(15),
	reminder_date DATETIME,
	priority VARCHAR(15),
	PRIMARY KEY(Task_id),
	FOREIGN KEY(creator) REFERENCES Admin(admin_id)

)

CREATE TABLE Assigned_to(
	admin_id INT,
	task_id INT,
	user_id INT,
	PRIMARY KEY(admin_id,task_id,user_id),
	FOREIGN KEY(admin_id) REFERENCES Admin(admin_id),
	FOREIGN KEY(task_id) REFERENCES Task(task_id),
	FOREIGN KEY(user_id) REFERENCES Users(id)


)
CREATE TABLE Calendar(
	event_id INT IDENTITY,
	user_assigned_to INT,
	name VARCHAR(20),
	description VARCHAR(100),
	location VARCHAR(30),
	reminder_date DATETIME
	PRIMARY KEY(event_id,user_assigned_to),
	FOREIGN KEY(user_assigned_to) REFERENCES Users(id)

	)

CREATE TABLE Notes(
	id INT IDENTITY,
	user_id INT,
	content VARCHAR(200),
	creation_date DATETIME,
	title VARCHAR(25),
	PRIMARY KEY(id),
	FOREIGN KEY(user_id) REFERENCES Users(id)

)

CREATE TABLE Travel(
	trip_no INT IDENTITY,
	hotel_name VARCHAR(20),
	destination VARCHAR(20),
	ingoing_flight_num INT,
	outgoing_flight_num INT,
	ingoing_flight_date DATETIME,
	outgoing_flight_date DATETIME,
	ingoing_flight_airport VARCHAR(25),
	outgoing_flight_airport VARCHAR(25),
	transport VARCHAR(20),
	PRIMARY KEY(trip_no)

)

CREATE TABLE User_trip(
	trip_no	INT,
	user_id INT,
	hotel_room_no INT,
	in_going_flight_seat_number INT, 
	out_going_flight_seat_number INT,
	PRIMARY KEY(trip_no,user_id),
	FOREIGN KEY(trip_no) REFERENCES Travel(trip_no),
	FOREIGN KEY(user_id) REFERENCES Users(id)
	

	)

CREATE TABLE Finance(
	payment_id INT IDENTITY,
	user_id INT,
	type VARCHAR(15),
	amount DECIMAL(10,2),
	currency VARCHAR(15),	
	method VARCHAR(20),
	status VARCHAR(15)	, 
	date DATETIME,
	receipt_no INT	, 
	deadline DATETIME,	
	penalty	DECIMAL(10,2),
	PRIMARY KEY(payment_id),
	FOREIGN KEY(user_id) REFERENCES Users(id)


)
CREATE TABLE Health(
	date DATETIME, 
	activity VARCHAR(25), 
	user_id	INT, 
	hours_slept INT	, 
	food VARCHAR(25)
	PRIMARY KEY(date,activity),
	FOREIGN KEY(user_id) REFERENCES Users(id)	

	)

CREATE TABLE Communication(
	message_id INT IDENTITY, 
	sender_id INT,
	receiver_id INT, 
	content VARCHAR(200),
	time_sent DATETIME, 
	time_received DATETIME, 
	time_read DATETIME, 
	title VARCHAR(25) 
	PRIMARY KEY(message_id),
	FOREIGN KEY(sender_id) REFERENCES Users(id),
	FOREIGN KEY(receiver_id) REFERENCES Users(id)	
	)

CREATE TABLE Device(
	device_id INT IDENTITY, 
	room INT ,
	type VARCHAR(15),
	status VARCHAR(15),
	battery_status INT,
	PRIMARY KEY(device_id),
	FOREIGN KEY(room) REFERENCES Room(room_id)

)
CREATE TABLE RoomSchedule(
	creator_id INT, 
	action VARCHAR(20), 
	room INT,
	start_time DATETIME,
	end_time DATETIME,
	PRIMARY kEY(creator_id,start_time),
	FOREIGN KEY(creator_id) REFERENCES Users(id),
	FOREIGN KEY(room) REFERENCES Room(room_id)


)
CREATE TABLE Log(
	room_id	INT, 
	device_id INT, 
	user_id INT, 
	activity VARCHAR(25),
	date DATETIME, 
	duration INT,
	PRIMARY KEY(room_id, device_id, user_id, date),
	FOREIGN KEY(room_id) REFERENCES Room(room_id),
	FOREIGN KEY(device_id) REFERENCES Device(device_id),
	FOREIGN KEY(user_id) REFERENCES Users(id)	
	


)
CREATE TABLE Consumption (
    device_id INT,
    consumption INT,
    date DATETIME,
    PRIMARY KEY (device_id, date),
    FOREIGN KEY (device_id) REFERENCES Device(device_id)
)

CREATE TABLE Preferences (
    user_id INT,
    category VARCHAR(20),
    preference_no INT,
    content VARCHAR(200),
    PRIMARY KEY(user_id, preference_no),
    FOREIGN KEY(user_id) REFERENCES Users(id)
)


CREATE TABLE Recommendation (
    recommendation_id INT PRIMARY KEY IDENTITY ,
    user_id INT,
    category VARCHAR(20),
    preference_no INT,
    content VARCHAR(200),
	FOREIGN KEY(user_id, preference_no) REFERENCES Preferences(user_id, preference_no),
)

CREATE TABLE Inventory (
    supply_id INT IDENTITY,
    name VARCHAR(15),
    quantity INT,
    expiry_date DATE,
    price DECIMAL(10, 2),
    manufacturer VARCHAR(25),
    category VARCHAR(20),
	PRIMARY KEY(supply_id)
)
CREATE TABLE Camera (
    monitor_id INT ,
    camera_id INT,
    room INT,
	PRIMARY KEY(monitor_id),
    FOREIGN KEY (monitor_id) REFERENCES Users(id),
    FOREIGN KEY (room) REFERENCES Room(room_id)
)


