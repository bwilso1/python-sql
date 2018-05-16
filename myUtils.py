import time
import sys
import pymysql

# ------ GLOBAL VARS --------
pauseLen = 0.75

# used by getConnection()
proj_host = 'localhost'
proj_user = 'root'
proj_password='alpha'
proj_db = 'bookfetch'


#------ UTILITY FUNCTIONS -------

def getInput(promptMessage,optionsList, longFormat=True):
	choice = -1
	while choice < 0:
		print("\n" + promptMessage)
		for counter, value in enumerate(optionsList):
			if type(value) is list:
				print1(str(counter) + "\t")
				for k in value:
					print1(str(k) + ", ")
			else:
				print1(str(counter) + "\t" + str(value))
				
			if longFormat:
				print("")
			else:
				print1("\t")
		choice = raw_input("enter choice: ")
		try:
			choice = int(choice)
			if choice > (len(optionsList) - 1):
				choice = -1
			elif choice < 0:
				choice = -1
		except ValueError:
			choice = -1
		
		if choice == -1:
			print("please enter valid choice\n")
			time.sleep(pauseLen)
	
	return choice

def print1(message):
	sys.stdout.write(str(message))
	
def confirm(promptMessage, parameters=None, longFormat=True):

	while True:
		if parameters is not None:
			print("-----------  Data Entered --------------")
			for counter, element  in enumerate(parameters):
				if element is None:
					sys.stdout.write("<none>\t")
				else:
					sys.stdout.write(str(element) + "\t")
				if longFormat:
					print("")
				elif counter % 4 == 0 and counter!= 0:
					print("")
		try:
			choice = raw_input("\n" + promptMessage).lower()
			if choice == 'y' or choice =='yes':
				return True
			elif choice == 'n' or choice == 'no':
				return False
			
		except ValueError:
			print('please enter "y" or "n"')
		print('please enter "y" or "n"')
		time.sleep(0.75)
			
		
def getLastID(tableName, idField='id',input_cursor=None):

	sql = 'SELECT ' + idField + ' FROM ' + tableName + ';'
	
	if input_cursor is None:
		connection = getConnection()
		connection.autocommit(True)
	
		
		try:
			with connection.cursor() as curse:
				

				curse.execute(sql)
				data = curse.fetchall()
		finally:
			connection.close()
			
	else:
		input_cursor.execute(sql)
		data = input_cursor.fetchall()
		
	result = -1
	for myTuple in data:
		if myTuple[0] > result:
			result = myTuple[0]
			
	return result


def showAllRecords(tableName):
	connection = getConnection()
	
	try:
		with connection.cursor() as cursor:
			sql = "SELECT * from " + tableName + ";"
			cursor.execute(sql)
			result = cursor.fetchall()
			print(tableName + ": " + str(result))
	
	finally:
		connection.close()
	
def printPauseMessage(message=None):
	if message is None:
		print("Returning to previous menu...")
	else:
		print(message)
	time.sleep(pauseLen)

def getConnection():
	return pymysql.connect(host=proj_host,
	user=proj_user,
	password=proj_password,
	db=proj_db)

def tupleTransform(collection , appendQuit=True):
	result = []
	rows = len(collection)
	for i in range(0,rows):
		temp = list(collection[i])
		result.append(temp)
	if appendQuit:
		result.append("Quit/Return")
	return result
	
def header(message):
	print("\n---------- "+message+" ----------")
	
def junkTest(inCursor):
	sql = "SELECT * FROM student WHERE first_name LIKE '%J%';"
	inCursor.execute(sql)
	result = inCursor.fetchall()
	resultList = tupleTransform(result,False)
	for row in resultList:
		print row
		
		
def printShortenedListTableHeaders(inputList, maxWidth = 20):
	for value in inputList:
		x = maxWidth - len(value) + 4
		print1(value)
		for y in range(0,x):
			print1(" ")
	
def printShortenedListInTable(inputList,maxWidth = 20):
	for row in inputList:
		for element in row:
			if type(element) is str:
				if len(element) > maxWidth:
					print1(element[:maxWidth] + "... ")
					x = 0
				else:
					x = maxWidth - len(element) + 4
					print1(element)

			else:
				length = len(str(element))
				x = maxWidth - length + 4
				print1(str(element))
			
			for value in range(0,x):
				print1(" ")
			
		print("")
				
def getAvailability(input_list, target_id):
	result = 0
	for row in input_list:
		if row[0] == target_id:
			return row[1]
	
	return result

def printQueryInTable(collection,titlesList,maxWidth = 20):
	result = []
	rows = len(collection)
	for i in range(0,rows):
		temp = list(collection[i])
		result.append(temp)
	
	#start setting max width to len of col header
	widthList = []
	for element in titlesList:
		widthList.append(len(element))
	
	# see if any elements are wider than col title
	for row in result:
		for i,element in enumerate(row):
			x = len(str(element))
			if x > widthList[i]:
				widthList[i] = x

					
	# print column headers
	for i,element in enumerate(titlesList):
		if widthList[i] > maxWidth:
			diff = maxWidth - len(element) + 4
			print1(element)
		else:
			diff = widthList[i] - len(str(element)) + 4
			print1(element)
			
		for value in range(0,diff):
			print1(" ")
	
	print(" ")
	for row in result:
		for i,element in enumerate(row):
			if widthList[i] > maxWidth:
				if element is not None:
					if len(str(element)) > maxWidth:
						print1(element[:maxWidth] + "... ")
						diff = 0
					else:
						diff = maxWidth - len(str(element)) + 4
						print1(element)
				else:
					diff = maxWidth + 4
					
				for value in range(0,diff):
					print1(" ")
			else:
				#widthList <= maxWidth
				if element is not None:
					diff = (widthList[i] - len(str(element))) + 4
					print1(element)
				else:
					diff = widthList[i] + 4
					
				for value in range(0,diff):
					print1(" ")
		print(" ")