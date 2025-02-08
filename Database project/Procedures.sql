--1 1) (Hamza Shafik)
CREATE PROC UserRegister

@usertype varchar(20),
@email varchar(50),
@first_name varchar(20),
@last_name varchar(20),
@birth_date datetime,
@password varchar(10),
@user_id int OUTPUT
AS
SET @usertype='Admin'
INSERT INTO Users(email,f_name,l_Name, type, birth_date, password)
VALUES (@email,@first_Name,@last_name,@usertype,@birth_date,@password)

SELECT @user_id=id
From Users 
WHERE @email =email

INSERT INTO Admin(admin_id,no_of_guests_allowed) VALUES(@user_id,30);
GO

--2 1) (Hamza Shafik)
CREATE PROC UserLogin(
@email VARCHAR(50),
@password VARCHAR(10),
@success BIT OUTPUT,
@user_id INT OUTPUT)
AS
BEGIN
SELECT @user_id = id
FROM Users
WHERE email = @email and password = @password
 IF (@user_id IS NOT NULL)
    BEGIN
        SET @success = 'True';
        
    END
    ELSE
    BEGIN
        
        SET @success = 'False';
        SET @user_id = -1;
    END

END;
GO

--2 2) (Hamza Shafik)
CREATE PROC ViewProfile
@user_id INT
AS
SELECT * 
FROM Users
WHERE id =@user_id;
GO
--2 3) (Hamza Shafik)
CREATE PROC ViewRooms
@age INT = NULL,
@user_id INT = NULL
AS
IF(@age = NULL AND @user_id =NULL)
BEGIN	
SELECT *
FROM Users U INNER JOIN Room R
ON U.room = R.room_id;
END
ELSE
BEGIN
IF(@age = NULL)
BEGIN
SELECT *
FROM Users U INNER JOIN Room R
ON U.room = R.room_id
WHERE @user_id = U.id;
END
ELSE
BEGIN
SELECT *
FROM Users U INNER JOIN Room R
ON U.room = R.room_id
WHERE @user_id = U.id
ORDER BY U.age ;

END
END

GO

--2 4) (Hamza Shafik)
CREATE PROC ViewMyTask
@user_id INT
AS

DECLARE @date DATETIME;
SELECT @date = due_date
FROM Task T INNER JOIN Assigned_to A ON T.creator = A.admin_id
WHERE A.user_id = @user_id AND T.task_id =A.task_id;

IF( @date < GETDATE())
BEGIN
	UPDATE Task
	SET status ='done'
	FROM Task T INNER JOIN Assigned_to A ON T.creator = A.admin_id
	WHERE A.user_id = @user_id AND T.task_id =A.task_id;

	SELECT *
	FROM Task T INNER JOIN Assigned_to A ON T.creator = A.admin_id
	WHERE A.user_id = @user_id AND T.task_id =A.task_id;
END
ELSE
BEGIN
	SELECT *
	FROM Task T INNER JOIN Assigned_to A ON T.creator = A.admin_id
	WHERE A.user_id = @user_id AND T.task_id =A.task_id;
END;
GO

--2 5) (Hamza Shafik)
CREATE PROC FinishMyTask 
@user_id INT,
@title VARCHAR(50) 
AS
UPDATE Task
SET status ='done'
FROM Task T INNER JOIN Assigned_to A ON T.creator = A.admin_id
WHERE A.user_id = @user_id AND T.name = @title;
GO

--2 6) (Hamza Shafik)
CREATE PROC ViewTask 
@user_id INT,
@creator INT
AS
SELECT *
FROM Task T INNER JOIN Assigned_to A 
ON T.creator = A.admin_id
WHERE A.user_id = @user_id AND T.creator= @creator AND T.task_id =A.task_id
ORDER BY T.creation_date DESC;
GO

--2 7) (Hamza Shafik)
CREATE PROC ViewMyDeviceCharge
@device_id INT
AS
SELECT battery_status
FROM Device
WHERE @device_id =device_id;
GO

--2 8) (Hamza Shafik)
CREATE PROC AssignRoom
@user_id INT,
@room_id INT
AS
UPDATE Users
SET room = @room_id
WHERE @user_id =id;
GO

--2 9) (Hamza Shafik)
CREATE PROC CreateEvent
@event_id INT ,
@user_id INT,
@name VARCHAR(50),
@description VARCHAR(200),
@location VARCHAR(40),
@reminder_date DATETIME,
@other_user_id INT
AS
SET IDENTITY_INSERT Calendar ON;
INSERT INTO Calendar(event_id,user_assigned_to,name,description,location,reminder_date) VALUES(@event_id ,
@other_user_id,
@name,
@description,
@location,
@reminder_date) 
SET IDENTITY_INSERT Calendar OFF;
GO

