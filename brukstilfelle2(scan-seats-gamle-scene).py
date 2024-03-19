import sqlite3

seating = {}
current_section = None
row_number = 0

## Scanner over setene i gamle scene og legger dataen i en dictionary.

with open('./gamle-scene.txt', 'r') as file:
    for line in file:
        line = line.strip()
        if line in ['Galleri', 'Balkong', 'Parkett']:
            current_section = line
            seating[current_section] = {}
            row_number = 0
        elif line.isdigit():
            seating[current_section][row_number] = [(i, int(seat)) for i, seat in enumerate(line)]
            row_number += 1
          
with open('./gamle-scene.txt', 'r') as file:
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
                stykkeID = cursor.execute('SELECT StykkeID FROM Teaterstykke WHERE Navn = "Størst av alt er kjærligheten" AND Sesong = "Vår 2024";').fetchone()[0]
                cursor.execute('INSERT INTO Billett(StykkeID, Forestillingsdato, Stolnummer, Radnummer, OmraadeNavn, SalNavn, BillettType, Pris) VALUES(?, ?, ?, ?, ?, ?, ?, ?);', (stykkeID, date, seat_number, row_number, section, 'Gamle scene', 'Ordinær', 350))
                bilettID = cursor.execute('SELECT BillettID FROM Billett WHERE StykkeID = ? AND Forestillingsdato = ? AND Stolnummer = ? AND Radnummer = ? AND OmraadeNavn = ? AND SalNavn = ? AND BillettType = ? AND Pris = ?;', (stykkeID, date, seat_number, row_number, section, 'Gamle scene', 'Ordinær', 350)).fetchone()[0]
                kundeID = cursor.execute('SELECT KundeID FROM Kundeprofil WHERE Navn = ? ', ('Dummy profile 1',)).fetchone()[0]
                cursor.execute('INSERT INTO Billettkjoep(BillettID, KundeID, Dato, klokkeslett) VALUES(?, ?, ?, ?);', (bilettID, kundeID, date, '19:00' ))
                con.commit()
con.close()
