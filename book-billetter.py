import sqlite3

con = sqlite3.connect('teater.db')
cursor = con.cursor()

available_seats = 0
row = 0
# Galleri
for rad in range(1, 4):
    row = rad
    available_seats = cursor.execute('SELECT COUNT(*) FROM Stol LEFT JOIN Billett ON Stol.Stolnummer = Billett.Stolnummer AND Stol.Radnummer = Billett.Radnummer AND Stol.OmraadeNavn = Billett.OmraadeNavn WHERE Stol.SalNavn = "Gamle scene" AND Stol.OmraadeNavn = "Galleri" AND Stol.Radnummer = ? AND Billett.BillettID IS NULL;', (rad,)).fetchone()[0]
    if (available_seats >= 9):
        omraadeNavn = "Galleri"
        break
# Balkong
    for rad in range(1,5):
        row = rad
        available_seats = cursor.execute('SELECT COUNT(*) FROM Stol LEFT JOIN Billett ON Stol.Stolnummer = Billett.Stolnummer AND Stol.Radnummer = Billett.Radnummer AND Stol.OmraadeNavn = Billett.OmraadeNavn WHERE Stol.SalNavn = "Gamle scene" AND Stol.OmraadeNavn = "Balkong" AND Stol.Radnummer = ? AND Billett.BillettID IS NULL;', (rad,)).fetchone()[0]
        if (available_seats >= 9):
            omraadeNavn = "Balkong"
            break
# Parkett
    for rad in range(1,11):
        row = rad
        available_seats = cursor.execute('SELECT COUNT(*) FROM Stol LEFT JOIN Billett ON Stol.Stolnummer = Billett.Stolnummer AND Stol.Radnummer = Billett.Radnummer AND Stol.OmraadeNavn = Billett.OmraadeNavn WHERE Stol.SalNavn = "Gamle scene" AND Stol.OmraadeNavn = "Parkett" AND Stol.Radnummer = ? AND Billett.BillettID IS NULL;', (rad,)).fetchone()[0]
        if (available_seats >= 9):
            omraadeNavn = "Parkett"
            break
if(row > 0):
    stykkeID = cursor.execute('SELECT StykkeID FROM Teaterstykke JOIN Stol ON Teaterstykke.SalNavn = Stol.SalNavn').fetchone()[0]
    dato = "2024-02-01"
    salNavn = cursor.execute('SELECT SalNavn FROM Teaterstykke WHERE StykkeID = ?', (stykkeID,)).fetchone()[0]
    billettype = "Ordinær"
    pris = 350
    
    stolnummer = cursor.execute('SELECT Stol.Stolnummer FROM Stol LEFT JOIN Billett ON Stol.Stolnummer = Billett.Stolnummer AND Stol.Radnummer = Billett.Radnummer AND Stol.OmraadeNavn = Billett.OmraadeNavn WHERE Stol.SalNavn = ? AND Stol.OmraadeNavn = ? AND Stol.Radnummer = ? AND Billett.BillettID IS NULL', (salNavn, omraadeNavn, row)).fetchall()
    stolnummer = [item[0] for item in stolnummer][:9]
        
    for stol in stolnummer:
        cursor.execute("INSERT INTO Billett(StykkeID, Forestillingsdato, Stolnummer, Radnummer, OmraadeNavn, SalNavn, Billettype, Pris) VALUES(?, ?, ?, ?, ?, ?, ?, ?);", (stykkeID, dato, stol, row, omraadeNavn, salNavn, billettype, pris))
        billettID = cursor.execute("SELECT BillettID FROM Billett WHERE StykkeID = ? AND Forestillingsdato = ? AND Stolnummer = ? AND Radnummer = ? AND OmraadeNavn = ? AND SalNavn = ? AND Billettype = ? AND Pris = ?;", (stykkeID, dato, stol, row, omraadeNavn, salNavn, billettype, pris)).fetchone()[0]
        kundeID = cursor.execute("SELECT KundeID FROM Kundeprofil WHERE Navn = ?;", ("Dummy profile 2",)).fetchone()[0]
        cursor.execute("INSERT INTO Billettkjoep(BillettID, KundeID, Dato, klokkeslett) VALUES(?, ?, ?, ?);", (billettID, kundeID, dato, "19:00"))
        con.commit()

con.close()