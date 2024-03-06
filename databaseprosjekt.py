import sqlite3
import pyfiglet

heading = "Teaterdatabase"
result = pyfiglet.figlet_format(heading, font = "slant")
print(result)

con = sqlite3.connect('teater.db')

cursor = con.cursor()

fd = open('/Users/markus/Library/Mobile Documents/com~apple~CloudDocs/NTNU/4. Semester/Datamodellering og databasesystemer/Prosjekt/Teaterdatabase/databaseprosjekt.sql', 'r')
sqlFile = fd.read()
fd.close()

sqlCommands = sqlFile.split(';')

for command in sqlCommands:
    try:
        cursor.execute(command)
    except Exception as msg:
        print("Command skipped: ", msg)
    
con.commit()

while True:
    user_input = input("Enter a SQL command: ")
    
    if user_input.lower() == "exit":
        break
    
    try:
        cursor.execute(user_input)
        print(cursor.fetchall())
    except Exception as msg:
        print("Command failed: ", msg)
        
con.close()