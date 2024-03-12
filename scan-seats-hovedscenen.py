import sqlite3

seating = {}
current_section = None
row_number = 1
seat_number = 1

lines = []
with open('./hovedscenen.txt', 'r') as file:
    lines = file.readlines()

for section in ['Parkett', 'Galleri']:
    for line in lines:
        line = line.strip()
        if line == section:
            current_section = line
            seating[current_section] = {}
            row_number = 1
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
            forestillingsdato = line.split(' ')[1].strip()
            break

con = sqlite3.connect('teater.db')
cursor = con.cursor()

datoBillettkjop = "2024-02-01"

for section, value in seating.items():
    for row_number, seats in value.items():
        for seat_number, seat in seats:
            if(seat == 1):
                stykkeID = cursor.execute('SELECT StykkeID FROM Teaterstykke WHERE Navn = "Kongsemnene" AND Sesong = "Vår 2024";').fetchone()[0]
                cursor.execute('INSERT INTO Billett(StykkeID, Forestillingsdato, Stolnummer, Radnummer, OmraadeNavn, SalNavn, Billettype, Pris) VALUES(?, ?, ?, ?, ?, ?, ?, ?);', (stykkeID, forestillingsdato, seat_number, row_number, section, 'Hovedscenen', 'Ordinær', 350))
                bilettID = cursor.execute('SELECT BillettID FROM Billett WHERE StykkeID = ? AND Forestillingsdato = ? AND Stolnummer = ? AND Radnummer = ? AND OmraadeNavn = ? AND SalNavn = ? AND Billettype = ? AND Pris = ?;', (stykkeID, forestillingsdato, seat_number, row_number, section, 'Hovedscenen', 'Ordinær', 350)).fetchone()[0]
                kundeID = cursor.execute('SELECT KundeID FROM Kundeprofil WHERE Navn = ? ', ('Dummy profile 1',)).fetchone()[0]
                cursor.execute('INSERT INTO Billettkjoep(BillettID, KundeID, Dato, klokkeslett) VALUES(?, ?, ?, ?);', (bilettID, kundeID, datoBillettkjop, '19:00' ))
                con.commit()
con.close()