from myUtils import *
from studentMenu import createStudent
import sys

def main():
	
	'''
	arr1 = [['a','b','c'], [1,2,3,4], "something", ["alpha","bravo","charlie","delta","echo"]]
	sys.stdout.write("something")
	sys.stdout.write(" Else")
	
	if type(arr1) is list:
		print("itza list")
	
	for value in arr1:
		if type(value) is list:
			print("2d list")
		else:
			print("not 2d")
			
	choice = getInput("choose one",arr1)
	print("\nyou have chosen\t" + str(choice))
	
	print("is this correct?")
	while confirm("is this correct?",["a","b","c"]):
		print("looping again")
	
	'''
	connection = getConnection()
	#connection.autocommit(True)
	result = None
	connection.autocommit(True)
	with connection.cursor() as curse:
		sql = 'DELETE FROM student where (id > 2999);'
		curse.execute(sql)
		#connection.commit()
		sql = 'INSERT INTO student (id, first_name, dob) VALUES (5000, "johnny", "1985/9/13");'
		curse.execute(sql)
		#connection.commit()
		sql = "insert into student (id, first_name) values(%s, %s);"
		curse.execute(sql,("4001","alex"))
		#connection.commit()

		
	
	connection.close();
		
	
	
	while  confirm("get max?", None):
		something = getLastID('student')
		print(str(something) + str(type(something)))
		
	choice = confirm("continue sql test?",None)
	if choice:
		while choice:
			createStudent()
			choice = confirm("continue? ", None)
	
main()