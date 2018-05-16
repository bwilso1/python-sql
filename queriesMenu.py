from myUtils import *

studentTitles = ["id (PK)","F name","L name", "DOB","email","address","phone number","School","Major","Year","Status"]
options = ["List all students attending 'UMBC'",
		 "List all graduate students",
		 "List all Comp Sci students buying 2 or more books",
		 "List most commonly rented/purchased books (Title, Key)",
		 "List books by category",
		 "List all required books by course (except for comp sci)",
		 "List all books bought by students no associated with a course",
		 "List all books and number of courses accociated with them",
		 "List all books with titles related to 'Linear Algebra'",
		 "List all books with a rating greater than 3",
		 "List all books and show # of purchases and rating for that book",
		 "List avg quantity of books bought, grouped by category",
		 "List university details (Name, Dept Name(s), Instructors per course)",
		 "For each university, list total books bought & cost of those books",
		 "List service employees & number of tickets created by them (Name, Key, & Count)",
		 "List Admin names sorted by Salary",
		 "List admins & number of tickets closed",
		 "List tickets grouped by state, collected by Student creator & svc employee creator",
		 "Show avg time it takes for ticket to go created -> closed",
		 "Display ticket info w/ history per ticket",
		 "For each Student, display recommended books",
		 "For each book, list total count of students that bought a book w/ a matching keyword to book",
		 "List books by overall ratings and # of students who rated them",
		 "List books with a rating of 5, and students who rated book w/ university",
		 "Exit..."
		 ]

def displayOption(choice):
	print("--------------------------------------------------------")
	print(options[choice])
	print("--------------------------------------------------------")

def noRes():
	print("<your query returned 0 results>")
	
def init_query_menu():

	connection = getConnection()
	connection.autocommit(True)
	with connection.cursor() as cursor:
		cont = True
		while cont:
			header("Queries Menu")
			choice = getInput("Select One: ",options,True)
			
			if choice == (len(options) -1):
				cont = False
			else:
				displayOption(choice)
				
			if choice == 0:
				list_UMBC_students(cursor,choice)
			elif choice == 1:
				listAllGraduate(cursor,choice)
			elif choice == 2:
				listCompSci2Books(cursor,choice)
			elif choice == 3:
				listPopularBooks(cursor,choice)
			elif choice == 4:
				listBookByCategory(cursor,choice)
			elif choice == 5:
				listBookByCourse(cursor,choice)
			elif choice == 6:
				listPurchasedNoCourse(cursor,choice)
			elif choice == 7:
				listNumOfCoursesPerBook(cursor,choice)
			elif choice == 8:
				listBooksLinearAlgebra(cursor,choice)
			elif choice == 9:
				listBooksRate3(cursor)
			elif choice == 10:
				function10(cursor)
			elif choice == 11:
				function11(cursor)
			
			if choice != (len(options) - 1):
				junk = raw_input("\npress enter to continue...")
			printPauseMessage(" ")

def list_UMBC_students(cursor, choice):

	
	sql = "SELECT * FROM student WHERE school LIKE 'UMBC' order by last_name;"
	cursor.execute(sql)
	result = cursor.fetchall()

	printQueryInTable(result,studentTitles,30)

def listAllGraduate(cursor, choice):

	
	sql = "SELECT * FROM student WHERE student.status LIKE 'grad%' ORDER BY last_name;"
	cursor.execute(sql)
	result = cursor.fetchall()

	printQueryInTable(result,studentTitles,30)
	
def listCompSci2Books(cursor,choice):
	
	
	sql = "SELECT first_name, last_name, dob, email, student.address, phone, school,major, student.year, student.status FROM student,orders,ordercontents WHERE (student.id = orders.owner_id AND ordercontents.order_id = orders.id AND student.major like 'comp% sci%');"
	cursor.execute(sql)
	result = cursor.fetchall()
	
	if len(result) == 0:
		noRes()
	else:
		printQueryInTable(result,studentTitles,30)