--2 10) (Hamza Shafik)
CREATE PROC AssignUser
@user_id INT,
@event_id INT
AS 
UPDATE Calendar
SET user_assigned_to = @user_id
WHERE @event_id = event_id
GO

--2 11) (Hamza Shafik)
CREATE PROC AddReminder
@task_id INT,
@reminder DATETIME
AS
UPDATE Task
SET reminder_date = @reminder
WHERE @task_id= task_id;
GO

--2 12) (Hamza Shafik)
CREATE PROC Uninvited
@event_id INT,
@user_id INT
AS 
UPDATE Calendar
SET user_assigned_to = NULL
WHERE @event_id = event_id
GO

--2 13) (Hamza Shafik)
CREATE PROC UpdateTaskDeadline
@deadline DATETIME,
@task_id INT
AS
UPDATE Task
SET due_date = @deadline
WHERE @task_id= task_id;
GO



--2-14) (Fares Ashraf)
CREATE PROC ViewEvent
@User_id int,
@Event_id int
As
IF(@Event_id IS NULL)
SELECT*
From Calendar  
WHERE user_assigned_to=@User_id 
ORDER BY reminder_date  
SELECT*
From Calendar  
WHERE user_assigned_to=@User_id AND @Event_id=event_id 
Order BY reminder_date 


GO

--2-15) (Fares Ashraf)
Create Proc ViewRecommendation
AS
select u.f_name,u.l_name
From Recommendation r right outer join Users u ON r.user_id=u.id
Where r.recommendation_id IS NULL


GO


--2-16) (Fares Ashraf)
CREATE PROC CreateNote
@User_id int, 
@note_id int,
@title VARCHAR(50),
@Content VARCHAR(500),
@creation_date datetime
AS
Select*
From Notes
INSERT INTO Notes (id,user_id,content,creation_date,title)
Values(@note_id, @User_id,@content,@creation_date,@title)

GO

--2-17) (Fares Ashraf)
CREATE PROC ReciveMoney
@Reciver_id int, 
@type varchar(30), 
@amount decimal(13,2), 
@status varchar(10), 
@date datetime
As
INSERT INTO Finance(user_id,type,amount,status,date) VALUES (@Reciver_id,@type,@amount,@status,@date)
GO

--2-19) (Fares Ashraf)
CREATE PROC SendMessage
@sender_id int, 
@receiver_id int, 
@title varchar(30), 
@content Varchar(200), 
@timesent time, 
@timereceived time
AS
INSERT INTO Communication(sender_id,receiver_id,title,content,time_sent,time_received)
VALUES(@sender_id,@receiver_id,@title,@content,@timesent,@timereceived)

GO

--2-20) (Fares Ashraf)
CREATE PROC NoteTitle
@user_id int,
@note_title varchar(50)
AS
Update Notes
set title=@note_title
where @user_id=user_id
GO

--2-21) (Fares Ashraf)
CREATE PROC ShowMessages
@user_id int, 
@sender_id int
AS
Select content
From Communication
Where @user_id=receiver_id and @sender_id=sender_id
GO

--3-1) (Fares Ashraf)
CREATE PROC ViewUsers
@user_type varchar(20)
AS
Select*
From Users
Where @user_type=type
GO

--3-2)	(Fares Ashraf)
CREATE PROC RemoveEvent
@event_id int, 
@user_id int
AS
DELETE FROM Calendar
Where @user_id=user_assigned_to and @event_id=event_id
GO

--3-3)(Fares Ashraf)
CREATE PROC CreateSchedule
@creator_id int, 
@room_id int, 
@start_time datetime, 
@end_time datetime,
@action VARCHAR(20)
AS
INSERT INTO RoomSchedule(creator_id,room,start_time,end_time,action) 
VALUES(@creator_id,@room_id,@start_time,@end_time,@action)

GO
-- user story #3-4. remove guest from the system (Youssef Amr)
CREATE PROCEDURE GuestRemove @guest_id int, @admin_id int,
    @number_of_allowed_guests int OUTPUT
	AS
	BEGIN
	DECLARE @current_allowed_guests INT;

	SELECT @current_allowed_guests = no_of_guests_allowed
	FROM Admin
	WHERE admin_id = @admin_id

	DELETE FROM  Guest
	WHERE guest_id = @guest_id;

	SET @number_of_allowed_guests = @current_allowed_guests+1;
	 UPDATE Admin
    SET no_of_guests_allowed = @number_of_allowed_guests
    WHERE admin_id = @admin_id;
