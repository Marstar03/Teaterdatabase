import sqlite3

#Implementasjon for brukerhistorie 6: Finn mest populære forestilling#
con = sqlite3.connect("teater.db")

def finn_mest_populære_forestilling():
    cursor = con.cursor()
    cursor.execute("SELECT Teaterstykke.Navn, Teaterforestilling.Dato, COUNT(Billett.BillettID) AS SolgteBilletter FROM Teaterstykke AS TS inner join Teaterforestilling AS TF ON TS.StykkeID = TF.StykkeID LEFT OUTER JOIN Billett on TF.Dato = Billett.Forestillingsdato GROUP BY TS.Navn, TF.Dato ORDER BY SolgteBilletter DESC")
    rows = cursor.fetchall()
    print(f"De mest populære forestillingenen sortert synkende er: \n" + rows)
    con.close()

finn_mest_populære_forestilling()