from myUtils import *
from datetime import datetime

def init_employee():
	options = ["login as standard employee", "return to main menu"]
	connection = getConnection()
	connection.autocommit(True)
	
	choice = -1
	with connection.cursor() as cursor:
		while choice != (len(options) - 1):
			header("Employee Module")
			choice = getInput("Select Option",options)
			if choice == 0:
				sql = 'select id, first_name, last_name, email from employee where role = "Customer Support";'
				cursor.execute(sql)
				results = cursor.fetchall()
				resultsList = tupleTransform(results,False)
				select = getInput("Select Employee",resultsList,True)
				employeeOptions(resultsList[select][0], cursor)
		
	connection.close()
	printPauseMessage()



def employeeOptions(employee_id,cursor):
	options = ["Create Ticket","Update Ticket","Return to Main Menu"]

	choice = -1
	while choice != (len(options) -1):
		header("Employee ID: " + str(employee_id) + " Menu")
		choice = getInput("Select Option", options)
		if choice == 0:
			createTicket(employee_id,cursor)
		elif choice == 1:
			modifyTicket(employee_id,cursor)

	
def createTicket(employee_id,cursor): #todo need to debug
	ticket_id = getLastID("ticket","id",cursor) + 1
	dataTypes = ["Student_id","Category","Title","description"]
	sql = 'INSERT INTO ticket (id, service_id, date_created, status, student_id, category, title, description) VALUES (%s, %s, %s, %s, %s, %s, %s, %s);'
	choice = False
	answers = []
	while choice is False:
		header("Create Ticket")
		answers[:] = []
		for count,value in enumerate(dataTypes):
			answers.append(raw_input("enter '" + value + "' (or leave blank): ").strip())
			if answers[count] == "":
				answers[count] = None
		
		choice = confirm("is this correct? ",answers)
	
	timestamp = str(datetime.now().date())
	result = [ticket_id, employee_id, timestamp, "new"]
	for element in answers:
		result.append(element)
	cursor.execute(sql, result)
	
def modifyTicket(employee_id,cursor): #todo need to debug
	sql = 'SELECT id, category, title, description FROM ticket WHERE status = "new";'
	cursor.execute(sql)
	results = cursor.fetchall()
	resultsList = tupleTransform(results,True)
	choice = -1
	while choice != (len(resultsList) - 1):
		header("View Availalbe tickets")
		if len(resultsList) == 1:
			print("<no 'new' tickets available>")
		else:
			choice = getInput("Select one: ",resultsList,True)
			
			if choice != (len(resultsList) - 1):
				conf = False
				while conf is False:
					admin = getAdmin(cursor)
					description = raw_input("Enter description (leave blank to skip): ").strip()
					
					print("Admin ID: " + str(admin))
					print("Description: " + description)
					conf = confirm("is this correct? ")
				if description == "":
					description = None
					

				conf = confirm("Submit?")
				if conf:
					timestamp = str(datetime.now().date())
					sql = "UPDATE ticket SET admin_id = %s WHERE id = %s;"
					cursor.execute(sql, [admin,resultsList[choice][0]])
					sql = "UPDATE ticket SET status = 'assigned' WHERE id = %s;"
					cursor.execute(sql, (resultsList[choice][0],))
					if description is not None:
						sql ="UPDATE ticket SET description = %s WHERE id = %s;"
						cursor.execute(sql,(description,resultsList[choice][0]) )
					sql = "INSERT INTO tickethistory (ticket_id, service_id, admin_id, update_date, status) VALUES (%s, %s, %s, %s, %s)"
					cursor.execute(sql, (resultsList[choice][0],employee_id,admin,timestamp,"assigned"))
					choice = -1
					
					sql = 'SELECT id, category, title, description FROM ticket WHERE status = "new";'
					cursor.execute(sql)
					results = cursor.fetchall()
					resultsList = tupleTransform(results,True)
					
def getAdmin(cursor):
	sql = 'select id,first_name,last_name, email from employee where role like "Admin%";'
	cursor.execute(sql)
	result = cursor.fetchall()
	resultList = tupleTransform(result,False)
	print("choose and admin")
	choice =  getInput("select one :",resultList)
	
	return resultList[choice][0]