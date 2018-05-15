

from myUtils import *
from studentMenu import init_student


def main():
	options = ["init student user module","init support user module", "init admin user module", "run ""quit"]
	choice = 0
	while choice != (len(options) - 1):
		header("Main Menu")
		print("NOTE: database changes are persistent between modules")
		choice = getInput("select option: ", options)
		print("running choice: " + str(options[choice]))
		if choice == 0:
			init_student()
		if choice == 1:
			pauseMessage("not yet implemented...")
		if choice == 2:
			pauseMessage("not yet implemented...")
		if choice == 3:
		



# ----- calling main function -----
main()