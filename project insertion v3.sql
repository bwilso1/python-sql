create database bookfetch;
use bookfetch;
GRANT ALL ON bookfetch.* TO root@'localhost';
use bookfetch;

### --------------- BUILD UNIVERSITY ------------------
CREATE TABLE University(name varchar(30), address varchar(200), contact_fname varchar(50), contact_lname varchar(50), contact_email varchar(100), contact_phone varchar(16), primary key(name));
INSERT INTO University(name, address, contact_fname,contact_lname, contact_email, contact_phone) VALUES ("UMBC","1000 Hilltop Cir, Baltimore, MD 21250", 
"Dominic","Lambert", "dominic.lambert@umbc.edu", "307-555-0183");
INSERT INTO University(name, address, contact_fname,contact_lname, contact_email, contact_phone) VALUES ("Towson","8000 York Rd, Towson, MD 21252",
"Ruth","North", "ruth.north@towson.edu", "307-555-0159");
INSERT INTO University(name, address, contact_fname,contact_lname, contact_email, contact_phone) VALUES ("UMCP", 
"College Park, MD 20742", "Victoria","Murray","victoria.murray@umcp.edu", "307-555-0192");

#---------------- BUILD STUDENT-------------------------
CREATE TABLE Student(id integer, first_name varchar(50), last_name varchar(50), dob date, email varchar(200), address varchar(200), phone varchar(16), school varchar(50), major varchar(30), year varchar(10), status varchar(10), primary key(id), foreign key(school) references university(name));
INSERT INTO Student(id, first_name, last_name, dob, email, address, phone, school, major, year, status) VALUES (1000, "Anthony", "Fortin",  '1986/8/1' , "AnthonyFortin@gmail.com", "6946 Oak Drive, Baltimore", "4155992679", "UMBC", "Computer Science", "2", "UnderGrad");
INSERT INTO Student(id, first_name, last_name, dob, email, address, phone, school, major, year, status) VALUES (1001, "Christopher", "Roy",  '1992/4/24' , "ChristopherRoy@gmail.com", "1131 Third Drive, Baltimore", "4155992672", "Towson", "English", "3", "UnderGrad");
INSERT INTO Student(id, first_name, last_name, dob, email, address, phone, school, major, year, status) VALUES (1002, "Daniel", "Lavoie",  '1987/5/27' , "DanielLavoie@gmail.com", "7283 Sixth Drive, Baltimore", "4155992678", "UMBC", "English", "4", "UnderGrad");
INSERT INTO Student(id, first_name, last_name, dob, email, address, phone, school, major, year, status) VALUES (1003, "James", "Tremblay",  '1992/1/4' , "JamesTremblay@gmail.com", "1866 Second Drive, Baltimore", "4155992671", "Towson", "English", "1", "UnderGrad");
INSERT INTO Student(id, first_name, last_name, dob, email, address, phone, school, major, year, status) VALUES (1004, "John", "Morin",  '1988/3/21' , "JohnMorin@gmail.com", "7644 Main Drive, Baltimore", "4155992677", "Towson", "English", "1", "UnderGrad");
INSERT INTO Student(id, first_name, last_name, dob, email, address, phone, school, major, year, status) VALUES (1005, "Karen", "Pérez",  '1980/1/13' , "KarenPérez@gmail.com", "4974 Washington Drive, Baltimore", "4155992687", "UMCP", "Sociology", "5", "Grad");
INSERT INTO Student(id, first_name, last_name, dob, email, address, phone, school, major, year, status) VALUES (1006, "Kevin", "López",  '1981/9/2' , "KevinLópez@gmail.com", "5233 Elm Drive, Baltimore", "4155992685", "UMBC", "Sociology", "2", "Grad");
INSERT INTO Student(id, first_name, last_name, dob, email, address, phone, school, major, year, status) VALUES (1007, "Laura", "García",  '1984/2/16' , "LauraGarcía@gmail.com", "6103 Maple Drive, Baltimore", "4155992682", "UMBC", "History", "2", "Grad");
INSERT INTO Student(id, first_name, last_name, dob, email, address, phone, school, major, year, status) VALUES (1008, "Leslie", "García",  '1984/2/16' , "LeslieGarcía@gmail.com", "6103 Dancer Drive, Baltimore", "4155992705", "UMBC", "History", "2", "Grad");
INSERT INTO Student(id, first_name, last_name, dob, email, address, phone, school, major, year, status) VALUES (1009, "Lewis", "Rodríguez",  '1980/11/7' , "LewisRodríguez@gmail.com", "5202 View Drive, Baltimore", "4155992775", "UMBC", "Sociology", "3", "Grad");
INSERT INTO Student(id, first_name, last_name, dob, email, address, phone, school, major, year, status) VALUES (1010, "Linda", "Rodríguez",  '1980/11/7' , "LindaRodríguez@gmail.com", "5202 View Drive, Baltimore", "4155992686", "UMBC", "Sociology", "3", "Grad");
INSERT INTO Student(id, first_name, last_name, dob, email, address, phone, school, major, year, status) VALUES (1011, "Lisa", "Bouchard",  '1989/11/9' , "LisaBouchard@gmail.com", "8926 Park Drive, Baltimore", "4155992675", "Towson", "English", "4", "UnderGrad");
INSERT INTO Student(id, first_name, last_name, dob, email, address, phone, school, major, year, status) VALUES (1012, "Mark", "Flores",  '1977/7/30' , "MarkFlores@gmail.com", "4877 Hill Drive, Baltimore", "4155992692", "UMCP", "History", "2", "Grad");
INSERT INTO Student(id, first_name, last_name, dob, email, address, phone, school, major, year, status) VALUES (1013, "Mary", "Côté",  '1990/9/4' , "MaryCôté@gmail.com", "9190 Fourth Drive, Baltimore", "4155992674", "Towson", "English", "3", "UnderGrad");
INSERT INTO Student(id, first_name, last_name, dob, email, address, phone, school, major, year, status) VALUES (1014, "Michael", "Ramírez",  '1978/5/25' , "MichaelRamírez@gmail.com", "4901 Lake Drive, Baltimore", "4155992689", "UMCP", "Sociology", "4", "Grad");
INSERT INTO Student(id, first_name, last_name, dob, email, address, phone, school, major, year, status) VALUES (1015, "Michelle", "Gauthier",  '1989/1/14' , "MichelleGauthier@gmail.com", "8186 Fifth Drive, Baltimore", "4155992676", "Towson", "English", "2", "UnderGrad");
INSERT INTO Student(id, first_name, last_name, dob, email, address, phone, school, major, year, status) VALUES (1016, "Nancy", "Martínez",  '1984/12/11' , "NancyMartínez@gmail.com", "6170 Pine Drive, Baltimore", "4155992681", "UMBC", "History", "4", "Grad");
INSERT INTO Student(id, first_name, last_name, dob, email, address, phone, school, major, year, status) VALUES (1017, "Patricia", "Gagné",  '1985/10/6' , "PatriciaGagné@gmail.com", "6377 Seventh Drive, Baltimore", "4155992680", "UMBC", "Computer Science", "3", "Grad");
INSERT INTO Student(id, first_name, last_name, dob, email, address, phone, school, major, year, status) VALUES (1018, "Paul", "González",  '1982/6/28' , "PaulGonzález@gmail.com", "5524 Eighth Drive, Baltimore", "4155992696", "UMBC", "History", "1", "Grad");
INSERT INTO Student(id, first_name, last_name, dob, email, address, phone, school, major, year, status) VALUES (1019, "Robert", "Hernandez",  '1983/4/23' , "RobertHernandez@gmail.com", "5644 Cedar Drive, Baltimore", "4155992683", "UMBC", "History", "3", "Grad");
INSERT INTO Student(id, first_name, last_name, dob, email, address, phone, school, major, year, status) VALUES (1020, "Ronald", "Gagnon",  '1991/6/30' , "RonaldGagnon@gmail.com", "9898 First Drive, Baltimore", "4155992673", "Towson", "English", "2", "UnderGrad");
INSERT INTO Student(id, first_name, last_name, dob, email, address, phone, school, major, year, status) VALUES (1021, "Sarah", "Sánchez",  '1979/3/20' , "SarahSánchez@gmail.com", "4908 Ninth Drive, Baltimore", "4155992688", "UMCP", "Sociology", "2", "Grad");


#--------------------- BUILD TEACHER -----------------------------------

CREATE TABLE Instructor(id integer, first_name varchar(30), last_name varchar(30), email varchar(100), department varchar(100), school varchar(30), primary key(id),foreign key(school) references university(name));
INSERT INTO Instructor(id, first_name, last_name, email, department, school) VALUES (1001, "Julia", "Lambert", "julia.lambert@towson.edu", "Visual Arts", "Towson");
INSERT INTO Instructor(id, first_name, last_name, email, department, school) VALUES (1002, "Jessica", "Glover", "jessica.glover@umcp.edu", "Visual Arts", "UMCP");
INSERT INTO Instructor(id, first_name, last_name, email, department, school) VALUES (1003, "Connor", "Edmunds", "connor.edmunds@towson.edu", "Mathematics and Statistics", "Towson");
INSERT INTO Instructor(id, first_name, last_name, email, department, school) VALUES (1004, "Ian", "Gibson", "ian.gibson@towson.edu", "Mechanical Engineering", "Towson");
INSERT INTO Instructor(id, first_name, last_name, email, department, school) VALUES (1005, "Alexander", "Clarkson", "alexander.clarkson@umbc.edu", "English Language Institute", "UMBC");
INSERT INTO Instructor(id, first_name, last_name, email, department, school) VALUES (1006, "Felicity", "Buckland", "felicity.buckland@towson.edu", "Management of Aging Services", "Towson");
INSERT INTO Instructor(id, first_name, last_name, email, department, school) VALUES (1007, "Lucas", "Payne", "lucas.payne@towson.edu", "Philosophy", "Towson");
INSERT INTO Instructor(id, first_name, last_name, email, department, school) VALUES (1008, "Emma", "Kelly", "emma.kelly@umbc.edu", "Emergency Health Services", "UMBC");
INSERT INTO Instructor(id, first_name, last_name, email, department, school) VALUES (1009, "Amelia", "Cameron", "amelia.cameron@towson.edu", "Media and Communication Studies", "Towson");
INSERT INTO Instructor(id, first_name, last_name, email, department, school) VALUES (1010, "Isaac", "Anderson", "isaac.anderson@umcp.edu", "Pre-Allied Health", "UMCP");
INSERT INTO Instructor(id, first_name, last_name, email, department, school) VALUES (1011, "Una", "Oliver", "una.oliver@towson.edu", "Music", "Towson");
INSERT INTO Instructor(id, first_name, last_name, email, department, school) VALUES (1012, "Lily", "Burgess", "lily.burgess@towson.edu", "Modern Languages, Linguistics and Intercultural Communication", "Towson");
INSERT INTO Instructor(id, first_name, last_name, email, department, school) VALUES (1013, "Piers", "Gray", "piers.gray@towson.edu", "Judaic Studies", "Towson");
INSERT INTO Instructor(id, first_name, last_name, email, department, school) VALUES (1014, "Harry", "Mills", "harry.mills@umbc.edu", "Computer Science and Electrical Engineering", "UMBC");
INSERT INTO Instructor(id, first_name, last_name, email, department, school) VALUES (1015, "Fiona", "Hamilton", "fiona.hamilton@umbc.edu", "English", "UMBC");
INSERT INTO Instructor(id, first_name, last_name, email, department, school) VALUES (1016, "Yvonne", "Wilkins", "yvonne.wilkins@umbc.edu", "Economics", "UMBC");
INSERT INTO Instructor(id, first_name, last_name, email, department, school) VALUES (1017, "Piers", "Peters", "piers.peters@umcp.edu", "Social Work", "UMCP");
INSERT INTO Instructor(id, first_name, last_name, email, department, school) VALUES (1018, "Hannah", "Bond", "hannah.bond@umcp.edu", "Pre-Law", "UMCP");
INSERT INTO Instructor(id, first_name, last_name, email, department, school) VALUES (1019, "Mary", "Ogden", "mary.ogden@umcp.edu", "Theatre", "UMCP");
INSERT INTO Instructor(id, first_name, last_name, email, department, school) VALUES (1020, "Richard", "Clark", "richard.clark@umcp.edu", "Sociology", "UMCP");
INSERT INTO Instructor(id, first_name, last_name, email, department, school) VALUES (1021, "Colin", "Nolan", "colin.nolan@umcp.edu", "Psychology", "UMCP");
INSERT INTO Instructor(id, first_name, last_name, email, department, school) VALUES (1022, "Sean", "Lee", "sean.lee@umbc.edu", "Dance", "UMBC");
INSERT INTO Instructor(id, first_name, last_name, email, department, school) VALUES (1023, "Leonard", "Wilkins", "leonard.wilkins@umcp.edu", "Pre-Medicine and Pre-Dentistry", "UMCP");
INSERT INTO Instructor(id, first_name, last_name, email, department, school) VALUES (1024, "Stephen", "Manning", "stephen.manning@umbc.edu", "Business Technology Administration", "UMBC");
INSERT INTO Instructor(id, first_name, last_name, email, department, school) VALUES (1025, "Jake", "Jackson", "jake.jackson@umbc.edu", "Chemical, Biochemical & Environmental Engineering", "UMBC");
INSERT INTO Instructor(id, first_name, last_name, email, department, school) VALUES (1026, "Amanda", "Blake", "amanda.blake@umcp.edu", "Religious Studies", "UMCP");
INSERT INTO Instructor(id, first_name, last_name, email, department, school) VALUES (1027, "Justin", "Turner", "justin.turner@umbc.edu", "Education", "UMBC");
INSERT INTO Instructor(id, first_name, last_name, email, department, school) VALUES (1028, "Brian", "Lambert", "brian.lambert@umbc.edu", "Chemistry and Biochemistry", "UMBC");

