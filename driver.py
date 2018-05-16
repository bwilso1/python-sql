

from myUtils import *
from studentMenu import init_student
from queriesMenu import init_query_menu
from employeeMenu import init_employee
from adminMenu import init_admin_menu

def main():
	options = ["init student user module","init support user module", "init admin user module", "run queries & reports", "quit"]
	
	
	choice = -1
	while choice != (len(options) - 1):
		header("Main Menu")
		print("NOTE: database changes are persistent between program executions & modules")
		choice = getInput("select option: ", options)
		print("running choice: " + str(options[choice]))
		if choice == 0:
			init_student()
		if choice == 1:
			init_employee()
		if choice == 2:
			init_admin_menu()
		if choice == 3:
			init_query_menu()
		if choice == 4:
			print("")
			
	printPauseMessage("Thank you for using bookfetch...")
	print("end of program...")
		



# ----- calling main function -----
main()