END;
GO
-- user story #3-5. Recommend travel destinations for guests under certain age (Youssef Amr)

CREATE PROCEDURE RecommendTD 
    @Guest_id INT, 
    @destination VARCHAR(20), 
    @age INT,
    @preference_no INT
AS
BEGIN
    DECLARE @preferred_category VARCHAR(20);


    SELECT @preferred_category = content
    FROM Preferences
    WHERE user_id = @Guest_id AND preference_no = @preference_no;

    SELECT DISTINCT t.destination
    FROM Travel t
    JOIN Users u ON t.destination = @destination
    WHERE u.id = @Guest_id AND u.age < @age;
END;
GO
-- user story #3-6 Access cameras in the house (Youssef Amr)
CREATE PROCEDURE Surveillance
    @user_id INT,
    @location INT,
    @camera_id INT
AS
BEGIN
    
IF EXISTS (
SELECT 1
FROM Users AS u
INNER JOIN Camera AS c ON u.id = c.monitor_id
INNER JOIN Room AS r ON c.room = r.room_id
WHERE u.id = @user_id
AND r.room_id = @location
AND c.camera_id = @camera_id
)
BEGIN
PRINT 'Access Granted. Camera Feed Displayed.';
       
END
ELSE
BEGIN
       
PRINT 'Access Denied. Camera Not Found or Unauthorized User.';
  
END
END;
GO
-- user story #3-7 Change room status (Youssef Amr)
CREATE PROCEDURE RoomAvailability @location int, @status varchar(40)
AS
BEGIN
	DECLARE @current_status varchar(40)

    SELECT @current_status = status
    FROM Room
    WHERE room_id = @location

    IF @current_status IS NOT NULL
    BEGIN
IF @current_status = 'empty' OR @current_status = 'occupied'
BEGIN
UPDATE Room
SET status = @status
WHERE room_id = @location;

PRINT 'Room status is ' + @status + '.';
END
ELSE
BEGIN
PRINT 'Invalid room status.';
END
END
ELSE
BEGIN
PRINT 'Room not found.';
END
END;

-- user story#3-8  Create an inventory for a specific item (Youssef Amr)
GO
CREATE PROCEDURE  Sp_Inventory @item_id int,@name varchar(30), @quantity int, @expirydate datetime, @price decimal(10,2),
@manufacturer varchar(30),@category varchar(20)
AS 
BEGIN
INSERT INTO Inventory (supply_id, name, quantity, expiry_date, price, manufacturer, category)
    VALUES (@item_id, @name, @quantity, @expirydate, @price, @manufacturer, @category);
END;


-- user story#3-9 Calculate price of purchasing a certain item (Youssef Amr)
GO

CREATE PROCEDURE Shopping  
    @id INT,
    @quantity INT,
    @total_price DECIMAL(10,2) OUTPUT
AS 
BEGIN
    DECLARE @price DECIMAL(10, 2);

    SELECT @price = price
    FROM Inventory
    WHERE supply_id = @id;

    SET @total_price = @price * @quantity;

    SELECT @total_price AS TotalPrice;
END;

 -- user story#3-10 If current user had an activity set its duration to duration parameter (Youssef Amr)
 GO
CREATE PROCEDURE LogActivityDuration
    @room_id INT,
    @device_id INT,
    @user_id INT,
    @date DATETIME,
    @duration VARCHAR(50)
AS
BEGIN

IF EXISTS (
SELECT 1
 FROM Log
WHERE room_id = @room_id
AND device_id = @device_id
AND user_id = @user_id
AND date = @date
)
BEGIN
       
UPDATE Log
SET duration = @duration
WHERE room_id = @room_id
AND device_id = @device_id
AND user_id = @user_id
AND date = @date

PRINT 'Activity duration updated successfully.';
      
END
ELSE
BEGIN
        
PRINT 'Activity not found for the specified user, room, and device at the given date.';
END
END;

-- user story#3-11 Set device consumption for all tablets (Youssef Amr)
GO
CREATE PROCEDURE TabletConsumption 
    @consumption INT
AS
BEGIN
DECLARE @date DATETIME = GETDATE(); 

INSERT INTO Consumption (device_id, consumption, date)
SELECT device_id, @consumption, @date
FROM Device
WHERE type = 'Tablet';
END;

