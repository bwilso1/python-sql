import time
import sys
import pymysql
pauseLen = 0.75

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
	sys.stdout.write(message)
	
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
	
def returnToPreviousMessage(message=None):
	if message is None:
		print("Returning to previous menu...")
	else:
		print(message)
	time.sleep(pauseLen)

def getConnection():
	return pymysql.connect(host='localhost',
	user='root',
	password='alpha',
	db='bookfetch')

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
		
def printShortenedList(inputList):
	for row in inputList:
		for element in row:
			if element is str:
				if len(element) > 30:
					print1(str(element[:30]) + "... , ")
				else:
					print1(str(element) + ", ")
			else:
				print1(str(element) + " ")
				
def getAvailability(input_list, target_id):
	result = 0
	for row in input_list:
		if row[0] == target_id:
			return row[1]
	
	return result