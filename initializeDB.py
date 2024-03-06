import sqlite3
import pyfiglet

heading = "Realiserer DB"
result = pyfiglet.figlet_format(heading, font = "slant")
print(result)

con = sqlite3.connect('teater.db')

cursor = con.cursor()

## Realize tables

fd = open('./databaseprosjekt.sql', 'r')
sqlFile = fd.read()
fd.close()

sqlCommands1 = sqlFile.split(';')

for command in sqlCommands1:
    try:
        cursor.execute(command)
    except Exception as msg:
        print("Command skipped: ", msg)
    

## Realize data

fd = open('./insert-db.sql', 'r')
sqlFile = fd.read()
fd.close()

sqlCommands2 = sqlFile.split(';')

for command in sqlCommands2:
    try:
        cursor.execute(command)
    except Exception as msg:
        print("Command skipped: ", msg)


## Hovedscenen generell
row = 1
for i in range(1, 505):
    cursor.execute('INSERT INTO Stol(SalNavn, OmraadeNavn, Stolnummer, Radnummer) VALUES(?, ?, ?, ?);', ('Hovedscenen', 'Parkett', i, row))
    if i % 28 == 0:
        row += 1

cursor.execute('DELETE FROM Stol WHERE Stolnummer IN (467,468,469,470,495,496,497,498)')
## Hovedscenen galleri
for i in range(505, 525):
    cursor.execute('INSERT INTO Stol(SalNavn, OmraadeNavn, Stolnummer, Radnummer) VALUES(?, ?, ?, ?);', ('Hovedscenen', 'Galleri', i, 0))
    

## Gamle scene galleri
for i in range(1, 34):
    cursor.execute('INSERT INTO Stol(SalNavn, OmraadeNavn, Stolnummer, Radnummer) VALUES(?, ?, ?, ?);', ('Gamle scene', 'Galleri', i, 1))

for i in range(1, 19):
    cursor.execute('INSERT INTO Stol(SalNavn, OmraadeNavn, Stolnummer, Radnummer) VALUES(?, ?, ?, ?);', ('Gamle scene', 'Galleri', i, 2))
    
for i in range(1, 18):
    cursor.execute('INSERT INTO Stol(SalNavn, OmraadeNavn, Stolnummer, Radnummer) VALUES(?, ?, ?, ?);', ('Gamle scene', 'Galleri', i, 3))

## Gamle scene balkong
for i in range(1, 29):
    cursor.execute('INSERT INTO Stol(SalNavn, OmraadeNavn, Stolnummer, Radnummer) VALUES(?, ?, ?, ?);', ('Gamle scene', 'Balkong', i, 1))

for i in range(1,28):
    cursor.execute('INSERT INTO Stol(SalNavn, OmraadeNavn, Stolnummer, Radnummer) VALUES(?, ?, ?, ?);', ('Gamle scene', 'Balkong', i, 2))

for i in range(1, 23):
    cursor.execute('INSERT INTO Stol(SalNavn, OmraadeNavn, Stolnummer, Radnummer) VALUES(?, ?, ?, ?);', ('Gamle scene', 'Balkong', i, 3))

for i in range(1, 18):
    cursor.execute('INSERT INTO Stol(SalNavn, OmraadeNavn, Stolnummer, Radnummer) VALUES(?, ?, ?, ?);', ('Gamle scene', 'Balkong', i, 4))

## Gamle scene parkett

for i in range(1, 19):
    cursor.execute('INSERT INTO Stol(SalNavn, OmraadeNavn, Stolnummer, Radnummer) VALUES(?, ?, ?, ?);', ('Gamle scene', 'Parkett', i, 1))
for i in range(1, 17):
    cursor.execute('INSERT INTO Stol(SalNavn, OmraadeNavn, Stolnummer, Radnummer) VALUES(?, ?, ?, ?);', ('Gamle scene', 'Parkett', i, 2))
for i in range(1, 18):
    cursor.execute('INSERT INTO Stol(SalNavn, OmraadeNavn, Stolnummer, Radnummer) VALUES(?, ?, ?, ?);', ('Gamle scene', 'Parkett', i, 3))
for i in range(1, 19):
    cursor.execute('INSERT INTO Stol(SalNavn, OmraadeNavn, Stolnummer, Radnummer) VALUES(?, ?, ?, ?);', ('Gamle scene', 'Parkett', i, 4))
for i in range(1, 19):
    cursor.execute('INSERT INTO Stol(SalNavn, OmraadeNavn, Stolnummer, Radnummer) VALUES(?, ?, ?, ?);', ('Gamle scene', 'Parkett', i, 5))
for i in range(1, 18):
    cursor.execute('INSERT INTO Stol(SalNavn, OmraadeNavn, Stolnummer, Radnummer) VALUES(?, ?, ?, ?);', ('Gamle scene', 'Parkett', i, 6))
for i in range(1, 19):
    cursor.execute('INSERT INTO Stol(SalNavn, OmraadeNavn, Stolnummer, Radnummer) VALUES(?, ?, ?, ?);', ('Gamle scene', 'Parkett', i, 7))
for i in range(1, 18):
    cursor.execute('INSERT INTO Stol(SalNavn, OmraadeNavn, Stolnummer, Radnummer) VALUES(?, ?, ?, ?);', ('Gamle scene', 'Parkett', i, 8))
for i in range(1, 18):
    cursor.execute('INSERT INTO Stol(SalNavn, OmraadeNavn, Stolnummer, Radnummer) VALUES(?, ?, ?, ?);', ('Gamle scene', 'Parkett', i, 9))
for i in range(1, 15):
    cursor.execute('INSERT INTO Stol(SalNavn, OmraadeNavn, Stolnummer, Radnummer) VALUES(?, ?, ?, ?);', ('Gamle scene', 'Parkett', i, 10))

con.commit()
con.close()