-- user story#3-12 Make preferences for Room temperature to be 30 if a user is older then 40 (Youssef Amr)
GO
CREATE PROCEDURE MakePreferencesRoomTemp 
    @user_id INT,
    @category VARCHAR(20),
    @preferences_number INT
AS
BEGIN
DECLARE @age INT;

SELECT @age = YEAR(GETDATE()) - YEAR(birth_date)
FROM Users
WHERE id = @user_id;

IF @age >= 40
BEGIN
IF EXISTS (
SELECT 1
FROM Preferences
WHERE user_id = @user_id
AND category = @category
AND preference_no = @preferences_number
)
BEGIN
UPDATE Preferences
SET content = '30'
WHERE user_id = @user_id
AND category = @category
AND preference_no = @preferences_number;
END
ELSE
BEGIN
INSERT INTO Preferences (user_id, category, preference_no, content)
VALUES (@user_id, @category, @preferences_number, '30');
END

PRINT 'Room temperature preference set to 30 for the user.';

END
ELSE
BEGIN
PRINT 'User is not 40 or older. No preferences updated for room temperature.';

END
END;

-- user story#3-13 View Log entries involving the user (Youssef Amr)
GO
CREATE PROCEDURE ViewMyLogEntry @user_id int
AS
BEGIN
SELECT *
FROM Log
WHERE user_id = @user_id;
END;
Go
-- user story#3-14  Update log entries involving the user (Youssef Amr)
CREATE PROCEDURE UpdateLogEntry @user_id int, @room_id int,
@device_id int, @activity varchar(30)
AS
BEGIN
UPDATE Log
SET activity = @activity 
WHERE user_id = @user_id 
AND room_id = @room_id 
AND device_id = @device_id;
END;
go
--3-15) (Abdallah Ashraf)
CREATE PROC ViewRoom
AS
BEGIN
Select* 
FROM Room
Where status = 'empty '
End
GO

--3-16) (Abdallah Ashraf)
CREATE PROC ViewMeeting
@room_id int,
@user_id int
AS
BEGIN 
 IF EXISTS (
        SELECT 1
        FROM Room r
        WHERE r.room_id = @room_id AND r.status = 'empty'
    )

SELECT u.room
FROM Users u
Where @user_id=u.id 

else
begin
select *
from room r
where @room_id = r.room_id 

Select u.f_name , u.l_name
From  Users u
where @room_id = u.room 
end
End
GO

--3-17) (Abdallah Ashraf)
CREATE PROC AdminAddTask 
@user_id int,
@creator int, 
@name varchar(30),
@category varchar(20),
@priority int , 
@status varchar(20),
@reminder datetime,
@other_user int,
@creation_date datetime,
@deadline datetime
AS
BEGIN
INSERT INTO Task VALUES (@name,@creation_date,@deadline,@category,@creator,@status, @reminder, @priority)
    DECLARE @TaskId INT;
    SET @TaskId = SCOPE_IDENTITY();
INSERT INTO Assigned_to Values(@other_user,@TaskId,@user_id)
end
GO

--3-18) (Abdallah Ashraf)
CREATE PROC AddGuest
@email varchar(30),
@first_name varchar(10),
@address varchar (30),
@password varchar(30),
@guest_of int,
@room_id int
As
BEGIN
INSERT INTO Users(f_name,password,email,room,type)
VALUES (@first_name,@password,@email,@room_id,'Guest')
 DECLARE @UserId INT;
    SET @UserId = SCOPE_IDENTITY();
Insert INto Guest (guest_id , guest_of , address )
Values (@UserId , @guest_of , @address )

  UPDATE Admin
    SET no_of_guests_allowed = no_of_guests_allowed - 1
    WHERE admin_id = @guest_of;

    UPDATE Room
    SET status = 'occupied ' 
    WHERE room_id = @room_id;

select A.no_of_guests_allowed
from Admin A
where @guest_of = A.admin_id 
end
GO

--3-19) (Abdallah Ashraf)
Create proc AssignTask
@user_id int , 
@task_id int , 
@creator_id int
as
BEGIN 
insert into Assigned_to values (@creator_id , @task_id ,@user_id)
end
GO

--3-20) (Abdallah Ashraf)
Create PROC DeleteMsg
AS
begin
Delete From Communication 
  WHERE time_sent = (SELECT TOP 1 time_sent FROM Communication ORDER BY time_sent DESC);
end
GO