#--------------------------------- BUILDING COURSES ------------------------
# NOTE: JavaScript generates ID's by Course Name, manually assign new course ID's for classes at different schools or semesters
CREATE TABLE Course(id integer, name varchar(100), department varchar(100), semester varchar(15), year varchar(15), book varchar(100), school varchar(30), primary key(id), foreign key(school) references university(name));
INSERT INTO Course(id, name, department, semester, year, book, school) VALUES (1001, "Acrylic painting", "Visual Arts", "Fall", "3", "978-0321558237", "Towson");
INSERT INTO Course(id, name, department, semester, year, book, school) VALUES (1031, "Acrylic painting", "Visual Arts", "Fall", "4", "978-0321558237", "UMCP");
INSERT INTO Course(id, name, department, semester, year, book, school) VALUES (1002, "linear algebra", "Mathematics and Statistics", "Fall", "2", "978-15066068498", "Towson");
INSERT INTO Course(id, name, department, semester, year, book, school) VALUES (1003, "Wing Design", "Mechanical Engineering", "Fall", "1", "978-16200261595", "Towson");
INSERT INTO Course(id, name, department, semester, year, book, school) VALUES (1004, "English and International Students", "English Language Institute", "Fall", "4", "978-11663489207", "UMBC");
INSERT INTO Course(id, name, department, semester, year, book, school) VALUES (1005, "Health and Age", "Management of Aging Services", "Fall", "4", "978-13931875401", "Towson");
INSERT INTO Course(id, name, department, semester, year, book, school) VALUES (1006, "Ancient Greek Philosophy", "Philosophy", "Fall", "2", "978-20737033983", "Towson");
INSERT INTO Course(id, name, department, semester, year, book, school) VALUES (1007, "Vaccination", "Emergency Health Services", "Fall", "4", "978-9395103013", "UMBC");
INSERT INTO Course(id, name, department, semester, year, book, school) VALUES (1008, "Print Journalism ", "Media and Communication Studies", "Fall", "3", "978-17334454692", "Towson");
INSERT INTO Course(id, name, department, semester, year, book, school) VALUES (1009, "Introduction to Academic Reading", "Pre-Allied Health", "Fall", "2", "978-21871227080", "UMCP");
INSERT INTO Course(id, name, department, semester, year, book, school) VALUES (1010, "Music in Medivial Times", "Music", "Fall", "4", "978-19602840886", "Towson");
INSERT INTO Course(id, name, department, semester, year, book, school) VALUES (1011, "The Field of Intercultural Communication", "Modern Languages, Linguistics and Intercultural Communication", "Fall", "2", "978-18468647789", "Towson");
INSERT INTO Course(id, name, department, semester, year, book, school) VALUES (1012, "Israel and the Ancient Near East", "Judaic Studies", "Fall", "3", "978-12797682304", "Towson");
INSERT INTO Course(id, name, department, semester, year, book, school) VALUES (1013, "Operating System", "Computer Science and Electrical Engineering", "Fall", "4", "978-4858330625", "UMBC");
INSERT INTO Course(id, name, department, semester, year, book, school) VALUES (1014, "Adverbs", "English", "Fall", "2", "978-10529296110", "UMBC");
INSERT INTO Course(id, name, department, semester, year, book, school) VALUES (1015, "Microeconomics", "Economics", "Spring", "3", "978-5992523722", "UMBC");
INSERT INTO Course(id, name, department, semester, year, book, school) VALUES (1016, "History and Philosophy of Social Work and Social Welfare", "Social Work", "Winter", "1", "978-27542192565", "UMCP");
INSERT INTO Course(id, name, department, semester, year, book, school) VALUES (1017, "Music in Ancient Times", "Music", "Fall", "4", "978-13931875402", "Towson");
INSERT INTO Course(id, name, department, semester, year, book, school) VALUES (1018, "Principles of Sociology", "Pre-Law", "Fall", "4", "978-23005420177", "UMCP");
INSERT INTO Course(id, name, department, semester, year, book, school) VALUES (1019, "Production Practicum", "Theatre", "Winter", "3", "978-29810578759", "UMCP");
INSERT INTO Course(id, name, department, semester, year, book, school) VALUES (1020, "Culture in America", "Sociology", "Winter", "4", "978-28676385662", "UMCP");
INSERT INTO Course(id, name, department, semester, year, book, school) VALUES (1021, "Introduction to Psychology", "Psychology", "Winter", "3", "978-25273806371", "UMCP");
INSERT INTO Course(id, name, department, semester, year, book, school) VALUES (1022, "Salsa", "Dance", "Fall", "2", "978-5992523723", "UMBC");
INSERT INTO Course(id, name, department, semester, year, book, school) VALUES (1023, "Rocket Propulsion ", "Mechanical Engineering", "Fall", "1", "978-1563477799", "Towson");
INSERT INTO Course(id, name, department, semester, year, book, school) VALUES (1024, "Human Anatomy", "Pre-Medicine and Pre-Dentistry", "Fall", "1", "978-24139613274", "UMCP");
INSERT INTO Course(id, name, department, semester, year, book, school) VALUES (1025, "Econometrics", "Business Technology Administration", "Winter", "3", "978-1455751334", "UMBC");
INSERT INTO Course(id, name, department, semester, year, book, school) VALUES (1026, "Organic Chemistry", "Chemical, Biochemical & Environmental Engineering", "Winter", "4", "978-2589944431", "UMBC");
INSERT INTO Course(id, name, department, semester, year, book, school) VALUES (1027, "Christianity ", "Religious Studies", "Winter", "2", "978-26407999468", "UMCP");
INSERT INTO Course(id, name, department, semester, year, book, school) VALUES (1028, "Macroeconomics", "Economics", "Fall", "3", "978-7126716819", "UMBC");
INSERT INTO Course(id, name, department, semester, year, book, school) VALUES (1029, "Teaching 101", "Education", "Fall", "2", "978-8260909916", "UMBC");
INSERT INTO Course(id, name, department, semester, year, book, school) VALUES (1030, "Biochemistry", "Chemistry and Biochemistry", "Fall", "2", "978-3724137528", "UMBC");
ALTER TABLE course drop book;


# ------------------------- BUILDING EMPLOYEE -------------------

