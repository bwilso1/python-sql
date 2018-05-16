==== Required Packages ====
-PyMySQL (see requirements.txt for versions)
-Python 2.7 (I'm using 2.7.15  I think 2.7.10+ should be fine)


==== Setup ====
this program assumes 'project insertion script v3.sql' has already been run.


==== Usage: ====
the main program is run with driver.py  no additional flags are needed.

==== Database Login ====
My program should run fine with default values, but if database login needs to be modified,
see myUtils.py  there are global values there at top of file for easy changing.


==== Expected Input ====
This program assumes the end user tries to input acceptable input.

I have basic "press y to continue" catches, but try to have clean input. not all exceptions are handled gracefully.

Please do not try to purchase a negative number of books or things like that.

==== Misc ====
I've tried to make the prompts user-friendly and intuitive.

The only weird one is that to purchase a book, a cart needs to be created, then select that cart to add books & purchase.