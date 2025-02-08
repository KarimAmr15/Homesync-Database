--1 1)
DECLARE @id INT;
EXEC UserRegister 'Admin','Hamza','hyshaf@gmail.com','Hamza','Shafik','1/22/2001', '121212',@user_id =@id OUTPUT
PRINT @id;

--2 1)

DECLARE @id INT;
DECLARE @succ BIT;
EXEC UserLogin @email = 'mohamedh21@gmail.com',@password = '123123',@success = @succ OUTPUT,@user_id = @id OUTPUT
PRINT @id;
PRINT @succ;

DECLARE @idd INT;
DECLARE @succss BIT;
EXEC UserLogin @email = 'hamzz@gmail.com',@password = '123321',@success = @succss OUTPUT,@user_id = @idd OUTPUT
PRINT @idd;
PRINT @succss;

--2 2)

EXEC ViewProfile 1;


--2 3)

EXEC ViewRooms 1,4


--2 4)
EXEC ViewMyTask 2;

--2 5)
EXEC FinishMyTask 4,'report analysis';
SELECT *
FROM Task

--2 6)
EXEC ViewTask 6,10

--2 7)
EXEC ViewMyDeviceCharge 3;

--2 8)
EXEC AssignRoom 12,2
SELECT *
FROM RoomSchedule

--2 9)
EXEC CreateEvent 5,3,'Wedding', 'Mohamed and Sara Wedding','New Cairo','8/29/2024',2 
SELECT *
FROM Calendar;

--2 10)

EXEC AssignUser 4,3;
SELECT *
FROM Calendar

--2 11)
EXEC AddReminder 2,'2/20/2023'
SELECT *
FROM Task;

--2 12)

EXEC Uninvited 6,2
SELECT *  
FROM Calendar

--2 13)
EXEC UpdateTaskDeadline '2/20/2024',3
SELECT *
FROM Task;

--2 14)
EXEC ViewEvent 2,null
EXEC ViewEvent 2,4

--2-15)
Exec ViewRecommendation



--2-16)
Exec CreateNote
@note_id=6,
@User_id=5,
@Content='The day of 05/05/2023',
@creation_date='05/05/2023',
@title ='Not one'

--2-17)
Exec ReciveMoney 
@Reciver_id=2,
@type='ingoing',
@amount=5354.33,
@status='Pending',
@date = '06/05/2023'

--2-18)
EXEC PlanPayment
@sender_id=1,
@reciever_id=6,
@type='OUTGOING',
@amount=2432.34,
@status='DISAPPROVED',
@deadline='12/02/2024'


--2-19)
EXEC SendMessage
@sender_id= 2,
@receiver_id=3,
@title='Good Morning',
@content='Birthday message',
@timesent='14:30:00',
@timereceived='15:00:00'

--2-20)
Exec NoteTitle
@user_id=1
@note_title='POEM'

--2-21)
Exec ShowMessages 2,5


--3-1)
EXEC ViewUsers 'GUEST'

--3-2)
EXEC RemoveEvent 2,5

--3-3)
EXEC CreateSchedule
@creator_id=6,
@room_id=5,
@start_time='17:00:00',
@end_time='18:00:00',
@action='KIDS AREA'

--3 4)

DECLARE @number_of_allowed_guests INT; 
EXEC GuestRemove @guest_id = 2, @admin_id = 1, @number_of_allowed_guests = @number_of_allowed_guests OUTPUT;
SELECT @number_of_allowed_guests AS Number_Of_Allowed_Guests;


-- user story #3-5. Recommend travel destinations for guests under certain age

EXEC RecommendTD @Guest_id = 2, @destination = 'Beach', @age = 30, @preference_no = 1;

-- user story #3-6 Access cameras in the house

EXEC Surveillance @user_id = 1, @location = 2, @camera_id = 3;

-- user story #3-7 Change room status


EXEC RoomAvailability @location = 2, @status = 'empty';

-- user story#3-8  Create an inventory for a specific item

EXEC Inventory1 @item_id = 69, @name = 'Iphone', @quantity = 101, @expirydate = '2025-12-22', @price = 2500.00, @manufacturer = 'Apple', @category = 'Electronics';

-- user story#3-9 Calculate price of purchasing a certain item


 EXEC Shopping @id = 66, @quantity = 5, @total_price = 100.00;

 -- user story#3-10 If current user had an activity set its duration to duration parameter


EXEC LogActivityDuration @room_id = 1, @device_id = 2, @user_id = 3, @date = '2023-12-10 07:20:00', @duration = '3';

-- user story#3-11 Set device consumption for all tablets

EXEC TabletConsumption @consumption = 20;

-- user story#3-12 Make preferences for Room temperature to be 30 if a user is older then 40 

EXEC MakePreferencesRoomTemp @user_id = 11, @category = 'Room temperature', @preferences_number = 1;

-- user story#3-13 View Log entries involving the user
EXEC ViewMyLogEntry @user_id = 1;

-- user story#3-14  Update log entries involving the user

EXEC UpdateLogEntry @user_id = 1, @room_id = 1, @device_id = 1, @activity = 'Using Tablet';


--3-15)
EXEC ViewRoom

--3-16)
exec ViewMeeting @room_id =1,@user_id = 3

--3-17)
EXEC AdminAddTask 
@user_id = 2,
@creator = 1, 
@name= 'Ahmed',
@category= 'Marketing',
@priority= 2 , 
@status= 'active'  ,
@reminder= '12/12/2023',
@other_user= 3,
@creation_date ='10/10/2023,
@deadline = '1/1/2024'

--3-18)
EXEC AddGuest
@email='ahmedmido12@gmail.com',
@first_name ='Ahmed',
@address = 'Nasr city,
@password ='Ahmed123',
@guest_of=3,
@room_id =3

--3-19)
EXEC AssignTask
@user_id =2 ,
@task_id =3 , 
@creator_id =2

--3-20)
Exec DeleteMsg

--3-21)
EXEC AddItinerary
@trip_no=4,
@flight_num=24,
@flight_date='17:00:00',
@destination='Paris'

--3-22)
Exec ChangeFlight

--3-23
EXEC UpdateFlight @date = '12/12/2023',@trip_no = 2,@destination= 'Greece'

--3-24)
EXEC AddDevice
@device_id=12,
@location=7,
@type='iPad',
@status='active',
@battery=87

--3-25)

EXEC OutOfBattery

--3/26
		exec Charging

		--3/27
		exec GuestsAllowed 5 , 4

		--3/28
		exec Penalize 2000

		--3/29
		declare @count int;
		exec GuestNumber  10 , @count output
		print @count 

		--3/30
		exec Youngest

		--3/31
		DECLARE @amount DECIMAL(10,2) = 00001000.00;
		EXEC AveragePayment @amount;

		--3/32
		exec purchase

		--3/33
		exec NeedCharge

		--3/34
		exec Admins