CREATE TABLE Employee(id integer, first_name varchar(50), last_name varchar(50), email varchar(200), gender varchar(10), salary varchar(20), SSN varchar(20), phone varchar(16), address varchar(200), company varchar(200), role varchar(50), 
primary key (id));
INSERT INTO Employee(id, first_name, last_name, email, gender, salary, SSN, phone, address, company, role) VALUES (1000, "Andrew", "Bower", "andrew.bower@bookfetchinc.com", "Male", "50000", "394-70-2351", "775-555-0105", "2312 M street, NW Suite 503", "bookfetchinc.com", "Administrators");
INSERT INTO Employee(id, first_name, last_name, email, gender, salary, SSN, phone, address, company, role) VALUES (1001, "Anne", "Stewart", "anne.stewart@bookfetchinc.com", "Female", "20000", "520-70-7858", "775-555-0130", "201 Hospital Drive", "bookfetchinc.com", "Customer Support");
INSERT INTO Employee(id, first_name, last_name, email, gender, salary, SSN, phone, address, company, role) VALUES (1002, "Anthony", "Grant", "anthony.grant@bookfetchinc.com", "Male", "50000", "394-70-2355", "775-555-0105", "2315 M street, NW Suite 503", "bookfetchinc.com", "Administrators");
INSERT INTO Employee(id, first_name, last_name, email, gender, salary, SSN, phone, address, company, role) VALUES (1003, "Austin", "Morgan", "austin.morgan@bookfetchinc.com", "Male", "20000", "530-70-2952", "775-555-0127", "2223 Canterbury Drive", "bookfetchinc.com", "Customer Support");
INSERT INTO Employee(id, first_name, last_name, email, gender, salary, SSN, phone, address, company, role) VALUES (1004, "Benjamin", "Vaughan", "benjamin.vaughan@bookfetchinc.com", "Male", "50000", "768-32-1434", "775-555-0189", "2550 Livingston Road", "bookfetchinc.com", "SuperAdministrators");
INSERT INTO Employee(id, first_name, last_name, email, gender, salary, SSN, phone, address, company, role) VALUES (1005, "Benjamin", "Dyer", "benjamin.dyer@bookfetchinc.com", "Male", "60000", "394-70-2354", "775-555-0106", "308 Langdon Street", "bookfetchinc.com", "Administrators");
INSERT INTO Employee(id, first_name, last_name, email, gender, salary, SSN, phone, address, company, role) VALUES (1006, "Boris", "McGrath", "boris.mcgrath@bookfetchinc.com", "Male", "20000", "394-70-1951", "775-555-0197", "2 West Lakeshore Drive", "bookfetchinc.com", "Customer Support");
INSERT INTO Employee(id, first_name, last_name, email, gender, salary, SSN, phone, address, company, role) VALUES (1007, "Caroline", "Roberts", "caroline.roberts@bookfetchinc.com", "Female", "20000", "520-70-7859", "775-555-0143", "1001 East 100 North", "bookfetchinc.com", "Customer Support");
INSERT INTO Employee(id, first_name, last_name, email, gender, salary, SSN, phone, address, company, role) VALUES (1008, "Connor", "Black", "connor.black@bookfetchinc.com", "Male", "50000", "394-70-2350", "775-555-0158", "305 Langdon Street", "bookfetchinc.com", "Administrators");
INSERT INTO Employee(id, first_name, last_name, email, gender, salary, SSN, phone, address, company, role) VALUES (1009, "Dan", "Martin", "dan.martin@bookfetchinc.com", "Male", "20000", "530-70-2948", "775-555-0171", "1 West Lakeshore Drive", "bookfetchinc.com", "Customer Support");
INSERT INTO Employee(id, first_name, last_name, email, gender, SSN, phone, address, company, role) VALUES (1010, "Dominic", "Lambert", "dominic.lambert@umbc.edu", "Male", "307-55-0183", "307-555-0183", "1000 Hilltop Cir, Baltimore, MD 21250", "UMBC", "College Rep");
INSERT INTO Employee(id, first_name, last_name, email, gender, salary, SSN, phone, address, company, role) VALUES (1011, "Donna", "Scott", "donna.scott@bookfetchinc.com", "Female", "50000", "768-32-1433", "775-555-0112", "102 South 1st Street", "bookfetchinc.com", "Administrators");
INSERT INTO Employee(id, first_name, last_name, email, gender, salary, SSN, phone, address, company, role) VALUES (1012, "Heather", "Powell", "heather.powell@bookfetchinc.com", "Female", "50000", "768-32-1432", "775-555-0104", "2311 M street, NW Suite 503", "bookfetchinc.com", "Administrators");
INSERT INTO Employee(id, first_name, last_name, email, gender, salary, SSN, phone, address, company, role) VALUES (1013, "Jack", "Chapman", "jack.chapman@bookfetchinc.com", "Male", "60000", "234-45-1936", "775-555-0197", "104 South 1st Street", "bookfetchinc.com", "Administrators");
INSERT INTO Employee(id, first_name, last_name, email, gender, salary, SSN, phone, address, company, role) VALUES (1014, "Jack", "Allan", "jack.allan@bookfetchinc.com", "Male", "20000", "520-70-7855", "775-555-0145", "2221 Canterbury Drive", "bookfetchinc.com", "Customer Support");
INSERT INTO Employee(id, first_name, last_name, email, gender, salary, SSN, phone, address, company, role) VALUES (1015, "James", "White", "james.white@bookfetchinc.com", "Male", "50000", "394-70-2352", "775-555-0199", "103 South 1st Street", "bookfetchinc.com", "Administrators");
INSERT INTO Employee(id, first_name, last_name, email, gender, salary, SSN, phone, address, company, role) VALUES (1016, "James", "Bell", "james.bell@bookfetchinc.com", "Male", "60000", "768-32-1437", "775-555-0196", "105 South 1st Street", "bookfetchinc.com", "Administrators");
INSERT INTO Employee(id, first_name, last_name, email, gender, salary, SSN, phone, address, company, role) VALUES (1017, "Joan", "Lawrence", "joan.lawrence@bookfetchinc.com", "Male", "20000", "520-70-7856", "775-555-0142", "2222 Canterbury Drive", "bookfetchinc.com", "Customer Support");
INSERT INTO Employee(id, first_name, last_name, email, gender, salary, SSN, phone, address, company, role) VALUES (1018, "Joshua", "Vaughan", "joshua.vaughan@bookfetchinc.com", "Male", "20000", "530-70-2949", "775-555-0172", "2 West Lakeshore Drive", "bookfetchinc.com", "Customer Support");
INSERT INTO Employee(id, first_name, last_name, email, gender, salary, SSN, phone, address, company, role) VALUES (1019, "Joshua", "Lee", "joshua.lee@bookfetchinc.com", "Male", "20000", "394-70-1952", "775-555-0127", "3 West Lakeshore Drive", "bookfetchinc.com", "Customer Support");
INSERT INTO Employee(id, first_name, last_name, email, gender, salary, SSN, phone, address, company, role) VALUES (1020, "Julian", "Rees", "julian.rees@bookfetchinc.com", "Female", "20000", "394-70-1948", "775-555-0193", "600 Caisson Hill Road", "bookfetchinc.com", "Customer Support");
INSERT INTO Employee(id, first_name, last_name, email, gender, salary, SSN, phone, address, company, role) VALUES (1021, "Karen", "Parsons", "karen.parsons@bookfetchinc.com", "Female", "20000", "530-70-2950", "775-555-0191", "2221 Canterbury Drive", "bookfetchinc.com", "Customer Support");
INSERT INTO Employee(id, first_name, last_name, email, gender, salary, SSN, phone, address, company, role) VALUES (1022, "Kevin", "Carr", "kevin.carr@bookfetchinc.com", "Male", "40000", "530-70-2953", "775-555-0172", "602 Caisson Hill Road", "bookfetchinc.com", "Customer Support");
INSERT INTO Employee(id, first_name, last_name, email, gender, salary, SSN, phone, address, company, role) VALUES (1023, "Lauren", "Mathis", "lauren.mathis@bookfetchinc.com", "Female", "20000", "520-70-7854", "775-555-0175", "2220 Canterbury Drive", "bookfetchinc.com", "Customer Support");
INSERT INTO Employee(id, first_name, last_name, email, gender, salary, SSN, phone, address, company, role) VALUES (1024, "Lauren", "Tucker", "lauren.tucker@bookfetchinc.com", "Female", "40000", "520-70-7860", "775-555-0152", "3 West Lakeshore Drive", "bookfetchinc.com", "Customer Support");
INSERT INTO Employee(id, first_name, last_name, email, gender, salary, SSN, phone, address, company, role) VALUES (1025, "Lily", "Randall", "lily.randall@bookfetchinc.com", "Female", "50000", "234-45-1933", "775-555-0192", "2549 Livingston Road", "bookfetchinc.com", "Administrators");
INSERT INTO Employee(id, first_name, last_name, email, gender, salary, SSN, phone, address, company, role) VALUES (1026, "Lucas", "Rampling", "lucas.rampling@bookfetchinc.com", "Male", "20000", "530-70-2951", "775-555-0188", "2222 Canterbury Drive", "bookfetchinc.com", "Customer Support");
INSERT INTO Employee(id, first_name, last_name, email, gender, salary, SSN, phone, address, company, role) VALUES (1027, "Neil", "Hodges", "neil.hodges@bookfetchinc.com", "Male", "60000", "394-70-2353", "775-555-0175", "2551 Livingston Road", "bookfetchinc.com", "Administrators");
INSERT INTO Employee(id, first_name, last_name, email, gender, salary, SSN, phone, address, company, role) VALUES (1028, "Nicola", "Simpson", "nicola.simpson@bookfetchinc.com", "Female", "20000", "520-70-7857", "775-555-0164", "601 Caisson Hill Road", "bookfetchinc.com", "Customer Support");
INSERT INTO Employee(id, first_name, last_name, email, gender, salary, SSN, phone, address, company, role) VALUES (1029, "Nicola", "Roberts", "nicola.roberts@bookfetchinc.com", "Female", "40000", "394-70-1954", "775-555-0198", "2223 Canterbury Drive", "bookfetchinc.com", "Customer Support");
INSERT INTO Employee(id, first_name, last_name, email, gender, salary, SSN, phone, address, company, role) VALUES (1030, "Penelope", "Ferguson", "penelope.ferguson@bookfetchinc.com", "Female", "50000", "234-45-1932", "775-555-0118", "101 South 1st Street", "bookfetchinc.com", "Administrators");
INSERT INTO Employee(id, first_name, last_name, email, gender, salary, SSN, phone, address, company, role) VALUES (1031, "Peter", "Rees", "peter.rees@bookfetchinc.com", "Male", "50000", "234-45-1935", "775-555-0150", "2313 M street, NW Suite 503", "bookfetchinc.com", "Administrators");
INSERT INTO Employee(id, first_name, last_name, email, gender, salary, SSN, phone, address, company, role) VALUES (1032, "Peter", "Clarkson", "peter.clarkson@bookfetchinc.com", "Male", "20000", "394-70-1949", "775-555-0167", "200 Hospital Drive", "bookfetchinc.com", "Customer Support");
INSERT INTO Employee(id, first_name, last_name, email, gender, salary, SSN, phone, address, company, role) VALUES (1033, "Phil", "Skinner", "phil.skinner@bookfetchinc.com", "Male", "60000", "234-45-1937", "775-555-0197", "2552 Livingston Road", "bookfetchinc.com", "Administrators");
INSERT INTO Employee(id, first_name, last_name, email, gender, salary, SSN, phone, address, company, role) VALUES (1034, "Rachel", "Ball", "rachel.ball@bookfetchinc.com", "Female", "50000", "234-45-1934", "775-555-0162", "306 Langdon Street", "bookfetchinc.com", "Administrators");
INSERT INTO Employee(id, first_name, last_name, email, gender, SSN, phone, address, company, role) VALUES (1035, "Ruth", "North", "ruth.north@towson.edu", "Female", "307-55-0159", "307-555-0159", "8000 York Rd, Towson, MD 21252", "Towson", "College Rep");
INSERT INTO Employee(id, first_name, last_name, email, gender, salary, SSN, phone, address, company, role) VALUES (1036, "Ryan", "Robertson", "ryan.robertson@bookfetchinc.com", "Male", "20000", "394-70-1950", "775-555-0141", "1000 East 100 North", "bookfetchinc.com", "Customer Support");
INSERT INTO Employee(id, first_name, last_name, email, gender, salary, SSN, phone, address, company, role) VALUES (1037, "Sean", "Berry", "sean.berry@bookfetchinc.com", "Male", "50000", "234-45-1938", "775-555-0130", "309 Langdon Street", "bookfetchinc.com", "Administrators");
INSERT INTO Employee(id, first_name, last_name, email, gender, salary, SSN, phone, address, company, role) VALUES (1038, "Stephanie", "Clarkson", "stephanie.clarkson@bookfetchinc.com", "Female", "50000", "768-32-1435", "775-555-0185", "307 Langdon Street", "bookfetchinc.com", "Administrators");
INSERT INTO Employee(id, first_name, last_name, email, gender, salary, SSN, phone, address, company, role) VALUES (1039, "Tracey", "Ogden", "tracey.ogden@bookfetchinc.com", "Female", "60000", "768-32-1436", "775-555-0128", "2314 M street, NW Suite 503", "bookfetchinc.com", "Administrators");
INSERT INTO Employee(id, first_name, last_name, email, gender, salary, SSN, phone, address, company, role) VALUES (1040, "Victor", "Hill", "victor.hill@bookfetchinc.com", "Male", "50000", "394-70-2349", "775-555-0176", "2548 Livingston Road", "bookfetchinc.com", "Administrators");
INSERT INTO Employee(id, first_name, last_name, email, gender, SSN, phone, address, company, role) VALUES (1041, "Victoria", "Murray", "victoria.murray@umcp.edu", "Female", "307-55-0192", "307-555-0192", "College Park, MD 20742", "UMCP", "College Rep");
INSERT INTO Employee(id, first_name, last_name, email, gender, salary, SSN, phone, address, company, role) VALUES (1042, "Zoe", "Sharp", "zoe.sharp@bookfetchinc.com", "Female", "40000", "394-70-1953", "775-555-0172", "2222 Canterbury Drive", "bookfetchinc.com", "Customer Support");

