SELECT distinct Teaterstykke.Navn as Teaterstykke, Skuespiller.Navn as Skuespiller, Rolle.Navn as Rolle
FROM (((Skuespiller inner join SpillerRolle on (Skuespiller.AnsattID = SpillerRolle.SkuespillerID))
inner join Rolle on (SpillerRolle.RolleID = Rolle.RolleID))
inner join RolleIAkt on (Rolle.RolleID = RolleIAkt.RolleID))
inner join Teaterstykke on (RolleIAkt.StykkeID = Teaterstykke.StykkeID)