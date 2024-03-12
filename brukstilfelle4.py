import sqlite3

#Implementasjon for brukerhistorie 4: Finn forestilling#

con = sqlite3.connect("teater.db")

def finn_forestilling(Dato):
    cursor = con.cursor()
    cursor.execute("SELECT TS.Navn, COUNT(Billett.BillettID) AS SolgteBilletter FROM Teaterstykke AS TS INNER JOIN Teaterforestilling AS TF on TS.StykkeID = TF.StykkeID LEFT OUTER JOIN Billett ON TF.Dato = Billett.Forestillingsdato WHERE TF.Dato = ? GROUP BY TS.Navn", (Dato, ))
    rows = cursor.fetchall()
    print(f"Forestillinger på dato {Dato} er:")
    print(rows)
    con.close()

finn_forestilling("2024-02-03")