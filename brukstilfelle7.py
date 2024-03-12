import sqlite3
con = sqlite3.connect("teater.db")

cursor = con.cursor()

input_navn = input("Enter a name of an actor: ")
       
try:
    cursor.execute('''SELECT S2.Navn, T.Navn
    FROM Skuespiller AS S2
    INNER JOIN SpillerRolle ON S2.AnsattID = SpillerRolle.SkuespillerID
    INNER JOIN RolleIAkt AS RIA2 ON SpillerRolle.RolleID = RIA2.RolleID
    INNER JOIN Teaterstykke AS T ON RIA2.StykkeID = T.StykkeID
    WHERE T.StykkeID IN (
        SELECT RIA2.StykkeID
        FROM Skuespiller AS S
        INNER JOIN SpillerRolle ON S.AnsattID = SpillerRolle.SkuespillerID
        INNER JOIN RolleIAkt AS RIA2 ON SpillerRolle.RolleID = RIA2.RolleID
        WHERE S.Navn = ?)''', (input_navn,))
    rows = cursor.fetchall()
    print("Finner motspillere til " + input_navn)
    for row in rows:
        print(row)
except Exception as msg:
    print("Command failed: ", msg)


con.close()

