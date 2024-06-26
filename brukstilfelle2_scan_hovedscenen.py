import sqlite3

seating = {}
current_section = None
row_number = 1
seat_number = 1

## Scanner over setene i hovedcenen og legger dataen i en dictionary.

lines = []
with open('./hovedscenen.txt', 'r') as file:
    lines = file.readlines()

for section in ['Parkett', 'Galleri']:
    for line in lines:
        line = line.strip()
        if line == section:
            current_section = line
            seating[current_section] = {}
            row_number = 0 
        elif current_section == section and all(char in '01x' for char in line):
            seating[current_section][row_number] = [(seat_number + i, int(seat)) for i, seat in enumerate(line) if seat != 'x']
            if (current_section == 'Parkett' and seat_number % 28 == 0) or (current_section == 'Galleri' and seat_number % 2 == 0):
                row_number += 1
            seat_number += len(line)
            row_number += 1
            if seat_number >= 524:
                break

with open('./hovedscenen.txt', 'r') as file:
    for line in file:
        if 'Dato' in line:
            date = line.split(' ')[1].strip()
            break
        
## Legger til billetter i databasen for setene som er tatt basert på dictionaryen.

con = sqlite3.connect('teater.db')
cursor = con.cursor()

for section, value in seating.items():
    for row_number, seats in value.items():
        for seat_number, seat in seats:
            if(seat == 1):
                stykkeID = cursor.execute('SELECT StykkeID FROM Teaterstykke WHERE Navn = "Kongsemnene" AND Sesong = "Vår 2024";').fetchone()[0]
                cursor.execute('INSERT INTO Billett(StykkeID, Forestillingsdato, Stolnummer, Radnummer, OmraadeNavn, SalNavn, BillettType, Pris) VALUES(?, ?, ?, ?, ?, ?, ?, ?);', (stykkeID, date, seat_number, row_number, section, 'Hovedscenen', 'Ordinær', 350))
                bilettID = cursor.execute('SELECT BillettID FROM Billett WHERE StykkeID = ? AND Forestillingsdato = ? AND Stolnummer = ? AND Radnummer = ? AND OmraadeNavn = ? AND SalNavn = ? AND BillettType = ? AND Pris = ?;', (stykkeID, date, seat_number, row_number, section, 'Hovedscenen', 'Ordinær', 350)).fetchone()[0]
                kundeID = cursor.execute('SELECT KundeID FROM Kundeprofil WHERE Navn = ? ', ('Dummy profile 1',)).fetchone()[0]
                cursor.execute('INSERT INTO Billettkjoep(BillettID, KundeID, Dato, klokkeslett) VALUES(?, ?, ?, ?);', (bilettID, kundeID, date, '19:00' ))
                con.commit()
con.close()