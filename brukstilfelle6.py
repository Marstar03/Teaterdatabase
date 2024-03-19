import sqlite3

## Implementasjon for brukerhistorie 6: Finn mest populære forestilling
con = sqlite3.connect("teater.db")

def finn_mest_populære_forestilling():
    cursor = con.cursor()
    cursor.execute('''SELECT TS.Navn, TF.Dato, COUNT(Billett.BillettID) AS SolgteBilletter 
                   FROM Teaterstykke AS TS join Teaterforestilling AS TF ON TS.StykkeID = TF.StykkeID 
                   LEFT OUTER JOIN Billett on TF.Dato = Billett.Forestillingsdato AND TF.StykkeID = Billett.StykkeID 
                   GROUP BY TS.Navn, TF.Dato 
                   ORDER BY SolgteBilletter DESC''')
    rows = cursor.fetchall()
    print(f"De mest populære forestillingenen sortert synkende er:")
    for row in rows:
        print(row)
    con.close()

finn_mest_populære_forestilling()