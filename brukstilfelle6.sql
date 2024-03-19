SELECT TS.Navn, TF.Dato, COUNT(Billett.BillettID) AS SolgteBilletter 
FROM Teaterstykke AS TS join Teaterforestilling AS TF ON TS.StykkeID = TF.StykkeID 
LEFT OUTER JOIN Billett on TF.Dato = Billett.Forestillingsdato AND TF.StykkeID = Billett.StykkeID 
GROUP BY TS.Navn, TF.Dato 
ORDER BY SolgteBilletter DESC;