#---------------------------------------- BULDING DEPENDENT TABLES---------------------------------
# All tables below pull almost exlcusive foreign keys from above 


#-------------------------- BULIDING TAKES
#               table is empty, prob not needed.
CREATE TABLE Takes(course_id integer, student_id integer, foreign key(course_id) references course(id),foreign key(student_id) references student(id));


#---------------------------------------- BUILDING TEACHES------------------
CREATE TABLE Teaches(id integer, inst_email varchar(100), course_id integer, course_name varchar(100), foreign key(course_id) references course(id), foreign key(id) references instructor(id));
INSERT INTO Teaches(id, inst_email, course_id, course_name) VALUES (1001, "julia.lambert@towson.edu", 1001, "Acrylic painting");
INSERT INTO Teaches(id, inst_email, course_id, course_name) VALUES (1002, "jessica.glover@umcp.edu", 1031, "Acrylic painting");
INSERT INTO Teaches(id, inst_email, course_id, course_name) VALUES (1003, "connor.edmunds@towson.edu", 1002, "linear algebra");
INSERT INTO Teaches(id, inst_email, course_id, course_name) VALUES (1004, "ian.gibson@towson.edu", 1003, "Wing Design");
INSERT INTO Teaches(id, inst_email, course_id, course_name) VALUES (1005, "alexander.clarkson@umbc.edu", 1004, "English and International Students");
INSERT INTO Teaches(id, inst_email, course_id, course_name) VALUES (1006, "felicity.buckland@towson.edu", 1005, "Health and Age");
INSERT INTO Teaches(id, inst_email, course_id, course_name) VALUES (1007, "lucas.payne@towson.edu", 1006, "Ancient Greek Philosophy");
INSERT INTO Teaches(id, inst_email, course_id, course_name) VALUES (1008, "emma.kelly@umbc.edu", 1007, "Vaccination");
INSERT INTO Teaches(id, inst_email, course_id, course_name) VALUES (1009, "amelia.cameron@towson.edu", 1008, "Print Journalism ");
INSERT INTO Teaches(id, inst_email, course_id, course_name) VALUES (1010, "isaac.anderson@umcp.edu", 1009, "Introduction to Academic Reading");
INSERT INTO Teaches(id, inst_email, course_id, course_name) VALUES (1011, "una.oliver@towson.edu", 1010, "Music in Medivial Times");
INSERT INTO Teaches(id, inst_email, course_id, course_name) VALUES (1012, "lily.burgess@towson.edu", 1011, "The Field of Intercultural Communication");
INSERT INTO Teaches(id, inst_email, course_id, course_name) VALUES (1013, "piers.gray@towson.edu", 1012, "Israel and the Ancient Near East");
INSERT INTO Teaches(id, inst_email, course_id, course_name) VALUES (1014, "harry.mills@umbc.edu", 1013, "Operating System");
INSERT INTO Teaches(id, inst_email, course_id, course_name) VALUES (1015, "fiona.hamilton@umbc.edu", 1014, "Adverbs");
INSERT INTO Teaches(id, inst_email, course_id, course_name) VALUES (1016, "yvonne.wilkins@umbc.edu", 1015, "Microeconomics");
INSERT INTO Teaches(id, inst_email, course_id, course_name) VALUES (1017, "piers.peters@umcp.edu", 1016, "History and Philosophy of Social Work and Social Welfare");
INSERT INTO Teaches(id, inst_email, course_id, course_name) VALUES (1011, "una.oliver@towson.edu", 1017, "Music in Ancient Times");
INSERT INTO Teaches(id, inst_email, course_id, course_name) VALUES (1018, "hannah.bond@umcp.edu", 1018, "Principles of Sociology");
INSERT INTO Teaches(id, inst_email, course_id, course_name) VALUES (1019, "mary.ogden@umcp.edu", 1019, "Production Practicum");
INSERT INTO Teaches(id, inst_email, course_id, course_name) VALUES (1020, "richard.clark@umcp.edu", 1020, "Culture in America");
INSERT INTO Teaches(id, inst_email, course_id, course_name) VALUES (1021, "colin.nolan@umcp.edu", 1021, "Introduction to Psychology");
INSERT INTO Teaches(id, inst_email, course_id, course_name) VALUES (1022, "sean.lee@umbc.edu", 1022, "Salsa");
INSERT INTO Teaches(id, inst_email, course_id, course_name) VALUES (1004, "ian.gibson@towson.edu", 1023, "Rocket Propulsion ");
INSERT INTO Teaches(id, inst_email, course_id, course_name) VALUES (1023, "leonard.wilkins@umcp.edu", 1024, "Human Anatomy");
INSERT INTO Teaches(id, inst_email, course_id, course_name) VALUES (1024, "stephen.manning@umbc.edu", 1025, "Econometrics");
INSERT INTO Teaches(id, inst_email, course_id, course_name) VALUES (1025, "jake.jackson@umbc.edu", 1026, "Organic Chemistry");
INSERT INTO Teaches(id, inst_email, course_id, course_name) VALUES (1026, "amanda.blake@umcp.edu", 1027, "Christianity ");
INSERT INTO Teaches(id, inst_email, course_id, course_name) VALUES (1016, "yvonne.wilkins@umbc.edu", 1028, "Macroeconomics");
INSERT INTO Teaches(id, inst_email, course_id, course_name) VALUES (1027, "justin.turner@umbc.edu", 1029, "Teaching 101");
INSERT INTO Teaches(id, inst_email, course_id, course_name) VALUES (1028, "brian.lambert@umbc.edu", 1030, "Biochemistry");

ALTER TABLE teaches drop inst_email;
ALTER TABLE teaches drop course_name;
ALTER TABLE teaches CHANGE COLUMN `id` `instructor_id` integer;