--3-21) (Abdallah Ashraf)
Create proc AddItinerary
@trip_no int,
@flight_num varchar(30) ,
@flight_date datetime ,
@destination varchar(40)
AS
SET IDENTITY_INSERT Device ON;
INSERT INTO Travel(trip_no,outgoing_flight_num,outgoing_flight_date,destination) 
VALUES(@trip_no,@flight_num,@flight_date,@destination)
SET IDENTITY_INSERT Device OFF


GO

--3-22) (Abdallah Ashraf)
CREATE PROC ChangeFlight
AS
BEGIN
    UPDATE Travel
    SET 
        ingoing_flight_date = DATEADD(YEAR, 1, ingoing_flight_date),
        outgoing_flight_date = DATEADD(YEAR, 1, outgoing_flight_date)
    WHERE 
        YEAR(ingoing_flight_date) = YEAR(GETDATE()) OR 
        YEAR(outgoing_flight_date) = YEAR(GETDATE());
END
GO

--3-23) (Abdallah Ashraf)
Create proc UpdateFlight
@date datetime,
@trip_no int, 
@destination varchar(15)
AS
begin
UPDATE Travel
SET 
destination = @destination,
ingoing_flight_date = @date
Where ingoing_flight_num = @trip_no
end 

GO

--3-24) (Abdallah Ashraf)
CREATE PROC AddDevice
@device_id int,
@status varchar(20), 
@battery int,
@location int, 
@type varchar(20)
AS
SET IDENTITY_INSERT Device ON;
INSERT INTO Device (device_id ,room, type, status, battery_status)  VALUES (@device_id ,@location, @type, @status, @battery);
SET IDENTITY_INSERT Device  OFF;

GO

--3-25) (Abdallah Ashraf)
Create Proc OutOfBattery
As
begin
SELECT d.room
From Device D 
Where d.battery_status=0
end

GO

-- 3/26(karim)
	CREATE PROCEDURE Charging
		AS
		BEGIN
		UPDATE Device
		SET status = 'Charging'
		WHERE status = 'Dead Battery';
		END;
		GO
-- 3/27(karim)
	CREATE PROCEDURE GuestsAllowed
		@admin_id INT, @number_of_guests INT	
		AS
		BEGIN
		UPDATE Admin
		SET no_of_guests_allowed = @number_of_guests
		WHERE admin_id = @admin_id;
		END;
		GO

-- 3\28(karim)
	CREATE PROCEDURE Penalize
		@Penalty_amount INT
		AS
		BEGIN
		UPDATE Finance
		SET penalty = @Penalty_amount
		WHERE status = 'Unpaid' AND deadline < CURRENT_TIMESTAMP;
		END;
		GO

--3/29(karim)
	CREATE PROCEDURE GuestNumber
	    @admin_id INT, @guest_count INT OUTPUT
		AS
		BEGIN
		SELECT @guest_count = COUNT(DISTINCT Guest.guest_id)
		FROM Guest INNER JOIN Users ON Guest.guest_id = Users.id
		WHERE Users.room IN (SELECT room FROM Users WHERE id = @admin_id);
		END;
		GO
--3/30(karim)
	CREATE PROCEDURE Youngest
		AS
		BEGIN
		SELECT TOP 1 *
		FROM Users
		ORDER BY birth_date DESC;
		END;
		GO
--3/31(karim)

	CREATE PROCEDURE AveragaPayment
		@amount DECIMAL(10,2)
		AS
		BEGIN
		SELECT  u.f_name, u.l_name
		FROM Finance f INNER JOIN Users u ON f.user_id = u.id
		GROUP BY  u.f_name, u.l_name
		HAVING AVG(f.amount) > @amount;
		END;
		GO
-- 3/32(karim)

	CREATE PROCEDURE Purchase
		AS
		BEGIN
		SELECT SUM(i1.price) AS TotalAmount
		FROM Inventory i1 LEFT JOIN Inventory i2
        ON i1.supply_id = i2.supply_id AND i1.supply_id != i2.supply_id
		WHERE i2.supply_id IS NULL;
		END;
		GO
-- 3/33(karim)

	CREATE PROCEDURE NeedCharge
		AS
		BEGIN
		SELECT DISTINCT d.room
		FROM Device d
		WHERE d.battery_status = 0
		GROUP BY d.room
		HAVING COUNT(*) > 2;
		END;
		GO
-- 3/34(karim)

	CREATE  PROCEDURE Admins
	AS
	BEGIN
    SELECT u.f_name, u.l_name
    FROM Users u JOIN Admin a ON u.id = a.admin_id JOIN Guest g ON u.id = g.guest_id
    GROUP BY u.f_name, u.l_name
    HAVING COUNT(DISTINCT g.guest_id) > 2;
	END;



