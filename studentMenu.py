from myUtils import *
from pymysql.err import *

def init_student():
	message = "Student Module"
	options = ["Create New Student","Log in as existing student","Return to previous menu"]
	choice = -1
	while choice != (len(options) -1):
		choice = getInput("Select Option", options)
		if choice == 0:
			createStudent()
		elif choice == 1:
			studentLogin()
		
	returnToPreviousMessage()
	
	
def createStudent():
	myID = getLastID('student') + 1
	#myID = getLastID("student")
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
	
	sql = 'INSERT INTO student (id, first_name,last_name,email, dob ,address, phone, school, major, year,status) VALUES (' + str(myID) + \
		 ', %s, %s, %s, %s, %s, %s, %s, %s, %s, %s );'
	
	connection = getConnection()
	success = True
	try:
		with connection.cursor() as cursor:
			cursor.execute(sql,answers)
			connection.commit()
		
	#except IntegrityError and  pymysql.err.DatabaseError and pymysql.err.IntegrityError and pymysql.err.NotSupportedError and pymysql.err.OperationalError as e:
	#except InternalError and IntegrityError and DatabaseError and IntegrityError and NotSupportedError and OperationalError as e:
	except InternalError as e:
		print("Error: " + str(e[1]))
		success = False
	except IntegrityError as e:
		print("Error: " + str(e[1]))
		success = False
	finally:
		connection.close()
		
	if success:
		print("Account creation success!")
	else:
		print("Account creation fail...")
		
	returnToPreviousMessage()
	#CREATE TABLE Student(id integer, first_name varchar(50), last_name varchar(50), dob date, email varchar(200), address varchar(200), phone varchar(16), school varchar(50), major varchar(30), year varchar(10), status varchar(10),
	
def studentLogin():
	connection = getConnection()
	connection.autocommit(True)
	choice = -1
	with connection.cursor() as cursor:
		while choice != "exit":
			choice = raw_input("Enter a first name to look for looking for or type 'exit' to quit: ").strip()
			if choice != "exit":
				if choice != "":
					
					#sql = 'SELECT first_name, last_name, email FROM student WHERE (first_name =' + str(choice) + ');'
					sql = 'SELECT id,first_name, last_name, email FROM student WHERE (first_name LIKE %s);'
					cursor.execute(sql, (str(choice),))
					resultsTuple = cursor.fetchall()
					resultsList = tupleTransform(resultsTuple)
					#resultsList.append("Quit/Go Back...")
					student = getInput("Select Student", resultsList)
					#print("you went with" + str(student))
					if student == (len(resultsList) - 1):
						choice = "exit"
						connection.close()
					else:
						connection.close()
						#view this students options
						viewStudentOptions(resultsList[student][0])
						
						#we are here if we quit... head back to Top Student Menu
						choice = "exit"
					
				else:
					print("please enter some text")
				
		returnToPreviousMessage()

		
def viewStudentOptions(student_id):
	options = ["View Saved Carts/Place Order","Create new Cart","View/Cancel Orders", "Rate Book","Logout"]
	choice = -1
	while choice != (len(options) -1):
		choice = getInput("Select Option", options)
		if choice == 0:
			viewSavedCartsList(student_id)
		elif choice == 1:
			createNewCart(student_id)
		elif choice == 2:
			viewOrderList(student_id)
		elif choice == 3:
			rateBook(student_id)
	
	returnToPreviousMessage()
			
			
def viewSavedCartsList(student_id):
	connection = getConnection()
	connection.autocommit(True)
	with connection.cursor() as cursor:
		sql = "SELECT * FROM cart WHERE (cart_owner ="+str(student_id)+");"
		cursor.execute(sql)
		cartTuples = cursor.fetchall()
		cartList = tupleTransform(cartTuples)
		#cartList.append("Return...")
		if len(cartList) == 1:
			print("you have no carts...")
			connection.close()
		else:
			while choice != (len(cartList) - 1):
				choice = getInput("Select Cart to view",cartList)
				if choice != (len(cartList) - 1):
					connection.close()	#NOTE may make more sense to pass in connection.
					viewCart(student_id,cartList[choice][0])	#TODO - continue here.
			
	if connection.open():  #TODO - May cause issues
		connection.close()
	returnToPreviousMessage()

def viewCart(student_id, cart_id):
	sql = ''
	
def createNewCart(student_id):
	print('not yet implemented')
def viewOrderList(student_id):
	print('not yet implemented')
	
def rateBook(student_id):
	print('not yet implemented')