##-------------------- CREATE BOOK CLASS -----------------------
CREATE TABLE BookClass(ISBN13 varchar(20), ISBN varchar(20), title varchar(200), author varchar(50), publish_date integer, keywords varchar(300), weight float, score float, publisher varchar(50), language varchar(50), ed_number integer, category varchar(200), 
primary key(ISBN13));
INSERT INTO BookClass(ISBN13, ISBN, title, author, publish_date, keywords, weight, score, publisher, language, ed_number, category) VALUES ("978-0321558237", "321558235", "Acrylic Painting Step by Step: Discover all the basics and a range of special techniques for creating your own masterpieces in acrylic", "Tom Swimm", 2009, "Tom Swimm Acrylic Painting Step by Step: Discover all the basics and a range of special techniques for creating your own masterpieces in acrylic Acrylic painting", "0.3", 4.5, "Benjamin Cummings", "English", 9, "Visual Arts,Acrylic painting");
INSERT INTO BookClass(ISBN13, ISBN, title, author, publish_date, keywords, weight, score, publisher, language, ed_number, category) VALUES ("978-15066068498", "15672234225", "linear algebra", "Ron Larson", 2002, "Ron Larson linear algebra linear algebra", "0.43", 3.5, "Saunders", "English", 4, "Mathematics and Statistics,linear algebra");
INSERT INTO BookClass(ISBN13, ISBN, title, author, publish_date, keywords, weight, score, publisher, language, ed_number, category) VALUES ("978-16200261595", "16853055455", "Understanding Flight", "Scott Eberhardt", 2001, "Scott Eberhardt Understanding Flight Wing Design", "0.23", 3, "Touchstone", "English", 4, "Mechanical Engineering,Wing Design");
INSERT INTO BookClass(ISBN13, ISBN, title, author, publish_date, keywords, weight, score, publisher, language, ed_number, category) VALUES ("978-11663489207", "12129770535", "English Made Easy Volume One: Learning English through Pictures", "Jonathan Crichton", 2002, "Jonathan Crichton English Made Easy Volume One: Learning English through Pictures English and International Students", "0.8", 4, "Worth Publishers", "English", 5, "English Language Institute,English and International Students");
INSERT INTO BookClass(ISBN13, ISBN, title, author, publish_date, keywords, weight, score, publisher, language, ed_number, category) VALUES ("978-13931875401", "14491412995", "The New Politics of Old Age Policy", "Robert B. Hudson", 2002, "Robert B. Hudson The New Politics of Old Age Policy Health and Age", "0.56", 4.5, "Plume", "English", 4, "Management of Aging Services,Health and Age");
INSERT INTO BookClass(ISBN13, ISBN, title, author, publish_date, keywords, weight, score, publisher, language, ed_number, category) VALUES ("978-20737033983", "21576340375", "Ancient Greek Philosophy: From the Presocratics to the Hellenistic Philosophers", "Thomas A. Blackson", 1995, "Thomas A. Blackson Ancient Greek Philosophy: From the Presocratics to the Hellenistic Philosophers Ancient Greek Philosophy", "0.3", 4, "Benjamin Cummings", "English", 3, "Philosophy,Ancient Greek Philosophy");
INSERT INTO BookClass(ISBN13, ISBN, title, author, publish_date, keywords, weight, score, publisher, language, ed_number, category) VALUES ("978-9395103013", "9768128075", "Epidemiology and Prevention of Vaccine-Preventable Diseases", "William Atkinson, Charles (Skip) Wolfe", 2002, "William Atkinson, Charles (Skip) Wolfe Epidemiology and Prevention of Vaccine-Preventable Diseases Vaccination", "0.9", 4, "Touchstone", "English", 5, "Emergency Health Services,Vaccination");
INSERT INTO BookClass(ISBN13, ISBN, title, author, publish_date, keywords, weight, score, publisher, language, ed_number, category) VALUES ("978-17334454692", "18033876685", "Fearless Editing: Crafting Words and Images for Print, Web, and Public Relations", "Carolyn Dale", 1993, "Carolyn Dale Fearless Editing: Crafting Words and Images for Print, Web, and Public Relations Print Journalism ", "0.6", 3.5, "Benjamin Cummings", "English", 4, "Media and Communication Studies,Print Journalism ");
INSERT INTO BookClass(ISBN13, ISBN, title, author, publish_date, keywords, weight, score, publisher, language, ed_number, category) VALUES ("978-21871227080", "22757161605", "Pearson Textbook Reader: Reading in Applied and Academic Fields", "Dawn Lee", 1990, "Dawn Lee Pearson Textbook Reader: Reading in Applied and Academic Fields Introduction to Academic Reading", "0.9", 4, "McDougal Littel", "English", 3, "Pre-Allied Health,Introduction to Academic Reading");
INSERT INTO BookClass(ISBN13, ISBN, title, author, publish_date, keywords, weight, score, publisher, language, ed_number, category) VALUES ("978-19602840886", "20395519145", "The Development of Western Music: A History", "K Stolba", 1987, "K Stolba The Development of Western Music: A History Music in Medivial Times", "0.4", 4.5, "Mosby", "English", 6, "Music,Music in Medivial Times");
INSERT INTO BookClass(ISBN13, ISBN, title, author, publish_date, keywords, weight, score, publisher, language, ed_number, category) VALUES ("978-18468647789", "19214697915", "Understanding Intercultural Communication", "Stella Ting-Toomey", 1996, "Stella Ting-Toomey Understanding Intercultural Communication The Field of Intercultural Communication", "0.3", 4.5, "Jerry Wyant", "English", 4, "Modern Languages, Linguistics and Intercultural Communication,The Field of Intercultural Communication");
INSERT INTO BookClass(ISBN13, ISBN, title, author, publish_date, keywords, weight, score, publisher, language, ed_number, category) VALUES ("978-12797682304", "13310591765", "A Conceptual Approach to the Mekilta", "Max Kadushin", 2002, "Max Kadushin A Conceptual Approach to the Mekilta Israel and the Ancient Near East", "1.933333333", 4.5, "Mosby", "English", 5, "Judaic Studies,Israel and the Ancient Near East");
INSERT INTO BookClass(ISBN13, ISBN, title, author, publish_date, keywords, weight, score, publisher, language, ed_number, category) VALUES ("978-4858330625", "5044843155", "Modern Operating Systems", "Andrew S. Tanenbaum", 2009, "Andrew S. Tanenbaum Modern Operating Systems Operating System", "0.883333333", 3, "Plume", "English", 5, "Computer Science and Electrical Engineering,Operating System");
INSERT INTO BookClass(ISBN13, ISBN, title, author, publish_date, keywords, weight, score, publisher, language, ed_number, category) VALUES ("978-10529296110", "10948949305", "McGraw-Hill Handbook of English Grammar and Usage", "Larry Beason", 2002, "Larry Beason McGraw-Hill Handbook of English Grammar and Usage Adverbs", "0.8", 4, "Benjamin Cummings", "English", 5, "English,Adverbs");
INSERT INTO BookClass(ISBN13, ISBN, title, author, publish_date, keywords, weight, score, publisher, language, ed_number, category) VALUES ("978-5992523722", "18742369423", "Principles of Economics", "N. Gregory Mankiw", 1993, "N. Gregory Mankiw Principles of Economics Microeconomics", "1", 4.5, "Cengage Learning", "English", 6, "Economics,Microeconomics");
INSERT INTO BookClass(ISBN13, ISBN, title, author, publish_date, keywords, weight, score, publisher, language, ed_number, category) VALUES ("978-27542192565", "28661267755", "Ethical Issues in Social Work (Professional Ethics)", "Richard Hugman", 2003, "Richard Hugman Ethical Issues in Social Work (Professional Ethics) History and Philosophy of Social Work and Social Welfare", "0", 3.5, "Amazon Digital Services, Inc.", "English", 2, "Social Work,History and Philosophy of Social Work and Social Welfare");
INSERT INTO BookClass(ISBN13, ISBN, title, author, publish_date, keywords, weight, score, publisher, language, ed_number, category) VALUES ("978-13931875402", "19568944284", "Music in Ancient Greece and Rome", "John G Landels", 2001, "John G Landels Music in Ancient Greece and Rome Music in Ancient Times", "2", 3, "McDougal Littel", "English", 1, "Music,Music in Ancient Times");
INSERT INTO BookClass(ISBN13, ISBN, title, author, publish_date, keywords, weight, score, publisher, language, ed_number, category) VALUES ("978-23005420177", "23937982835", "Sociology: A Brief Introduction", "Richard T. Schaefer", 1993, "Richard T. Schaefer Sociology: A Brief Introduction Principles of Sociology", "0", 4, "Amazon Digital Services, Inc.", "English", 3, "Pre-Law,Principles of Sociology");
INSERT INTO BookClass(ISBN13, ISBN, title, author, publish_date, keywords, weight, score, publisher, language, ed_number, category) VALUES ("978-1592575121", "1592575129", "The Humongous Book of linear algebra Problems", "Michael Kelley", 2007, "Michael Kelley The Humongous Book of linear algebra Problems linear algebra", "3", 3, "ALPHA", "English", 1, "Mathematics and Statistics,linear algebra");
INSERT INTO BookClass(ISBN13, ISBN, title, author, publish_date, keywords, weight, score, publisher, language, ed_number, category) VALUES ("978-29810578759", "31022910215", "The Art of Theatrical Design: Elements of Visual Composition, Methods, and Practice", "Kaoime Malloy", 2012, "Kaoime Malloy The Art of Theatrical Design: Elements of Visual Composition, Methods, and Practice Production Practicum", "0", 4.5, "Amazon Digital Services, Inc.", "English", 2, "Theatre,Production Practicum");
INSERT INTO BookClass(ISBN13, ISBN, title, author, publish_date, keywords, weight, score, publisher, language, ed_number, category) VALUES ("978-28676385662", "29842088985", "Lies My Teacher Told Me: Everything Your American History Textbook Got Wrong", "James W. Loewen", 2001, "James W. Loewen Lies My Teacher Told Me: Everything Your American History Textbook Got Wrong Culture in America", "0", 3.5, "Amazon Digital Services, Inc.", "English", 2, "Sociology,Culture in America");
INSERT INTO BookClass(ISBN13, ISBN, title, author, publish_date, keywords, weight, score, publisher, language, ed_number, category) VALUES ("978-25273806371", "26299625295", "Psychology", "David G. Myers", 2005, "David G. Myers Psychology Introduction to Psychology", "0", 2.5, "Amazon Digital Services, Inc.", "English", 3, "Psychology,Introduction to Psychology");
INSERT INTO BookClass(ISBN13, ISBN, title, author, publish_date, keywords, weight, score, publisher, language, ed_number, category) VALUES ("978-5992523723", "6225664385", "The Great Salsa Book", "Mark Miller", 2006, "Mark Miller The Great Salsa Book Salsa", "0.8", 4.5, "Mosby", "English", 5, "Dance,Salsa");
INSERT INTO BookClass(ISBN13, ISBN, title, author, publish_date, keywords, weight, score, publisher, language, ed_number, category) VALUES ("978-1563477799", "1563477793", "Elements of Propulsion: Gas Turbines and Rockets", "J Mattingly", 2006, "J Mattingly Elements of Propulsion: Gas Turbines and Rockets Rocket Propulsion ", "4", 4, "Aiaa", "English", 4, "Mechanical Engineering,Rocket Propulsion ");
INSERT INTO BookClass(ISBN13, ISBN, title, author, publish_date, keywords, weight, score, publisher, language, ed_number, category) VALUES ("978-24139613274", "25118804065", "Guyton and Hall Textbook of Medical Physiology", "John E. Hall", 1999, "John E. Hall Guyton and Hall Textbook of Medical Physiology Human Anatomy", "0", 3.5, "Amazon Digital Services, Inc.", "English", 3, "Pre-Medicine and Pre-Dentistry,Human Anatomy");
INSERT INTO BookClass(ISBN13, ISBN, title, author, publish_date, keywords, weight, score, publisher, language, ed_number, category) VALUES ("978-1455751334", "1502379465", "Applied Econometrics", "Dimitrios Asteriou", 2008, "Dimitrios Asteriou Applied Econometrics Econometrics", "0.4", 4, "Saunders", "English", 8, "Business Technology Administration,Econometrics");
INSERT INTO BookClass(ISBN13, ISBN, title, author, publish_date, keywords, weight, score, publisher, language, ed_number, category) VALUES ("978-2589944431", "2683200695", "Organic Chemistry", "John E. McMurry", 1967, "John E. McMurry Organic Chemistry Organic Chemistry", "0.6", 4, "McDougal Littel", "English", 1, "Chemical, Biochemical & Environmental Engineering,Organic Chemistry");
INSERT INTO BookClass(ISBN13, ISBN, title, author, publish_date, keywords, weight, score, publisher, language, ed_number, category) VALUES ("978-26407999468", "27480446525", "Christianity 101: A Textbook of Catholic Theology", "Gregory C. Higgins", 2001, "Gregory C. Higgins Christianity 101: A Textbook of Catholic Theology Christianity ", "0", 3, "Amazon Digital Services, Inc.", "English", 2, "Religious Studies,Christianity ");
INSERT INTO BookClass(ISBN13, ISBN, title, author, publish_date, keywords, weight, score, publisher, language, ed_number, category) VALUES ("978-0470080245", "9470080248", "Rocket Propulsion Elements", "George Sutton", 2010, "George Sutton Rocket Propulsion Elements Rocket Propulsion ", "4", 5, "Wiley", "English", 8, "Mechanical Engineering,Rocket Propulsion ");
INSERT INTO BookClass(ISBN13, ISBN, title, author, publish_date, keywords, weight, score, publisher, language, ed_number, category) VALUES ("978-7126716819", "7406485615", "Basic Economics for Students and Non-Students Alike", "Jerry Wyant", 2004, "Jerry Wyant Basic Economics for Students and Non-Students Alike Macroeconomics", "0.8", 4, "Benjamin Cummings", "English", 5, "Economics,Macroeconomics");
INSERT INTO BookClass(ISBN13, ISBN, title, author, publish_date, keywords, weight, score, publisher, language, ed_number, category) VALUES ("978-8260909916", "8587306845", "Child Development: An Introduction", "John Santrock", 2001, "John Santrock Child Development: An Introduction Teaching 101", "0.8", 4, "Jerry Wyant", "English", 5, "Education,Teaching 101");
INSERT INTO BookClass(ISBN13, ISBN, title, author, publish_date, keywords, weight, score, publisher, language, ed_number, category) VALUES ("978-3724137528", "3864021925", "Textbook of Biochemistry with Clinical Correlations", "Thomas M. Devlin", 1991, "Thomas M. Devlin Textbook of Biochemistry with Clinical Correlations Biochemistry", "0.733333333", 4.5, "Saunders", "English", 5, "Chemistry and Biochemistry,Biochemistry");
INSERT INTO BookClass(ISBN13, ISBN, title, author, publish_date, keywords, weight, score, publisher, language, ed_number, category) VALUES ("978-1476770383", "1476770387", "Revival: A Novel", "Stephen King", 2014, "Stephen King Revival: A Novel ", "0.5", 3, "Scribner", "English", 1, "Fiction, Thriller");
INSERT INTO BookClass(ISBN13, ISBN, title, author, publish_date, keywords, weight, score, publisher, language, ed_number, category) VALUES ("978-0307743657", "1476444387", "The shining", "Stephen King", 2012, "Stephen King The shining ", "0.45", 4, "Anchor", "English", 3, "Fiction, Thriller");

ALTER TABLE bookclass drop category;
#---------------------- BUILD BOOKS (inventory) -----------------------------


