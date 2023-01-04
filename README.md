# European-Soccer-Database
European soccer database using MySQL as the backend and Java as the frontend

1. Download and run the database dump.
2. Add the JDBC driver to your reference libraries in Java.
3. Add all the java files (Project.java and Requests.java) to your project file. The file that
contains the application is Project.java.
4. In your run configuration make sure that the project name is correct and set the main
class to Project.
5. In the java file Project.java, for the class Project, you will need to review/change the
userName, password, serverName and portNumber. Make sure that each one of these
values matches the information for your current connection in the MySQL workbench (if
you are running a local connection you will only need to change the password).
6. Make sure that the dbName in the Java file (Project.java) matches the database name in
the MySQL workbench. The dbName should be "european_soccer" for both.
7. Run the application (application should be visible in the console (command line)).
8. The application will ask for a user name and then a password. You can log in as admin or
as a fan. (The system will determine if you are an admin or fan based on your login
information).
a. To login as Admin: username is admin_susan and password is pencil80
b. To login as Fan: username is ghost_boy1 and password is 122378
c. You can also use any login information found in the database (look into fans table
for logins for fans and look into admins table for logins for admins)
d. If you login in as fan or admin, just make sure you use the user_name and
password (do not use the user_id)
9. The system should indicate that login is successful, you should see a message indicating
so. If login information is wrong, you may enter information again. The system
automatically prompts you to re enter a password or username (depending on which one
is wrong).
10. Depending on your login type (fan or admin) you will be shown a list of options that the
user may execute.
11. After an option is chosen, you will be shown a second list of options where you will be
prompted to choose again. Depending on which option you choose, the system will ask
for different types of input information.
12. After the execution of a transaction, you will be shown the same list of options again and
you may execute another transaction.
13. To quit the application, you will have to return to the main menu and enter the
corresponding quit option.
14. When you quit the application, a message will be displayed confirming so.
