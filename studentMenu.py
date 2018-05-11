from myUtils import *

def init_student():
	message = "Student Module"
	options = ["Create New Student","Log in as existing student","Return to previous menu"]
	choice = -1
	while choice != (len(options) -1):
		choice = getInput("Select Option", options)
		if choice == 0:
			createStudent()
		
	print('returning to previous menu...')
	
	
def createStudent():
	myID = getLastID('student') + 1
	choice = True
	
	dataTypes = ["first name","last name","email","date of birth","address","phone","school/university","major",
			   "year (1-4)","status (undergrad/graduate)"]
	answers = []
	while choice:
		answers[:] = []
		for count, value in enumerate(dataTypes):
			answers.append(raw_input("enter '" + value + "' (or leave blank): ").strip())
			if answers[count] == "":
				answers[count] = None
			
		choice = confirm("is this correct? ", answers)
		choice = not choice		#exits loop if user hit "yes this is correct"
	
	sql = 'INSERT INTO student (id, first_name,last_name,dob,email,address, phone, school, major, year,status) VALUES (' + str(myID) + \
		 ', %s, %s, %s, %s, %s, %s, %s, %s, %s, %s );'
	
	connection = getConnection()
	try:
		with connection.cursor() as cursor:
			cursor.execute(sql,answers)
			connection.commit()
			print("Account creation success!")
		
	#except Exception as e:
	#	print(e.message)
	#	print("Account creation failed.")
	finally:
		connection.close()
		
	time.sleep(0.75)
	print("Returning to previous menu...")
	#CREATE TABLE Student(id integer, first_name varchar(50), last_name varchar(50), dob date, email varchar(200), address varchar(200), phone varchar(16), school varchar(50), major varchar(30), year varchar(10), status varchar(10),