CREATE TABLE Book(inventory_id integer NOT NULL auto_increment, ISBN13 varchar(20), quality varchar(15), cost varchar(10), format varchar(50), quantity integer, 
primary key(inventory_id), foreign key(ISBN13) references bookclass(ISBN13));
INSERT INTO Book(ISBN13, quality, format, quantity) VALUES ("978-0321558237", "new", "hardcover", 6);
INSERT INTO Book(ISBN13, quality, format, quantity) VALUES ("978-15066068498", "old", "paperback", 6);
INSERT INTO Book(ISBN13, quality, format, quantity) VALUES ("978-16200261595", "old", "paperback", 6);
INSERT INTO Book(ISBN13, quality, format, quantity) VALUES ("978-11663489207", "new", "paperback", 6);
INSERT INTO Book(ISBN13, quality, format, quantity) VALUES ("978-13931875401", "old", "paperback", 6);
INSERT INTO Book(ISBN13, quality, format, quantity) VALUES ("978-20737033983", "old", "paperback", 6);
INSERT INTO Book(ISBN13, quality, format, quantity) VALUES ("978-9395103013", "new", "hardcover", 6);
INSERT INTO Book(ISBN13, quality, format, quantity) VALUES ("978-17334454692", "old", "paperback", 6);
INSERT INTO Book(ISBN13, quality, format, quantity) VALUES ("978-21871227080", "old", "paperback", 6);
INSERT INTO Book(ISBN13, quality, format, quantity) VALUES ("978-19602840886", "old", "paperback", 6);
INSERT INTO Book(ISBN13, quality, format, quantity) VALUES ("978-18468647789", "old", "paperback", 6);
INSERT INTO Book(ISBN13, quality, format, quantity) VALUES ("978-12797682304", "new", "paperback", 6);
INSERT INTO Book(ISBN13, quality, format, quantity) VALUES ("978-4858330625", "new", "hardcover", 6);
INSERT INTO Book(ISBN13, quality, format, quantity) VALUES ("978-10529296110", "new", "hardcover", 6);
INSERT INTO Book(ISBN13, quality, format, quantity) VALUES ("978-5992523722", "new", "hardcover", 6);
INSERT INTO Book(ISBN13, quality, format, quantity) VALUES ("978-27542192565", "old", "electronic", 6);
INSERT INTO Book(ISBN13, quality, format, quantity) VALUES ("978-13931875402", "new", "paperback", 6);
INSERT INTO Book(ISBN13, quality, format, quantity) VALUES ("978-23005420177", "old", "electronic", 6);
INSERT INTO Book(ISBN13, quality, format, quantity) VALUES ("978-1592575121", "new", "hardcover", 6);
INSERT INTO Book(ISBN13, quality, format, quantity) VALUES ("978-29810578759", "old", "electronic", 6);
INSERT INTO Book(ISBN13, quality, format, quantity) VALUES ("978-28676385662", "old", "electronic", 6);
INSERT INTO Book(ISBN13, quality, format, quantity) VALUES ("978-25273806371", "old", "electronic", 6);
INSERT INTO Book(ISBN13, quality, format, quantity) VALUES ("978-5992523723", "new", "hardcover", 6);
INSERT INTO Book(ISBN13, quality, format, quantity) VALUES ("978-1563477799", "new", "hardcover", 6);
INSERT INTO Book(ISBN13, quality, format, quantity) VALUES ("978-24139613274", "old", "electronic", 6);
INSERT INTO Book(ISBN13, quality, format, quantity) VALUES ("978-1455751334", "new", "hardcover", 6);
INSERT INTO Book(ISBN13, quality, format, quantity) VALUES ("978-2589944431", "new", "hardcover", 6);
INSERT INTO Book(ISBN13, quality, format, quantity) VALUES ("978-26407999468", "old", "electronic", 6);
INSERT INTO Book(ISBN13, quality, format, quantity) VALUES ("978-0470080245", "old", "hardcover", 6);
INSERT INTO Book(ISBN13, quality, format, quantity) VALUES ("978-7126716819", "new", "hardcover", 6);
INSERT INTO Book(ISBN13, quality, format, quantity) VALUES ("978-8260909916", "new", "hardcover", 6);
INSERT INTO Book(ISBN13, quality, format, quantity) VALUES ("978-3724137528", "new", "hardcover", 6);
INSERT INTO Book(ISBN13, quality, format, quantity) VALUES ("978-1476770383", "new", "paperback", 6);
INSERT INTO Book(ISBN13, quality, format, quantity) VALUES ("978-0307743657", "old", "paperback", 6);

UPDATE book SET cost = 3.45 WHERE (ISBN13 = "978-0321558237");
UPDATE book SET cost = 13 WHERE (ISBN13 = "978-15066068498");
UPDATE book SET cost = 17 WHERE (ISBN13 = "978-16200261595");
UPDATE book SET cost = 19 WHERE (ISBN13 = "978-11663489207");
UPDATE book SET cost = 19.83 WHERE (ISBN13 = "978-13931875401");
UPDATE book SET cost = 20 WHERE (ISBN13 = "978-20737033983");
UPDATE book SET cost = 20 WHERE (ISBN13 = "978-9395103013");
UPDATE book SET cost = 20 WHERE (ISBN13 = "978-17334454692");
UPDATE book SET cost = 20 WHERE (ISBN13 = "978-21871227080");
UPDATE book SET cost = 20 WHERE (ISBN13 = "978-19602840886");
UPDATE book SET cost = 20 WHERE (ISBN13 = "978-18468647789");
UPDATE book SET cost = 20.33 WHERE (ISBN13 = "978-12797682304");
UPDATE book SET cost = 23 WHERE (ISBN13 = "978-4858330625");
UPDATE book SET cost = 25 WHERE (ISBN13 = "978-10529296110");
UPDATE book SET cost = 34 WHERE (ISBN13 = "978-5992523722");
UPDATE book SET cost = 34 WHERE (ISBN13 = "978-27542192565");
UPDATE book SET cost = 41 WHERE (ISBN13 = "978-13931875402");
UPDATE book SET cost = 45 WHERE (ISBN13 = "978-23005420177");
UPDATE book SET cost = 54 WHERE (ISBN13 = "978-1592575121");
UPDATE book SET cost = 54 WHERE (ISBN13 = "978-29810578759");
UPDATE book SET cost = 56 WHERE (ISBN13 = "978-28676385662");
UPDATE book SET cost = 56 WHERE (ISBN13 = "978-25273806371");
UPDATE book SET cost = 57 WHERE (ISBN13 = "978-5992523723");
UPDATE book SET cost = 67 WHERE (ISBN13 = "978-1563477799");
UPDATE book SET cost = 78 WHERE (ISBN13 = "978-24139613274");
UPDATE book SET cost = 78.54 WHERE (ISBN13 = "978-1455751334");
UPDATE book SET cost = 90 WHERE (ISBN13 = "978-2589944431");
UPDATE book SET cost = 98 WHERE (ISBN13 = "978-26407999468");
UPDATE book SET cost = 117 WHERE (ISBN13 = "978-0470080245");
UPDATE book SET cost = 123.11 WHERE (ISBN13 = "978-7126716819");
UPDATE book SET cost = 132.5 WHERE (ISBN13 = "978-8260909916");
UPDATE book SET cost = 300 WHERE (ISBN13 = "978-3724137528");
UPDATE book SET cost = 24 WHERE (ISBN13 = "978-1476770383");
UPDATE book SET cost = 10 WHERE (ISBN13 = "978-0307743657");

UPDATE book SET quantity = 10 WHERE (ISBN13 = "978-0321558237");
UPDATE book SET quantity = 4 WHERE (ISBN13 = "978-15066068498");
UPDATE book SET quantity = 3 WHERE (ISBN13 = "978-16200261595");
UPDATE book SET quantity = 4 WHERE (ISBN13 = "978-11663489207");
UPDATE book SET quantity = 3 WHERE (ISBN13 = "978-13931875401");
UPDATE book SET quantity = 2 WHERE (ISBN13 = "978-20737033983");
UPDATE book SET quantity = 6 WHERE (ISBN13 = "978-9395103013");
UPDATE book SET quantity = 2 WHERE (ISBN13 = "978-17334454692");
UPDATE book SET quantity = 3 WHERE (ISBN13 = "978-21871227080");
UPDATE book SET quantity = 3 WHERE (ISBN13 = "978-19602840886");
UPDATE book SET quantity = 6 WHERE (ISBN13 = "978-18468647789");
UPDATE book SET quantity = 6 WHERE (ISBN13 = "978-12797682304");
UPDATE book SET quantity = 35 WHERE (ISBN13 = "978-4858330625");
UPDATE book SET quantity = 2 WHERE (ISBN13 = "978-10529296110");
UPDATE book SET quantity = 12 WHERE (ISBN13 = "978-5992523722");
UPDATE book SET quantity = 3 WHERE (ISBN13 = "978-27542192565");
UPDATE book SET quantity = 29 WHERE (ISBN13 = "978-13931875402");
UPDATE book SET quantity = 2 WHERE (ISBN13 = "978-23005420177");
UPDATE book SET quantity = 26 WHERE (ISBN13 = "978-1592575121");
UPDATE book SET quantity = 5 WHERE (ISBN13 = "978-29810578759");
UPDATE book SET quantity = 4 WHERE (ISBN13 = "978-28676385662");
UPDATE book SET quantity = 7 WHERE (ISBN13 = "978-25273806371");
UPDATE book SET quantity = 10 WHERE (ISBN13 = "978-5992523723");
UPDATE book SET quantity = 30 WHERE (ISBN13 = "978-1563477799");
UPDATE book SET quantity = 4 WHERE (ISBN13 = "978-24139613274");
UPDATE book SET quantity = 20 WHERE (ISBN13 = "978-1455751334");
UPDATE book SET quantity = 15 WHERE (ISBN13 = "978-2589944431");
UPDATE book SET quantity = 8 WHERE (ISBN13 = "978-26407999468");
UPDATE book SET quantity = 30 WHERE (ISBN13 = "978-0470080245");
UPDATE book SET quantity = 10 WHERE (ISBN13 = "978-7126716819");
UPDATE book SET quantity = 5 WHERE (ISBN13 = "978-8260909916");
UPDATE book SET quantity = 25 WHERE (ISBN13 = "978-3724137528");
UPDATE book SET quantity = 30 WHERE (ISBN13 = "978-1476770383");
UPDATE book SET quantity = 10 WHERE (ISBN13 = "978-0307743657");


