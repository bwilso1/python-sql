from myUtils import *
from pymysql.err import *
from datetime import datetime

def init_student():
	header("Student Module")
	options = ["Create New Student","Log in as existing student","Return to Main Menu"]
	choice = -1
	while choice != (len(options) -1):
		choice = getInput("Select Option", options)
		if choice == 0:
			createStudent()
		elif choice == 1:
			studentLogin()
		
	returnToPreviousMessage()


# noinspection SqlNoDataSourceInspection
def createStudent():
	myID = getLastID('student') + 1
	#myID = getLastID("student")
	choice = True
	
	dataTypes = ["first name","last name","email","date of birth","address","phone","school/university","major",
			   "year (1-4)","status (undergrad/graduate)"]
	answers = []
	while choice:
		header("Student Account Creation")
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
		print("Error: " + str(e.args[1]) )
		success = False
	except IntegrityError as e:
		print("Error: " + str(e.args[1]))
		success = False
	finally:
		connection.close()
		
	if success:
		print("Account creation success!")
	else:
		print("Account creation fail...")
		
	returnToPreviousMessage()
	#CREATE TABLE Student(id integer, first_name varchar(50), last_name varchar(50), dob date, email varchar(200), address varchar(200), phone varchar(16), school varchar(50), major varchar(30), year varchar(10), status varchar(10),

# noinspection SqlNoDataSourceInspection
def studentLogin():
	connection = getConnection()
	connection.autocommit(True)
	choice = -1
	with connection.cursor() as cursor:
		while choice != "exit":
			header("Select Student")
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
		header("Student Menu for ID: "+ str(student_id))
		choice = getInput("Select Option", options)
		if choice == 0:
			viewSavedCartsList(student_id)
		elif choice == 1:
			createNewCart(student_id)
		elif choice == 2:
			viewOrderList(student_id)	#TODO
		elif choice == 3:
			rateBook(student_id)	#TODO
	
	returnToPreviousMessage()
			
			
def viewSavedCartsList(student_id):
	connection = getConnection()
	connection.autocommit(True)
	with connection.cursor() as cursor:
		choice = -1
		sql = "SELECT * FROM cart WHERE (cart_owner =" + str(student_id) + ");"
		cursor.execute(sql)
		cartTuples = cursor.fetchall()
		cartList = tupleTransform(cartTuples)
		#cartList.append("Return...")

		while choice != (len(cartList) - 1):
			header("View Carts for ID: " + str(student_id))
			if len(cartList) == 1:
				print("you have no carts...")
				choice = 0
				connection.close()
			else:
				choice = getInput("Select Cart to view",cartList)
				if choice != (len(cartList) - 1):  #make sure they didn't hit "back"
					connection.close()
					viewCart(student_id,cartList[choice][0])
					choice = (len(cartList) - 1)  #need to terminate...make user go back
				
	returnToPreviousMessage()

def viewCart(student_id, cart_id):
	sql = 'select bookclass.title, bookclass.author, book.format, cartcontents.purchase_type, book.inventory_id, cartcontents.quantity from (cartContents, book, bookclass) where (cartcontents.cart_id = %s and cartcontents.inventory_id = book.inventory_id and book.ISBN13 = bookclass.ISBN13);'
	titles = ["Title", "Author","Format", "Transaction Type", "Inventory ID", "Quantity"]
	options = ["Add Books to cart","Delete Cart", "Order Books in Cart", "Return to previous menu"]
	connection = getConnection()
	connection.autocommit(True)
	with connection.cursor() as cursor:
		
		
		
		choice = -1
		while choice != (len(options) -1):
			cursor.execute(sql,[cart_id,])
			resultsTuple = cursor.fetchall()
			resultsList = tupleTransform(resultsTuple,False)
			
			# printing books we found in users cart
			header("Viewing Cart.  Student_ID: " + str(student_id) + "  CartID: " + str(cart_id))
			if len(resultsList) == 0:
				print("<cart is empty>")
			else:
				for value in titles:
					print1(value + "\t")
				printShortenedList(resultsList)
			
			choice = getInput("Choose Option: ",options)
			if choice == 0:
				addBooksToCart(student_id, cart_id, cursor)
			elif choice == 1:
				deleteCart(student_id,cart_id,cursor)
			elif choice == 2:
				#prompt user for payment info, check quantities, copy into order, delete cart.
				placeOrder(student_id,cart_id, cursor)  #TODO - need to add ORDER CONTENTS
	
	connection.close()
				
		
