import sqlite3

con = sqlite3.connect('teater.db')
cursor = con.cursor()

## Finner 9 ledige seter.

available_seats = 0
row = 0
hit = False

while hit == False:
    # Galleri
    for rad in range(1, 4):
        row = rad
        available_seats = cursor.execute('SELECT COUNT(*) FROM Stol LEFT JOIN Billett ON Stol.Stolnummer = Billett.Stolnummer AND Stol.Radnummer = Billett.Radnummer AND Stol.OmraadeNavn = Billett.OmraadeNavn WHERE Stol.SalNavn = "Gamle scene" AND Stol.OmraadeNavn = "Galleri" AND Stol.Radnummer = ? AND Billett.BillettID IS NULL;', (rad,)).fetchone()[0]
        if (available_seats >= 9):
            omraadeNavn = "Galleri"
            hit = True
            break
    if hit:
        break
    # Balkong
    for rad in range(1,5):
        row = rad
        available_seats = cursor.execute('SELECT COUNT(*) FROM Stol LEFT JOIN Billett ON Stol.Stolnummer = Billett.Stolnummer AND Stol.Radnummer = Billett.Radnummer AND Stol.OmraadeNavn = Billett.OmraadeNavn WHERE Stol.SalNavn = "Gamle scene" AND Stol.OmraadeNavn = "Balkong" AND Stol.Radnummer = ? AND Billett.BillettID IS NULL;', (rad,)).fetchone()[0]
        if (available_seats >= 9):
            omraadeNavn = "Balkong"
            hit = True
            break
    if hit:
        break
    # Parkett
    for rad in range(1,11):
        row = rad
        available_seats = cursor.execute('SELECT COUNT(*) FROM Stol LEFT JOIN Billett ON Stol.Stolnummer = Billett.Stolnummer AND Stol.Radnummer = Billett.Radnummer AND Stol.OmraadeNavn = Billett.OmraadeNavn WHERE Stol.SalNavn = "Gamle scene" AND Stol.OmraadeNavn = "Parkett" AND Stol.Radnummer = ? AND Billett.BillettID IS NULL;', (rad,)).fetchone()[0]
        if (available_seats >= 9):
            omraadeNavn = "Parkett"
            hit = True
            break
    if hit:
        break
    
    if hit == False:
        print("No available seats")
        break
    
    ## Kjøper billetter for de 9 setene.

if(row > 0):
    stykkeID = cursor.execute('SELECT StykkeID FROM Teaterstykke JOIN Stol ON Teaterstykke.SalNavn = Stol.SalNavn').fetchone()[0]
    forestillingsdato = "2024-02-03"
    datoBillettkjop = "2024-01-25"
    salNavn = cursor.execute('SELECT SalNavn FROM Teaterstykke WHERE StykkeID = ?', (stykkeID,)).fetchone()[0]
    billettType = "Ordinær"
    pris = cursor.execute('SELECT Pris FROM TillaterGruppe WHERE StykkeID = ? AND BillettType = ?', (stykkeID, billettType)).fetchone()[0]
    
    stolnummer = cursor.execute('SELECT Stol.Stolnummer FROM Stol LEFT JOIN Billett ON Stol.Stolnummer = Billett.Stolnummer AND Stol.Radnummer = Billett.Radnummer AND Stol.OmraadeNavn = Billett.OmraadeNavn WHERE Stol.SalNavn = ? AND Stol.OmraadeNavn = ? AND Stol.Radnummer = ? AND Billett.BillettID IS NULL', (salNavn, omraadeNavn, row)).fetchall()
    stolnummer = [item[0] for item in stolnummer][:9]
        
    count = 1
    for stol in stolnummer:
        totPris = pris * count
        cursor.execute("INSERT INTO Billett(StykkeID, Forestillingsdato, Stolnummer, Radnummer, OmraadeNavn, SalNavn, BillettType, Pris) VALUES(?, ?, ?, ?, ?, ?, ?, ?);", (stykkeID, forestillingsdato, stol, row, omraadeNavn, salNavn, billettType, pris))
        billettID = cursor.execute("SELECT BillettID FROM Billett WHERE StykkeID = ? AND Forestillingsdato = ? AND Stolnummer = ? AND Radnummer = ? AND OmraadeNavn = ? AND SalNavn = ? AND BillettType = ? AND Pris = ?;", (stykkeID, forestillingsdato, stol, row, omraadeNavn, salNavn, billettType, pris)).fetchone()[0]
        kundeID = cursor.execute("SELECT KundeID FROM Kundeprofil WHERE Navn = ?;", ("Dummy profile 2",)).fetchone()[0]
        cursor.execute("INSERT INTO Billettkjoep(BillettID, KundeID, Dato, klokkeslett) VALUES(?, ?, ?, ?);", (billettID, kundeID, datoBillettkjop, "19:00"))
        con.commit()
        count += 1


print("9 seter ble kjøpt og prisen ble totalt: " + str(totPris), "kr.")
con.close()