###_____________________________ CREATE BOOK CATEGORIES ___________________________
### NOTE: watch for auto generatred duplicate course numbers
CREATE TABLE BookCategory(ISBN13 varchar(20), department varchar(100), course_id integer, course varchar(150), instructor_id integer, instructor_email varchar(100), school varchar(30), 
foreign key(ISBN13) references bookclass(ISBN13), foreign key(course_id) references course(id), foreign key(instructor_id) references instructor(id), foreign key(school) references university(name));
INSERT INTO BookCategory(ISBN13, department, course_id, course, instructor_id, instructor_email, school) VALUES ("978-0321558237", "Visual Arts", 1001, "Acrylic painting", 1001, "julia.lambert@towson.edu", "Towson");
INSERT INTO BookCategory(ISBN13, department, course_id, course, instructor_id, instructor_email, school) VALUES ("978-0321558237", "Visual Arts", 1031, "Acrylic painting", 1002, "jessica.glover@umcp.edu", "UMCP");
INSERT INTO BookCategory(ISBN13, department, course_id, course, instructor_id, instructor_email, school) VALUES ("978-15066068498", "Mathematics and Statistics", 1002, "linear algebra", 1003, "connor.edmunds@towson.edu", "Towson");
INSERT INTO BookCategory(ISBN13, department, course_id, course, instructor_id, instructor_email, school) VALUES ("978-16200261595", "Mechanical Engineering", 1003, "Wing Design", 1004, "ian.gibson@towson.edu", "Towson");
INSERT INTO BookCategory(ISBN13, department, course_id, course, instructor_id, instructor_email, school) VALUES ("978-11663489207", "English Language Institute", 1004, "English and International Students", 1005, "alexander.clarkson@umbc.edu", "UMBC");
INSERT INTO BookCategory(ISBN13, department, course_id, course, instructor_id, instructor_email, school) VALUES ("978-13931875401", "Management of Aging Services", 1005, "Health and Age", 1006, "felicity.buckland@towson.edu", "Towson");
INSERT INTO BookCategory(ISBN13, department, course_id, course, instructor_id, instructor_email, school) VALUES ("978-20737033983", "Philosophy", 1006, "Ancient Greek Philosophy", 1007, "lucas.payne@towson.edu", "Towson");
INSERT INTO BookCategory(ISBN13, department, course_id, course, instructor_id, instructor_email, school) VALUES ("978-9395103013", "Emergency Health Services", 1007, "Vaccination", 1008, "emma.kelly@umbc.edu", "UMBC");
INSERT INTO BookCategory(ISBN13, department, course_id, course, instructor_id, instructor_email, school) VALUES ("978-17334454692", "Media and Communication Studies", 1008, "Print Journalism ", 1009, "amelia.cameron@towson.edu", "Towson");
INSERT INTO BookCategory(ISBN13, department, course_id, course, instructor_id, instructor_email, school) VALUES ("978-21871227080", "Pre-Allied Health", 1009, "Introduction to Academic Reading", 1010, "isaac.anderson@umcp.edu", "UMCP");
INSERT INTO BookCategory(ISBN13, department, course_id, course, instructor_id, instructor_email, school) VALUES ("978-19602840886", "Music", 1010, "Music in Medivial Times", 1011, "una.oliver@towson.edu", "Towson");
INSERT INTO BookCategory(ISBN13, department, course_id, course, instructor_id, instructor_email, school) VALUES ("978-18468647789", "Modern Languages, Linguistics and Intercultural Communication", 1011, "The Field of Intercultural Communication", 1012, "lily.burgess@towson.edu", "Towson");
INSERT INTO BookCategory(ISBN13, department, course_id, course, instructor_id, instructor_email, school) VALUES ("978-12797682304", "Judaic Studies", 1012, "Israel and the Ancient Near East", 1013, "piers.gray@towson.edu", "Towson");
INSERT INTO BookCategory(ISBN13, department, course_id, course, instructor_id, instructor_email, school) VALUES ("978-4858330625", "Computer Science and Electrical Engineering", 1013, "Operating System", 1014, "harry.mills@umbc.edu", "UMBC");
INSERT INTO BookCategory(ISBN13, department, course_id, course, instructor_id, instructor_email, school) VALUES ("978-10529296110", "English", 1014, "Adverbs", 1015, "fiona.hamilton@umbc.edu", "UMBC");
INSERT INTO BookCategory(ISBN13, department, course_id, course, instructor_id, instructor_email, school) VALUES ("978-5992523722", "Economics", 1015, "Microeconomics", 1016, "yvonne.wilkins@umbc.edu", "UMBC");
INSERT INTO BookCategory(ISBN13, department, course_id, course, instructor_id, instructor_email, school) VALUES ("978-27542192565", "Social Work", 1016, "History and Philosophy of Social Work and Social Welfare", 1017, "piers.peters@umcp.edu", "UMCP");
INSERT INTO BookCategory(ISBN13, department, course_id, course, instructor_id, instructor_email, school) VALUES ("978-13931875402", "Music", 1017, "Music in Ancient Times", 1011, "una.oliver@towson.edu", "Towson");
INSERT INTO BookCategory(ISBN13, department, course_id, course, instructor_id, instructor_email, school) VALUES ("978-23005420177", "Pre-Law", 1018, "Principles of Sociology", 1018, "hannah.bond@umcp.edu", "UMCP");
INSERT INTO BookCategory(ISBN13, department, course_id, course, instructor_id, instructor_email, school) VALUES ("978-1592575121", "Mathematics and Statistics", 1002, "linear algebra", 1003, "connor.edmunds@towson.edu", "Towson");
INSERT INTO BookCategory(ISBN13, department, course_id, course, instructor_id, instructor_email, school) VALUES ("978-29810578759", "Theatre", 1019, "Production Practicum", 1019, "mary.ogden@umcp.edu", "UMCP");
INSERT INTO BookCategory(ISBN13, department, course_id, course, instructor_id, instructor_email, school) VALUES ("978-28676385662", "Sociology", 1020, "Culture in America", 1020, "richard.clark@umcp.edu", "UMCP");
INSERT INTO BookCategory(ISBN13, department, course_id, course, instructor_id, instructor_email, school) VALUES ("978-25273806371", "Psychology", 1021, "Introduction to Psychology", 1021, "colin.nolan@umcp.edu", "UMCP");
INSERT INTO BookCategory(ISBN13, department, course_id, course, instructor_id, instructor_email, school) VALUES ("978-5992523723", "Dance", 1022, "Salsa", 1022, "sean.lee@umbc.edu", "UMBC");
INSERT INTO BookCategory(ISBN13, department, course_id, course, instructor_id, instructor_email, school) VALUES ("978-1563477799", "Mechanical Engineering", 1023, "Rocket Propulsion ", 1004, "ian.gibson@towson.edu", "Towson");
INSERT INTO BookCategory(ISBN13, department, course_id, course, instructor_id, instructor_email, school) VALUES ("978-24139613274", "Pre-Medicine and Pre-Dentistry", 1024, "Human Anatomy", 1023, "leonard.wilkins@umcp.edu", "UMCP");
INSERT INTO BookCategory(ISBN13, department, course_id, course, instructor_id, instructor_email, school) VALUES ("978-1455751334", "Business Technology Administration", 1025, "Econometrics", 1024, "stephen.manning@umbc.edu", "UMBC");
INSERT INTO BookCategory(ISBN13, department, course_id, course, instructor_id, instructor_email, school) VALUES ("978-2589944431", "Chemical, Biochemical & Environmental Engineering", 1026, "Organic Chemistry", 1025, "jake.jackson@umbc.edu", "UMBC");
INSERT INTO BookCategory(ISBN13, department, course_id, course, instructor_id, instructor_email, school) VALUES ("978-26407999468", "Religious Studies", 1027, "Christianity ", 1026, "amanda.blake@umcp.edu", "UMCP");
INSERT INTO BookCategory(ISBN13, department, course_id, course, instructor_id, instructor_email, school) VALUES ("978-0470080245", "Mechanical Engineering", 1023, "Rocket Propulsion ", 1004, "ian.gibson@towson.edu", "Towson");
INSERT INTO BookCategory(ISBN13, department, course_id, course, instructor_id, instructor_email, school) VALUES ("978-7126716819", "Economics", 1028, "Macroeconomics", 1016, "yvonne.wilkins@umbc.edu", "UMBC");
INSERT INTO BookCategory(ISBN13, department, course_id, course, instructor_id, instructor_email, school) VALUES ("978-8260909916", "Education", 1029, "Teaching 101", 1027, "justin.turner@umbc.edu", "UMBC");
INSERT INTO BookCategory(ISBN13, department, course_id, course, instructor_id, instructor_email, school) VALUES ("978-3724137528", "Chemistry and Biochemistry", 1030, "Biochemistry", 1028, "brian.lambert@umbc.edu", "UMBC");
INSERT INTO BookCategory(ISBN13) VALUES ("978-0307743657");
INSERT INTO BookCategory(ISBN13) VALUES ("978-1476770383");

ALTER TABLE bookcategory drop course;
ALTER TABLE bookcategory drop instructor_email;

##---------------------------------CREATE CART TABLE ------------------------------------


CREATE TABLE cart (id integer primary key, cart_owner integer not null, date_created date not null, update_date date, foreign key (cart_owner) references student(id));
INSERT INTO cart (id, date_created, update_date, cart_owner) values (4, '2014/10/02', '2014/10/03', 1001); 
INSERT INTO cart (id, date_created, update_date, cart_owner) values (1, '2014/01/01', '2014/06/17', 1021);
INSERT INTO cart (id, date_created, update_date, cart_owner) values (2, '2014/02/01', '2014/01/02', 1005);
INSERT INTO cart (id, date_created, update_date, cart_owner) values (3, '2014/02/01', '2014/01/02', 1012);
INSERT INTO cart (id, date_created, update_date, cart_owner) values (5, '2014/10/03', '2014/10/04', 1011);
INSERT INTO cart (id, date_created, update_date, cart_owner) values (6, '2014/10/02', '2014/10/03', 1013);
INSERT INTO cart (id, date_created, update_date, cart_owner) values (7, '2014/10/04', '2014/10/05', 1015);
INSERT INTO cart (id, date_created, update_date, cart_owner) values (8 ,'2014/11/05', '2014/11/05', 1017);
INSERT INTO cart (id, date_created, update_date, cart_owner) values (9 ,'2014/01/01', '2014/03/05', 1008);
INSERT INTO cart (id, date_created, update_date, cart_owner) values (10,'2014/05/01', '2014/10/14', 1010);
INSERT INTO cart (id, date_created, update_date, cart_owner) values (11,'2014/01/01', '2014/03/05', 1009);
INSERT INTO cart (id, date_created, update_date, cart_owner) values (12,'2014/10/02', '2014/10/03', 1020);
INSERT INTO cart (id, date_created, update_date, cart_owner) values (13,'2014/09/08', '2014/12/15', 1007);
INSERT INTO cart (id, date_created, update_date, cart_owner) values (14,'2014/11/07', '2014/12/16', 1018);


CREATE TABLE cartContents (cart_id integer , inventory_id integer, purchase_type varchar(15), quantity integer, foreign key(cart_id) references cart(id), foreign key (inventory_id) references book(inventory_id));
#---- inserting book 1-------
INSERT INTO cartcontents(cart_id, inventory_id, purchase_type, quantity) values ( 1, 23, "buy", 2 );
INSERT INTO cartcontents(cart_id, inventory_id, purchase_type, quantity) values ( 2, 28, "buy", 2 );
INSERT INTO cartcontents(cart_id, inventory_id, purchase_type, quantity) values ( 3, 28, "buy", 3 );
INSERT INTO cartcontents(cart_id, inventory_id, purchase_type, quantity) values ( 4, 4, "rent", 1 );
INSERT INTO cartcontents(cart_id, inventory_id, purchase_type, quantity) values ( 5, 4, "rent", 3 );
INSERT INTO cartcontents(cart_id, inventory_id, purchase_type, quantity) values ( 6, 4, "rent", 1 );
INSERT INTO cartcontents(cart_id, inventory_id, purchase_type, quantity) values ( 7, 4, "rent",1 );
INSERT INTO cartcontents(cart_id, inventory_id, purchase_type, quantity) values ( 8, 8, "rent", 1 );
INSERT INTO cartcontents(cart_id, inventory_id, purchase_type, quantity) values ( 9, 2, "rent", 1 );
INSERT INTO cartcontents(cart_id, inventory_id, purchase_type, quantity) values ( 10, 2, "rent", 1 );
INSERT INTO cartcontents(cart_id, inventory_id, purchase_type, quantity) values ( 11, 2, "rent", 1 );
INSERT INTO cartcontents(cart_id, inventory_id, purchase_type, quantity) values ( 12, 14, "rent",4 );
INSERT INTO cartcontents(cart_id, inventory_id, purchase_type, quantity) values ( 13, 14, "rent", 2 );
INSERT INTO cartcontents(cart_id, inventory_id, purchase_type, quantity) values ( 14, 10, "rent", 1 );
#--------- book 2 --------
INSERT INTO cartcontents(cart_id, inventory_id, purchase_type, quantity) values ( 2, 9, "rent", 2 );
INSERT INTO cartcontents(cart_id, inventory_id, purchase_type, quantity) values ( 3, 9, "rent", 1 );
INSERT INTO cartcontents(cart_id, inventory_id, purchase_type, quantity) values ( 4, 8, "rent", 1 );
INSERT INTO cartcontents(cart_id, inventory_id, purchase_type, quantity) values ( 8, 2, "rent", 1 );
INSERT INTO cartcontents(cart_id, inventory_id, purchase_type, quantity) values ( 9, 26, "buy", 2 );
INSERT INTO cartcontents(cart_id, inventory_id, purchase_type, quantity) values ( 10, 26, "buy", 2 );
INSERT INTO cartcontents(cart_id, inventory_id, purchase_type, quantity) values ( 12, 8, "rent", 1 );
INSERT INTO cartcontents(cart_id, inventory_id, purchase_type, quantity) values ( 13, 10, "rent", 1 );
INSERT INTO cartcontents(cart_id, inventory_id, purchase_type, quantity) values ( 14, 14, "rent", 1 );