def listPopularBooks(cursor,choice):
	#Book title, book PK
	
	
	sql = 'select ordercontents.purchase_type, bookclass.title, SUM(ordercontents.quantity), ordercontents.inventory_id from orders, ordercontents, book, bookclass where (orders.id = ordercontents.order_id AND ordercontents.inventory_id = book.inventory_id AND book.ISBN13 = bookclass.ISBN13) group by ordercontents.inventory_id; '
	cursor.execute(sql)
	results = cursor.fetchall()
	
	resultsList = tupleTransform(results,False)
	
	
	maxRentIndex = -1
	maxRentValue = -1
	maxPurchIndex = -1
	maxPurchValue = -1
	for i,row in enumerate(resultsList):
		temp = row[0]
		if temp == "rent":
			if maxRentValue < row[2]:
				maxRentIndex = i
				maxRentValue = row[2]
		elif temp == "purchase":
			if maxPurchValue < row[2]:
				maxPurchIndex = i
				maxPurchValue = row[2]
	
	print("----most purchased book----")
	print("id (PK): " + str(resultsList[maxPurchIndex][3]) + " purchase count: " + str(resultsList[maxPurchIndex][2]) +" Title: " + resultsList[maxPurchIndex][1] )
	print("\n----most rented book----")
	print("id (PK): " + str(resultsList[maxRentIndex][3]) + " rental count: " + str(resultsList[maxRentIndex][2]) + " Title: " + resultsList[maxRentIndex][1])
		
def listBookByCategory(cursor,choice):
	#Category, subcategory, book title, PK

	
	titles = ["Dept", "Course ID", "Book Title", "IBSN (PK)"]
	sql = "SELECT bookcategory.department, bookcategory.course_id, bookclass.title,  bookcategory.isbn13 FROM bookcategory, bookclass WHERE bookclass.isbn13 = bookcategory.isbn13 order by bookcategory.department;"
	cursor.execute(sql)
	results = cursor.fetchall()
	printQueryInTable(results,titles, 40)
	
def listBookByCourse(cursor,choice):
	# course name, book title
		
	sql = "select course.name, course.id, bookclass.title FROM course, bookclass, bookcategory WHERE (bookclass.isbn13 = bookcategory.isbn13 AND course.id = bookcategory.course_id and course.department not like '%Comp% Sci%') order by course.name;"
	cursor.execute(sql)
	results = cursor.fetchall()
	titles = ["Course Name","Course ID", "Book Title"]
	printQueryInTable(results,titles, 40)
	
def listPurchasedNoCourse(cursor,choice):
	sql = 'select book.title, book.inventory_id from orders, ordercontents,book,bookcategory,bookclass where (orders.id = ordercontents.order_id AND book.inventory_id = ordercontents.inventory_id AND bookcategory.isbn13 = bookclass.ISBN13 AND book.isbn13 = bookclass.ISBN13 AND bookcategory.course_id is NULL) group by book.inventory_id;'
	cursor.execute(sql)
	results = cursor.fetchall()
	titles = ["Book Title", "Inventory ID"]
	printQueryInTable(results,titles,40)

def listNumOfCoursesPerBook(cursor,choice):
	sql = 'select bookclass.title, count(course_id) FROM bookclass,bookcategory WHERE bookcategory.isbn13 = bookclass.isbn13 group by bookcategory.isbn13;'
	titles = ["Book Title", "Num of Courses"]
	cursor.execute(sql)
	results=cursor.fetchall()
	printQueryInTable(results,titles,40)
	
def listBooksLinearAlgebra(cursor,choice):
	sql = "select bookclass.title FROM bookclass WHERE bookclass.keywords like '%linear algebra%';"
	cursor.execute(sql)
	titles = ["Book Title",]
	results = cursor.fetchall()
	printQueryInTable(results, titles,70)

def listBooksRate3(cursor):
	sql = "select bookclass.title , bookclass.score FROM bookclass WHERE score > 3;"
	cursor.execute(sql)
	titles = ["Book Title",]
	results = cursor.fetchall()
	printQueryInTable(results,titles,70)
	
def function10(cursor):
	sql = "select bookclass.title, count(ordercontents.inventory_id), bookclass.score FROM book,bookclass,orders,ordercontents WHERE (bookclass.isbn13 = book.ISBN13 AND orders.id = ordercontents.order_id AND ordercontents.inventory_id = book.inventory_id) group by book.ISBN13 order by score DESC;"
	cursor.execute(sql)
	titles = ["Book Title","Num of orders containing book", "Rating"]
	results = cursor.fetchall()
	printQueryInTable(results,titles,70)
	
def function11(cursor):
	print()