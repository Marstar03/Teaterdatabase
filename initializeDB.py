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

sqlCommands = sqlFile.split(';')

for command in sqlCommands:
    try:
        cursor.execute(command)
    except Exception as msg:
        print("Command skipped: ", msg)
    
con.commit()

## Realize data

fd = open('./insert-db.sql', 'r')
sqlFile = fd.read()
fd.close()

sqlComands = sqlFile.split(';')

for command in sqlCommands:
    try:
        cursor.execute(command)
    except Exception as msg:
        print("Command skipped: ", msg)

con.commit()

## Hovedscenen generell
row = 0
for i in range(1, 504):
    if i % 28 == 0:
        row += 1
    cursor.execute('INSERT INTO Stol(SalNavn, OmraadeNavn, Stolnummer, Radnummer) VALUES(?, ?, ?, ?)', ('Hovedscenen', '', i, row))

## Hovedscenen galleri
for i in range(504, 520):
    if i % 2 == 0:
        row += 1
    cursor.execute('INSERT INTO Stol(SalNavn, OmraadeNavn, Stolnummer, Radnummer) VALUES(?, ?, ?, ?)', ('Hovedscenen', 'Galleri', i, row))
    

## Gamle scene galleri
for i in range(1, 33):
    cursor.execute('INSERT INTO Stol(SalNavn, OmraadeNavn, Stolnummer, Radnummer) VALUES(?, ?, ?, ?)', ('Gamle scene', 'Galleri', i, 1))

for i in range(1, 18):
    cursor.execute('INSERT INTO Stol(SalNavn, OmraadeNavn, Stolnummer, Radnummer) VALUES(?, ?, ?, ?)', ('Gamle scene', 'Galleri', i, 2))
    
for i in range(1, 17):
    cursor.execute('INSERT INTO Stol(SalNavn, OmraadeNavn, Stolnummer, Radnummer) VALUES(?, ?, ?, ?)', ('Gamle scene', 'Galleri', i, 3))

## Gamle scene balkong
for i in range(1, 28):
    cursor.execute('INSERT INTO Stol(SalNavn, OmraadeNavn, Stolnummer, Radnummer) VALUES(?, ?, ?, ?)', ('Gamle scene', 'Balkong', i, 1))

for i in range(1,27):
    cursor.execute('INSERT INTO Stol(SalNavn, OmraadeNavn, Stolnummer, Radnummer) VALUES(?, ?, ?, ?)', ('Gamle scene', 'Balkong', i, 2))

for i in range(1, 22):
    cursor.execute('INSERT INTO Stol(SalNavn, OmraadeNavn, Stolnummer, Radnummer) VALUES(?, ?, ?, ?)', ('Gamle scene', 'Balkong', i, 3))

for i in range(1, 17):
    cursor.execute('INSERT INTO Stol(SalNavn, OmraadeNavn, Stolnummer, Radnummer) VALUES(?, ?, ?, ?)', ('Gamle scene', 'Balkong', i, 4))

## Gamle scene parkett

for i in range(1, 18):
    cursor.execute('INSERT INTO Stol(SalNavn, OmraadeNavn, Stolnummer, Radnummer) VALUES(?, ?, ?, ?)', ('Gamle scene', 'Parkett', i, 1))
for i in range(1, 16):
    cursor.execute('INSERT INTO Stol(SalNavn, OmraadeNavn, Stolnummer, Radnummer) VALUES(?, ?, ?, ?)', ('Gamle scene', 'Parkett', i, 2))
for i in range(1, 17):
    cursor.execute('INSERT INTO Stol(SalNavn, OmraadeNavn, Stolnummer, Radnummer) VALUES(?, ?, ?, ?)', ('Gamle scene', 'Parkett', i, 3))
for i in range(1, 18):
    cursor.execute('INSERT INTO Stol(SalNavn, OmraadeNavn, Stolnummer, Radnummer) VALUES(?, ?, ?, ?)', ('Gamle scene', 'Parkett', i, 4))
for i in range(1, 18):
    cursor.execute('INSERT INTO Stol(SalNavn, OmraadeNavn, Stolnummer, Radnummer) VALUES(?, ?, ?, ?)', ('Gamle scene', 'Parkett', i, 5))
for i in range(1, 17):
    cursor.execute('INSERT INTO Stol(SalNavn, OmraadeNavn, Stolnummer, Radnummer) VALUES(?, ?, ?, ?)', ('Gamle scene', 'Parkett', i, 6))
for i in range(1, 18):
    cursor.execute('INSERT INTO Stol(SalNavn, OmraadeNavn, Stolnummer, Radnummer) VALUES(?, ?, ?, ?)', ('Gamle scene', 'Parkett', i, 7))
for i in range(1, 17):
    cursor.execute('INSERT INTO Stol(SalNavn, OmraadeNavn, Stolnummer, Radnummer) VALUES(?, ?, ?, ?)', ('Gamle scene', 'Parkett', i, 8))
for i in range(1, 17):
    cursor.execute('INSERT INTO Stol(SalNavn, OmraadeNavn, Stolnummer, Radnummer) VALUES(?, ?, ?, ?)', ('Gamle scene', 'Parkett', i, 9))
for i in range(1, 14):
    cursor.execute('INSERT INTO Stol(SalNavn, OmraadeNavn, Stolnummer, Radnummer) VALUES(?, ?, ?, ?)', ('Gamle scene', 'Parkett', i, 10))