#---------------making orders ----------------------

CREATE TABLE orders(id integer, owner_id int, date_created date, date_completed date, shipment_type varchar(20), status varchar(30), credit_num varchar(20), payment_name varchar(30), payment_type varchar(30), payment_exp varchar(20), primary key(id), foreign key(owner_id) references student(id));

INSERT INTO orders (owner_id,id,date_created,date_completed,credit_num,payment_name, payment_exp, payment_type, status, shipment_type) values (1018, 105, '2014/10/06', '2014/09/24', "4485000000000000", "card", '2016/03/01', "VISA", "shipped", "standard");
INSERT INTO orders (owner_id,id,date_created,date_completed,credit_num,payment_name, payment_exp, payment_type, status, shipment_type) values (1005, 106, '2014/11/04', '2014/10/07', "4485000000000000", "card", '2016/03/01', "VISA", "shipped", "standard");
INSERT INTO orders (owner_id,id,date_created,date_completed,credit_num,payment_name, payment_exp, payment_type, status, shipment_type) values (1014, 102, '2014/10/13', '2014/10/26', "4878680000000000", "mycard", '2019/04/01', "VISA", "new", "1-day");
INSERT INTO orders (owner_id,id,date_created,date_completed,credit_num,payment_name, payment_exp, payment_type, status, shipment_type) values (1003, 107, '2014/09/07', '2014/11/12', "4485000000000000", "card", '2016/03/02', "VISA", "shipped", "1-day");
INSERT INTO orders (owner_id,id,date_created,credit_num,payment_name, payment_exp, payment_type, status, shipment_type) values (1014, 100, '2014/10/06', "4556490000000000", "plastic", '2015/05/01', "VISA", "shipping", "2-day");
INSERT INTO orders (owner_id,id,date_created,credit_num,payment_name, payment_exp, payment_type, status, shipment_type) values (1018, 101, '2014/10/25', "4485000000000000", "card", '2016/03/03', "VISA", "shipped", "1-day");
INSERT INTO orders (owner_id,id,date_created,credit_num,payment_name, payment_exp, payment_type, status, shipment_type) values (1012, 103, '2014/07/04', "4929770000000000", "creditc", '2020/09/01', "MASTERCARD", "cancelled", "standard");
INSERT INTO orders (owner_id,id,date_created,credit_num,payment_name, payment_exp, payment_type, status, shipment_type) values (1018, 104, '2014/09/23', "4485000000000000", "card", '2016/03/02', "VISA", "shipped", "1-day");


## _________________________ FILLING ORDER CONTENTS _________________________________
CREATE TABLE ordercontents (order_id integer, inventory_id integer, purchase_type varchar(15), quantity integer, foreign key(order_id) references orders(id), foreign key (inventory_id) references book(inventory_id));
INSERT INTO ordercontents (order_id, inventory_id, purchase_type, quantity) VALUES ( 107 , 11 ,"rent", 1 );
INSERT INTO ordercontents (order_id, inventory_id, purchase_type, quantity) VALUES ( 106 , 22 ,"purchase", 2 );
INSERT INTO ordercontents (order_id, inventory_id, purchase_type, quantity) VALUES ( 103 , 9 ,"rent", 1 );
INSERT INTO ordercontents (order_id, inventory_id, purchase_type, quantity) VALUES ( 100 , 25 ,"purchase", 1 );
INSERT INTO ordercontents (order_id, inventory_id, purchase_type, quantity) VALUES ( 102 , 13 ,"purchase", 1 );
INSERT INTO ordercontents (order_id, inventory_id, purchase_type, quantity) VALUES ( 100 , 13 ,"purchase", 1 );
INSERT INTO ordercontents (order_id, inventory_id, purchase_type, quantity) VALUES ( 104 , 9 ,"rent", 1 );
INSERT INTO ordercontents (order_id, inventory_id, purchase_type, quantity) VALUES ( 105 , 22 ,"purchase", 1 );
INSERT INTO ordercontents (order_id, inventory_id, purchase_type, quantity) VALUES ( 101 , 2 ,"rent", 1 );

###____________________ MAKING TROUBLE TICKETS _______________________________________


CREATE TABLE ticket (id integer, student_id integer, service_id integer, admin_id integer, category varchar(50), date_created date, title varchar(50), description varchar(200), solution varchar(200), status varchar(30),
primary key(id), foreign key (student_id) references student(id), foreign key (service_id) references employee(id), foreign key (admin_id) references employee(id));

INSERT INTO ticket(id, category,date_created,service_id,title,description,status) VALUES ( 100, "orders", '2014/10/24', 1009, "bug in orders", "1 order got canceled automatically", "new" );
INSERT INTO ticket(id, student_id,category,date_created,service_id,title,description,status) VALUES ( 101, 1012, "userprofile", '2014/07/15', 1007, "unable to log in", "password reset needed", "new" );
INSERT INTO ticket(id, student_id,category,date_created,service_id,title,status) VALUES ( 102, 1014, "products", '2014/08/23', 1020, "bad / damaged product received" , "new" );
INSERT INTO ticket(id, student_id,category,date_created,service_id,title,description,status) VALUES ( 103, 1016, "cart", '2014/02/04', 1020, "cart not updating", "cant delete stuff from the cart", "new" );
INSERT INTO ticket(id, student_id,category,date_created,service_id,title,description,status) VALUES ( 104, 1018, "orders", '2014/10/05', 1020, "order not received", "i have still not received my order. it has been 10 days", "new" );
INSERT INTO ticket(id, student_id,category,date_created,service_id,title,description,solution,status,admin_id) VALUES ( 106, 1019, "userprofile", '2014/08/05', 1020, "password lost", "password was reset", "new password issued", "completed", 1038);
INSERT INTO ticket(id, student_id,category,date_created,service_id,title,status) VALUES ( 114, 1014, "userprofile", '2014/09/05', 1020, "unable to edit details on profile" , "new" );
INSERT INTO ticket(id, student_id,category,date_created,service_id,title,description,status) VALUES ( 120, 1006, "products", '2014/08/31', 1017, "pages missing from the book", "chapter 5 of the book i ordered is missing", "new" );
INSERT INTO ticket(id, student_id,category,date_created,service_id,title,description,status) VALUES ( 121, 1004, "userprofile", '2014/10/24', 1017, "forgotten password", "password needs to be reset after verification", "new" );
INSERT INTO ticket(id,category,date_created,service_id,title,description,status) VALUES ( 130, "cart", '2014/12/01', 1022, "proposed maintenance work", "yearly update scheduled", "new" );


CREATE TABLE ticketHistory(ticket_id integer, service_id integer, admin_id integer, update_date date, status varchar(50), 
foreign key(ticket_id) references ticket(id), foreign key(service_id) references employee(id), foreign key(admin_id) references employee(id));

INSERT INTO tickethistory (ticket_id, update_date, service_id, admin_id, status) VALUES (100, '2014/10/24', 1009, 1002, "assigned");
INSERT INTO tickethistory (ticket_id, update_date, service_id, status) VALUES (100, '2014/10/24', 1009, "new");
INSERT INTO tickethistory (ticket_id, update_date, service_id, status) VALUES (101, '2014/07/15', 1007, "new");
INSERT INTO tickethistory (ticket_id, update_date, service_id, status) VALUES (102, '2014/08/23', 1020, "new");
INSERT INTO tickethistory (ticket_id, update_date, service_id, admin_id, status) VALUES (103, '2014/02/05', 1020, 1038, "assigned");
INSERT INTO tickethistory (ticket_id, update_date, service_id, admin_id, status) VALUES (103, '2014/02/06', 1020, 1038, "in-process");
INSERT INTO tickethistory (ticket_id, update_date, service_id, status) VALUES (103, '2014/02/04', 1020, "new");
INSERT INTO tickethistory (ticket_id, update_date, service_id, status) VALUES (104, '2014/10/05', 1020, "new");
INSERT INTO tickethistory (ticket_id, update_date, service_id, admin_id, status) VALUES (106, '2014/08/09', 1020, 1038, "completed");
INSERT INTO tickethistory (ticket_id, update_date, service_id, admin_id, status) VALUES (106, '2014/08/06', 1020, 1038, "assigned");
INSERT INTO tickethistory (ticket_id, update_date, service_id, admin_id, status) VALUES (106, '2014/08/07', 1020, 1038, "in-process");
INSERT INTO tickethistory (ticket_id, update_date, service_id, status) VALUES (106, '2014/08/05', 1020, "new");
INSERT INTO tickethistory (ticket_id, update_date, service_id, status) VALUES (114, '2014/09/05', 1020, "new");
INSERT INTO tickethistory (ticket_id, update_date, service_id, status) VALUES (120, '2014/08/31', 1017, "new");
INSERT INTO tickethistory (ticket_id, update_date, service_id, admin_id, status) VALUES (121, '2014/10/25', 1017, 1031, "assigned");
INSERT INTO tickethistory (ticket_id, update_date, service_id, status) VALUES (121, '2014/10/24', 1017, "new");
INSERT INTO tickethistory (ticket_id, update_date, service_id, status) VALUES (130, '2014/12/01', 1022, "new");

#____________________ CREATING BOOK RATINGS TABLE _____________________________#
CREATE TABLE bookratings( student_id integer, isbn13 varchar(20), rating float, primary key(student_id,isbn13), foreign key(student_id) references student(id), foreign key(isbn13) references bookclass(isbn13));
INSERT INTO bookratings (student_id, isbn13, rating) VALUES (1000,"978-4858330625", 4);
INSERT INTO bookratings (student_id, isbn13, rating) VALUES (1017,"978-4858330625", 4.5);
INSERT INTO bookratings (student_id, isbn13, rating) VALUES (1002,"978-19602840886", 3);
INSERT INTO bookratings (student_id, isbn13, rating) VALUES (1016,"978-19602840886", 3);


#____________________ CREATING TEST STUDENT FOR PyMySql _______________________
INSERT INTO student (id, first_name, last_name, dob, email, address, phone, school, status) VALUES (1200, "Alpha","Tester","1983-7-19","TestStudent@gmail.com", "123 Main St, City, ST, 00000","911","UMBC","UnderGrad");
INSERT INTO cart (id, date_created, cart_owner) VALUES (16, '1990-4-15', 1200);
INSERT INTO cart (id, date_created, update_date, cart_owner) VALUES (17, '1991-9-15', '2018-5-11', 1200);

INSERT INTO cartcontents (cart_id, inventory_id, purchase_type, quantity) VALUES (16, 33, "purchase", 1);
INSERT INTO cartcontents (cart_id, inventory_id, purchase_type, quantity) VALUES (16, 34, "purchase", 1);
INSERT INTO cartcontents (cart_id, inventory_id, purchase_type, quantity) VALUES (17, 2, "purchase", 1);
INSERT INTO cartcontents (cart_id, inventory_id, purchase_type, quantity) VALUES (17, 17, "purchase", 1);
INSERT INTO cartcontents (cart_id, inventory_id, purchase_type, quantity) VALUES (16, 24, "purchase", 1);

INSERT INTO bookratings (student_id, isbn13, rating) VALUES (1200,"978-16200261595", 5);
INSERT INTO bookratings (student_id, isbn13, rating) VALUES (1200,"978-4858330625",5 );