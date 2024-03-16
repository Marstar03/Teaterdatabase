import sqlite3
con = sqlite3.connect("teater.db")

cursor = con.cursor()

input_navn = input("Enter a name of an actor: ")
       
try:
    cursor.execute('''SELECT distinct medspiller.Navn, TS.Navn
    FROM Skuespiller AS medspiller
    INNER JOIN SpillerRolle as SR ON medspiller.AnsattID = SR.SkuespillerID
    INNER JOIN RolleIAkt as RIA1 ON SR.RolleID = RIA1.RolleID
    INNER JOIN Teaterstykke as TS ON RIA1.StykkeID = TS.StykkeID
    WHERE medspiller.Navn <> ?
	and (RIA1.StykkeID, RIA1.Aktnummer) IN (
        SELECT RIA2.StykkeID, RIA2.Aktnummer
        FROM Skuespiller AS S
        INNER JOIN SpillerRolle as SR2 ON S.AnsattID = SR2.SkuespillerID
        INNER JOIN RolleIAkt as RIA2 ON SR2.RolleID = RIA2.RolleID
        WHERE S.Navn = ?);''', (input_navn, input_navn))
    rows = cursor.fetchall()
    print("Finner motspillere til " + input_navn)
    for row in rows:
        print(row)
except Exception as msg:
    print("Command failed: ", msg)


con.close()