def createNewCart(student_id):
	myCartID = getLastID('cart') + 1
	connection = getConnection()
	connection.autocommit(True)
	timestamp = str(datetime.now().date())
	sql = "INSERT INTO cart (id, cart_owner,date_created,update_date) VALUES ( %s, %s, %s, %s);"
	
	#no clue why I had to do this....
	#sql = 'INSERT INTO cart (id, cart_owner,date_created,update_date) VALUES ('+str(myCartID)+','+str(student_id)+',"'+timestamp+'","' +timestamp+ '");'
	#answer, I changed the font so % and $ & dont look too similar
	#this was left as a reminder for whoever reads this.
	
	with connection.cursor() as cursor:
		myList = [myCartID,student_id,str(timestamp),str(timestamp)]
		
		cursor.execute(sql, myList)
		#cursor.execute(sql)
		connection.close()
	
	print("Cart Creation success! Cart ID: " + str(getLastID('cart')))
	
def viewOrderList(student_id):
	print('not yet implemented') #TODO - Need to implement
	
def rateBook(student_id):
	print('not yet implemented') #TODO - Need to implement

def placeOrder(student_id,cart_id, cursor):
	print('not yet impelmented') #TODO - Need to implement
	
def addBooksToCart(student_id, cart_id, cursor):
	options = ["ISBN-13","Title", "Author","Keywords","Publisher", "Course Name","Course ID","Instructor ID","Department Name","Cancel..."]
	searchTitles = ["ISBN13","title","author","keywords","publisher","course","course_id","instructor_id","department"]
	resultTitles = ["ISBN13","title","author","publisher","book quality","format", "#avail","inventory id"]
	header("Book Search for Student_ID: "+str(student_id)+ "  Cart_ID: "+str(cart_id))
	choice = getInput("Select Book Search Type",options)
	
	confirmation = True
	while confirmation:
		templine = raw_input("Enter Search Text for " + options[choice]+": ").strip()
		if templine is not None:
			if templine != "":
				confirmation = confirm("Is this correct?",[templine,])
				confirmation = not confirmation
			else:
				print("enter non whitespace")
		else:
			print("enter non whitespace")
		
	if choice < 5:
		#search bookClass Table
		
		sql = 'SELECT book.ISBN13, bookclass.title, bookclass.author, bookclass.publisher, book.quality, book.format, book.quantity , book.inventory_id FROM (book, bookclass)  WHERE (book.ISBN13 = bookclass.ISBN13 AND '
		sql += searchTitles[choice] + ' LIKE "%' + templine + '%");'
		
	else:
		#search bookCategory Table
		sql = 'SELECT book.ISBN13, bookclass.title, bookclass.author, bookclass.publisher, book.quality, book.format, book.quantity , book.inventory_id FROM (book, bookclass, bookcategory) WHERE ('
		sql += 'book.ISBN13 = bookclass.ISBN13 AND book.ISBN13 = bookcategory.ISBN13 AND ' + searchTitles[choice] + ' LIKE "%' + templine + '%");'
	cursor.execute(sql)
	resultTuple = cursor.fetchall()
	resultList = tupleTransform(resultTuple,False)
	resultList.append("Cancel")
	
	choice = -1
	templine = ""
	for value in resultTitles:
		templine += (value + "\t")
		
	
	choice = getInput(templine,resultList)
	
	if choice != len(resultList) - 1:
		confirmation = True
		tempList = []
		while confirmation:
			print("Book selected...\n")
			print(str(resultList[choice]))
			tempList[:] = []
			tempList.append(raw_input("Buy/Rent"))
			try:
				value = int(raw_input("quantity"))
				tempList.append(value)
			except ValueError:
				print("invalid quantity, setting to 1")
				tempList.append(1)
				
			confirmation = confirm("Is this correct?",tempList)
			confirmation = not confirmation
		
		if tempList[1] > int(resultList[choice][6]):
			print("warning, you've added more than available\nWe can not guarantee stock will be avaiable depending on when you submit order for purchase")
		sql = 'INSERT INTO cartContents (cart_id, inventory_id,purchase_type, quantity) VALUES (%s, %s, %s, %s);'
		cursor.execute(sql,[cart_id , int(resultList[choice][7]), tempList[0] , tempList[1] ])
		
		timestamp = str(datetime.now().date())
		sql = "UPDATE cart SET update_date = %s WHERE (id = %s);"
		cursor.execute(sql,[timestamp,cart_id])


def deleteCart(student_id,cart_id,cursor):
	sql = 'DELETE FROM cartcontents WHERE cart_id = %s;'
	cursor.execute(sql,[cart_id,])
	sql = 'DELETE FROM cart WHERE id = %s;'
	cursor.execute(sql, [cart_id,])  #TODO - need to test



