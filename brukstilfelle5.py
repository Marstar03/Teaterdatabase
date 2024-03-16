import sqlite3
con = sqlite3.connect("teater.db")

cursor = con.cursor()
cursor.execute('''SELECT distinct Teaterstykke.Navn, Skuespiller.Navn, Rolle.Navn
    FROM (((Skuespiller inner join SpillerRolle on (Skuespiller.AnsattID = SpillerRolle.SkuespillerID))
    inner join Rolle on (SpillerRolle.RolleID = Rolle.RolleID))
    inner join RolleIAkt on (Rolle.RolleID = RolleIAkt.RolleID))
    inner join Teaterstykke on (RolleIAkt.StykkeID = Teaterstykke.StykkeID)''')

rows = cursor.fetchall()
print("Skriver ut skuespillere, samt deres rolle og teaterstykke")
for row in rows:
    print(row)
con.close()
