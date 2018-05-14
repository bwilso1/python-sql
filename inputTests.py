from myUtils import *
from studentMenu import init_student
from datetime import datetime
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
	print(getLastID('student'))
	print(getLastID('cart'))
	myTup = ( (1,2,3),(4,5,6,7),(8,9,10,11,12))
	print('size' + str(len(myTup)))
	print('size' + str(len(myTup[0])))
	myList = tupleTransform(myTup)
	for row in myList:
		if type(row) is list:
			for elm in row:
				print1(str(elm) + "\t")
		else:
			print row
		print("")

		
	
	

	something = getLastID('student')
	print(str(something) + str(type(something)))
		
	#choice = confirm("Begin init_student?",None)
	choice = True
	while choice:
		init_student()
		choice = confirm("continue? ", None)
	
main()