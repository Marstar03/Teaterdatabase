import sqlite3
import pyfiglet

heading = "Teaterdatabase"
result = pyfiglet.figlet_format(heading, font = "slant")
print(result)

con = sqlite3.connect('teater.db')

cursor = con.cursor()

while True:
    user_input = input("Enter a SQL command: ")
    
    if user_input.lower() == "exit":
        break
    if user_input.lower() == "help":
        print("Type 'exit' to exit the program")
        continue
       
    try:
        cursor.execute(user_input)
        print(cursor.fetchall())
    except Exception as msg:
        print("Command failed: ", msg)
        
con.close()