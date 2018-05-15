from myUtils import *
from pymysql.err import *
from datetime import datetime

def init_student():
	
	options = ["Create New Student","Log in as existing student","Return to Main Menu"]
	choice = -1
	while choice != (len(options) -1):
		header("Student Module")
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
	
	dataTypes = ["first name","last name","email","date of birth (YYYY-MM-DD)","address","phone","school/university","major",
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
				
		#returnToPreviousMessage()

		
def viewStudentOptions(student_id):
	options = ["View Carts/Place Order", "Create new Cart", "Delete Cart", "View Orders", "Cancel an Order", "Rate Book","Logout"]
	choice = -1
	while choice != (len(options) -1):
		header("Student Menu for ID: "+ str(student_id))
		choice = getInput("Select Option", options)
		if choice == 0:
			viewSavedCartsList(student_id)
		elif choice == 1:
			createNewCart(student_id)
		elif choice == 2:
			viewSavedCartsList(student_id,True)
		elif choice == 3:
			viewOrderList(student_id)
		elif choice == 4:
			viewOrderList(student_id, True)
		elif choice == 5:
			rateBook(student_id)
	
	returnToPreviousMessage()
			
			
def viewSavedCartsList(student_id, delete=False):
	connection = getConnection()
	connection.autocommit(True)
	sql = "SELECT * FROM cart WHERE (cart_owner =" + str(student_id) + ");"
	with connection.cursor() as cursor:
		choice = -1
		
		cursor.execute(sql)
		cartTuples = cursor.fetchall()
		cartList = tupleTransform(cartTuples)

		while choice != (len(cartList) - 1):

			header("View Carts for ID: " + str(student_id))
			if len(cartList) == 1:
				print("you have no carts...")
				choice = 0
			else:
				if delete:
					choice = getInput("Select Cart to DELETE\n\tcart_id, owner_id, date_created, date_updated",cartList)
				else:
					choice = getInput("Select Cart to View/Order\n\tcart_id, owner_id, date_created, date_updated",cartList)
				if choice != (len(cartList) - 1):  #make sure they didn't hit "back"
				
					if delete:
						deleteCart(student_id, cartList[choice][0], cursor)
					else:
						viewCart(student_id,cartList[choice][0], cursor)
					choice = 0
			
			cursor.execute(sql)
			cartTuples = cursor.fetchall()
			cartList = tupleTransform(cartTuples)
			
	connection.close()
	returnToPreviousMessage()

def viewCart(student_id, cart_id, cursor):
	sql = 'select bookclass.title, bookclass.author, book.format, cartcontents.purchase_type, book.inventory_id, cartcontents.quantity from (cartContents, book, bookclass) where (cartcontents.cart_id = %s and cartcontents.inventory_id = book.inventory_id and book.ISBN13 = bookclass.ISBN13);'
	titles = ["Title", "Author","Format", "Transaction Type", "Inventory ID", "Quantity"]
	options = ["Add Books to cart", "Order Books in Cart", "Return to previous menu"]

	choice = -1
	while choice != (len(options) -1):
		cursor.execute(sql,[cart_id,])
		resultsTuple = cursor.fetchall()
		resultsList = tupleTransform(resultsTuple,False)
		
		# printing books we found in users cart
		header("Viewing Cart.  Student_ID: " + str(student_id) + "  CartID: " + str(cart_id))
		if len(resultsList) == 0:
			print("<cart is empty>")
			isEmpty = True
		else:
			maxWidth = 20
			printShortenedListTableHeaders(titles, maxWidth)
			print("")
			printShortenedListInTable(resultsList,maxWidth)
			isEmpty = False
		choice = getInput("Choose Option: ",options)
		if choice == 0:
			addBooksToCart(student_id, cart_id, cursor)

		elif choice == 1:
			#prompt user for payment info, check quantities, copy into order, delete cart.
			if isEmpty:
				returnToPreviousMessage("No books to order, place some in cart first...")
			else:
				placeOrder(student_id,cart_id, cursor)
	returnToPreviousMessage()
		
		
def createNewCart(student_id):
	myCartID = getLastID('cart') + 1
	connection = getConnection()
	connection.autocommit(True)
	timestamp = str(datetime.now().date())
	sql = "INSERT INTO cart (id, cart_owner,date_created,update_date) VALUES ( %s, %s, %s, %s);"

	
	with connection.cursor() as cursor:
		myList = [myCartID,student_id,str(timestamp),str(timestamp)]
		
		cursor.execute(sql, myList)
		#cursor.execute(sql)
		connection.close()
	
	print("Cart Creation success! Cart ID: " + str(getLastID('cart')))
	returnToPreviousMessage("To purchase books, goto 'View Carts'...")
	
def viewOrderList(student_id, cancel=False):
	connection = getConnection()
	connection.autocommit(True)
	
	sql = "SELECT id, date_created, date_completed, status, shipment_type FROM orders WHERE owner_id = %s;"

	with connection.cursor() as cursor:
		cursor.execute(sql,[student_id,])
		
		resultsTuple = cursor.fetchall()
		resultsList = tupleTransform(resultsTuple,True)
		choice = -1
		while choice != (len(resultsList) - 1):
			if cancel:
				header("Order cancellation menu for Student ID: " + str(student_id))
			else:
				header("View orders menu for Student ID: " + str(student_id))
				print("select an order to view full details")
			choice = getInput("Select one: ",resultsList)
			
			if choice != (len(resultsList) - 1):
				if cancel:
					if resultsList[choice][3] == "new":
						cancelOrder(student_id, resultsList[choice][0], cursor)
						choice = -1
					elif resultsList[choice][3] == "cancelled":
						print("order is already cancelled...")
					else:
						print("can not cancel a shipped or shipping order")
				else:
					viewFullOrder(student_id, resultsList[choice][0], cursor)
			
			returnToPreviousMessage(" ")
			cursor.execute(sql, [student_id,])
			resultsTuple = cursor.fetchall()
			resultsList = tupleTransform(resultsTuple,True)
				
	connection.close()
	returnToPreviousMessage()
	
def rateBook(student_id): #TODO - Need to implement
	returnToPreviousMessage('not yet implemented')

def placeOrder(student_id,cart_id, cursor):
	prompts = ["Credit Card Number", "EXP date MM/YYYY","Card Issuer (VISA/Mastercard/AMEX)"]
	ship_speeds = ["standard","2-day","1-day"]
	answers = []
	
	orderID = (getLastID('orders','id',cursor) + 1)
	choice = False
	
	header("Cart " + str(cart_id) + " Contents")
	sql = 'select bookclass.title, bookclass.author, book.format, cartcontents.purchase_type, book.inventory_id, cartcontents.quantity from (cartContents, book, bookclass) where (cartcontents.cart_id = %s and cartcontents.inventory_id = book.inventory_id and book.ISBN13 = bookclass.ISBN13);'
	titles = ["Title","Author","Format","Transaction Type","Inventory ID","Quantity"]
	cursor.execute(sql, [cart_id,])
	resultTuple = cursor.fetchall()
	cartContents = tupleTransform(resultTuple,False)
	
	printShortenedListTableHeaders(titles)
	print(" ")
	printShortenedListInTable(cartContents)
	
	choice = confirm("continue with order?")
	if choice:
		correct = False
		while correct is False:
			answers[:] = []
			for value in prompts:
				answers.append(raw_input("Enter "+value+": "))
				
			x = getInput("Select shipping speed",ship_speeds,True)
			answers.append( ship_speeds[x] )
			correct = confirm("Is this info correct?",answers)

	
		#-----check avail quantities & adjust ------
		sql = "SELECT inventory_id, quantity from book;"
		cursor.execute(sql)
		temp = cursor.fetchall()
		availList = tupleTransform(temp,False)
		for row in cartContents:
			x = getAvailability(availList,row[4])
			if row[5] > x:
				row[5] = x	#setting quantity to what is avail
				print("only " + str(x) + " available for " + row[0])
				print("setting quantity to " + str(x))
		
		#-----presetn user with current order and prompt for confirm-----
		header("ORDER CONFIRMATION")
		print("Cart Contents")
		
		printShortenedListTableHeaders(titles)
		printShortenedListInTable(cartContents)
		
		prompts.append("Shipping Speed")
		print(" ")
		if len(answers) != len(prompts):
			choice = False
			print("ERROR answers != prompts")
			print("Answers: " + str(len(answers)) + " Prompts: " + str(len(prompts)))
			returnToPreviousMessage("aborting...")
		else:
			for x in range(0, len(answers)):
				print (prompts[x] + ":\t" + answers[x])
		
		choice = confirm("Submit order?")
	
	if choice:
		timestamp = str(datetime.now().date())
		answers.append(orderID)
		answers.append(student_id)
		answers.append(timestamp)
		answers.append("new")
		# prompts = ["Credit Card Number", "EXP date MM/YYYY","Card Issuer (VISA/Mastercard/AMEX)", "SHIP SPEED" ]
		sql = "INSERT INTO orders (credit_num, payment_exp, payment_type, shipment_type, id, owner_id, date_created, status) VALUES ( %s, %s, %s, %s, %s, %s, %s, %s );"
		cursor.execute(sql,answers)
		# cartContents format == 'select bookclass.title, bookclass.author, book.format, cartcontents.purchase_type, book.inventory_id, cartcontents.quantity'
		sql = "INSERT INTO ordercontents (order_id, inventory_id, purchase_type, quantity) VALUES (%s, %s, %s, %s);"
		
		for row in cartContents:
			cursor.execute(sql, (orderID, row[4], row[3], row[5]))
			
		sql = "UPDATE book SET quantity = (quantity - %s) WHERE (inventory_id = %s)"
		for row in cartContents:
			cursor.execute(sql, (row[5], row[4]))
			
		sql = "DELETE from cartcontents WHERE cart_id = %s;"
		cursor.execute(sql, [cart_id,])
		sql = "DELETE FROM cart WHERE id = %s;"
		cursor.execute(sql, [cart_id,])

		returnToPreviousMessage("Order success!")
	else:
		returnToPreviousMessage("Submission Cancelled")
	
def addBooksToCart(student_id, cart_id, cursor):
	options = ["ISBN-13","Title", "Author","Keywords","Publisher", "Course Name","Course ID","Instructor ID","Department Name","Cancel..."]
	searchTitles = ["ISBN13","title","author","keywords","publisher","course","course_id","instructor_id","department"]
	resultTitles = ["ISBN13","title","author","publisher","book quality","format", "#avail","inventory id", "Book Rating"]
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
		
		sql = 'SELECT book.ISBN13, bookclass.title, bookclass.author, bookclass.publisher, book.quality, book.format, book.quantity , book.inventory_id, bookclass.score FROM (book, bookclass)  WHERE (book.ISBN13 = bookclass.ISBN13 AND '
		sql += searchTitles[choice] + ' LIKE "%' + templine + '%");'
		
	else:
		#search bookCategory Table
		sql = 'SELECT book.ISBN13, bookclass.title, bookclass.author, bookclass.publisher, book.quality, book.format, book.quantity , book.inventory_id, bookclass.score FROM (book, bookclass, bookcategory) WHERE ('
		sql += 'book.ISBN13 = bookclass.ISBN13 AND book.ISBN13 = bookcategory.ISBN13 AND ' + searchTitles[choice] + ' LIKE "%' + templine + '%");'
	cursor.execute(sql)
	resultTuple = cursor.fetchall()
	resultList = tupleTransform(resultTuple,False)
	resultList.append("Cancel")
	
	choice = -1
	templine = ""
	for value in resultTitles:
		templine += (value + "\t")
		
	if len(resultList) == 1:
		print("\t<no books found matching criteria>")
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
	cursor.execute(sql, [cart_id,])
	returnToPreviousMessage("Cart ID " + str(cart_id) + " Deleted...")

def cancelOrder(student_id, order_id,  cursor):
	viewFullOrder(student_id, order_id, cursor)
	temp = "\n\nConfirm cancel order #" + str(order_id) + " ?: "
	choice = confirm(temp)
	sql = "SELECT inventory_id, quantity FROM ordercontents WHERE order_id = %s;"
	cursor.execute(sql,[order_id,])
	resultsTuple = cursor.fetchall()
	resultsList = tupleTransform(resultsTuple,False)
	
	# ---- add back inventory ----
	sql = "UPDATE book SET quantity = quantity + %s WHERE inventory_id = %s;"
	for row in resultsList:
		cursor.execute(sql, (row[1], row[0]))
		
	# ---- set order to cancelled -----
	sql = "UPDATE orders SET status = 'cancelled' WHERE id = %s;"
	cursor.execute(sql, [order_id,])
	returnToPreviousMessage('order cancelled...')

def viewFullOrder(student_id, order_id, cursor):
	sql = 'select bookclass.title, bookclass.author, book.format, ordercontents.purchase_type, book.inventory_id, ordercontents.quantity from (ordercontents, book, bookclass) where (ordercontents.order_id = %s and ordercontents.inventory_id = book.inventory_id and book.ISBN13 = bookclass.ISBN13);'
	titles1 = ["Title","Author","Format","Transaction Type","Inventory ID","Quantity"]
	cursor.execute(sql,[order_id,])
	resultTuple = cursor.fetchall()
	orderContents = tupleTransform(resultTuple,False)
	header("View Full Order #" + str(order_id))
	print("\nOrder Contents\n")
	printShortenedListTableHeaders(titles1)
	print(" ")
	printShortenedListInTable(orderContents)
	
	print("\nOrder Details")
	titles2 = ["Date Created","Date Completed","Shipment Speed","Status","Card Number","Card Issuer","Card EXP"]
	sql = 'SELECT date_created, date_completed, shipment_type, status, credit_num, payment_type, payment_exp FROM orders WHERE id = %s;'
	cursor.execute(sql,[order_id,])
	resultTuple = cursor.fetchall()
	orderParams = tupleTransform(resultTuple,False)
	for counter, value in enumerate(titles2):
		print(titles2[counter] + ": " + str(orderParams[0][counter]))
		
	