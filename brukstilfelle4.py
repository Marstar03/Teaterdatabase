import sqlite3

## Implementasjon for brukerhistorie 4: Finn forestilling

con = sqlite3.connect("teater.db")

def finn_forestilling(Dato):
    cursor = con.cursor()
    cursor.execute('''SELECT TS.Navn, COUNT(Billett.BillettID) AS SolgteBilletter 
                   FROM Teaterstykke AS TS INNER JOIN Teaterforestilling AS TF on TS.StykkeID = TF.StykkeID 
                   LEFT OUTER JOIN Billett ON TF.Dato = Billett.Forestillingsdato 
                   AND TF.StykkeID = Billett.StykkeID WHERE TF.Dato = ? GROUP BY TS.Navn''', (Dato, ))
    rows = cursor.fetchall()
    print(f"Forestillinger på dato {Dato} er:")
    for row in rows:
        print(row)
    con.close()

date = input("Skriv inn dato for forestillingen du vil finne. Datoen må være på formen År-Måned-Dag: ")
finn_forestilling(date)