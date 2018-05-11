import pymysql

from myUtils import *
from studentMenu import init_student
import time
pauseLen = 0.75

def main():
	accountTypes = ["student user","support user", "admin", "quit"]
	choice = 0
	while choice != (len(accountTypes) - 1):
		choice = getInput("select User Type ", accountTypes)
		print("running choice: " + str(accountTypes[choice]))
		if choice == 0:
			init_student()



# ----- calling main function -----
main()