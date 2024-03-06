import sqlite3
import pyfiglet

heading = "Teaterdatabase"
result = pyfiglet.figlet_format(heading, font = "slant")
print(result)

con = sqlite3.connect('teater.db')

cursor = con.cursor()

fd = open('./Teaterdatabase/databaseprosjekt.sql', 'r')
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
    if user_input.lower() == "help":
        print("Type 'exit' to exit the program")
        continue
    
    if user_input.lower() == "insert gamle-scene.txt":
        with open('./gamle-scene.txt', 'r') as file:
            
            chairNumber = 0
            rowNumber = 0
            
            for line in file:
               year = line[5:8]
               month = line[10:11]
               day = line[13:14]
               
               date = year + "-" + month + "-" + day
               chairNumber += 1
               rowNumber += 1
               
               cursor.execute('INSERT INTO Kundeprofil(?, ?, ?)', (1, 'Dummy profile', 78282283, 'Dummy adress'))
               cursor.execute('INSERT INTO Bilett(?, ?, ?, ?, ?, ?, ?, ?, ?)' (1, 1, date, chairNumber, rowNumber, 'Galleri', 'Gamle Scene', NULL, ))
               cursor.execute('INSERT INTO Teatersal VALUES (?, ?)', (1, 'Gamle Scene'))
               cursor.execute('INSERT INTO Omraade VALUES (?, ?)', (1, 'Galleri'))
               cursor.execute('INSERT INTO Omraade VALUES (?, ?)', (1, 'Balkong'))
               cursor.execute('INSERT INTO Omraade VALUES (?, ?)', (1, 'Parkett'))
               
               cursor.execute('INSERT INTO Teaterstykke VALUES (?, ?, ?, ?)' (1, 'Størst av alt er kjærligheten', 1, 1))

        
    try:
        cursor.execute(user_input)
        print(cursor.fetchall())
    except Exception as msg:
        print("Command failed: ", msg)
        
con.close()