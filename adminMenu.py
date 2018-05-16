from myUtils import *
from pymysql.err import *

def init_admin_menu():
	options = ["login as Admin","login as Super-Admin","return to main menu"]
	connection = getConnection()
	connection.autocommit(True)
	
	choice = -1
	with connection.cursor() as cursor:
		while choice != (len(options) - 1):
			header("Admin Module")
			choice = getInput("Select Option",options)
			if choice == 0:
				selectEmployee(cursor,0)
			elif choice == 1:
				selectEmployee(cursor,1)
	
	connection.close()
	printPauseMessage()
	
def selectEmployee(cursor, empType):
	if empType == 0:
		sql = 'Select id, first_name, last_name, email from employee WHERE role like "admin%";'
	else:
		sql = 'Select id, first_name, last_name, email from employee where role like "super%";'
	
	cursor.execute(sql)
	result = cursor.fetchall()
	resultList = tupleTransform(result,True)
	choice = -1
	while choice != len(resultList) -1:
		header("Admin login")
		choice = getInput("select one",resultList)
		if choice != len(resultList) -1:
			if empType == 1:
				superAdminOps(cursor,resultList[choice][0])
			else:
				adminOps(cursor,resultList[choice][0])
				
	printPauseMessage()
	
def superAdminOps(cursor, employee_id):
	options = ["Return",]
	
	header("Super Admin Options")
	print("Sorry, this module has not been implemented")
	input = raw_input("Press enter to continue...")
	
def adminOps(cursor, employee_id):
	options = ["Add university","Add books to Inventory", "Add new book to inventory","Add new course","Return..."]
	choice = -1
	while choice != len(options) -1:
		header("Admin Menu.  ID: "+str(employee_id))
		choice = getInput("select one",options)
		if choice == 0:
			createNewUniversity(cursor)
		elif choice == 1:
			addInventory(cursor)
		elif choice == 2:
			createNewBook(cursor)
		elif choice == 3:
			createNewCourse(cursor)
			
	printPauseMessage()
	
def createNewUniversity(cursor):
	prompts = ["Name","Address","contact f name","contact L name","contact email","contact phone"]
	sql = 'INSERT INTO university (name, address,contact_fname,contact_lname,contact_email,contact_phone) VALUES (%s, %s, %s, %s, %s, %s);'

	choice = False
	answers = []
	while choice is False:
		header("Create Univesity")
		answers[:] = []
		for count,value in enumerate(prompts):
			answers.append(raw_input("enter '" + value + "': ").strip())
		
		choice = confirm("is this correct? ",answers)
	
		try:
			cursor.execute(sql,answers)
			printPauseMessage("Sucess!!")
		except IntegrityError as e:
			print("Error: " + str(e.args[1]))
			printPauseMessage("Operation aborted")
			
def addInventory(cursor):
	choice = -1
	sql = "select book.inventory_id,bookclass.title, book.quantity from book, bookclass where book.isbn13 = bookclass.isbn13 order by title;"
	cursor.execute(sql)
	result = cursor.fetchall()
	resultList = tupleTransform(result,True)
	
	while choice != len(resultList) - 1:
		header("Add Inventory Menu")
		choice = getInput("Select book ", resultList,True)
		if choice != len(resultList) - 1:
			bookID = resultList[choice][0]
			conf = False
			while conf is False:
				print("Quant: " + str(resultList[choice][2]) + " Title: " + resultList[choice][1])
				usrInput = raw_input("Input of books to ADD (Neg to SUBTRACT): ")
				try:
					quant = int(usrInput)
					print("you entered: " + str(quant))
					conf = confirm("Continue?")
				except ValueError:
					print("please enter a valid number")
					conf = False
			sql = "update book SET quantity = quantity + %s WHERE inventory_id = %s;"
			cursor.execute(sql,(quant,bookID))
			print("Sucess!")
			cursor.execute(sql)
			result = cursor.fetchall()
			resultList = tupleTransform(result,True)
			
			
def createNewCourse(cursor):
	prompts = ['name','department','semester','year','university']
	courseID = getLastID("course",'id',cursor) + 1
	
	sql = "INSERT INTO course (name,department,semester,year,school, id) VALUES (%s, %s, %s, %s, %s, %s);"
	choice = False
	answers = []
	while choice is False:
		header("Create Course/Class")
		answers[:] = []
		for count,value in enumerate(prompts):
			answers.append(raw_input("enter '" + value + "': ").strip())
		
		choice = confirm("is this correct? ",answers)
		
		try:
			answers.append(courseID)
			cursor.execute(sql,answers)
			printPauseMessage("Sucess!!")
		except IntegrityError as e:
			print("Error: " + str(e.args[1]))
			printPauseMessage("Operation aborted")
			
def createNewBook(cursor):
	printPauseMessage("not implemented")