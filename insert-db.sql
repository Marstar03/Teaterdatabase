-- Oppretter kundeprofil som kan brukes i programmet
INSERT INTO Kundeprofil(Navn, Mobilnummer, Adresse) VALUES ('Dummy profile 1', 78282283, 'Dummy adress 1');
INSERT INTO Kundeprofil(Navn, Mobilnummer, Adresse) VALUES ('Dummy profile 2', 78282283, 'Dummy adress 2');

-- Oppretter teatersaler sammen med tilhørende områder
INSERT INTO Teatersal(Navn) VALUES ('Gamle scene');
INSERT INTO Omraade(SalNavn, Navn) VALUES ('Gamle scene', 'Galleri');
INSERT INTO Omraade(SalNavn, Navn) VALUES ('Gamle scene', 'Balkong');
INSERT INTO Omraade(SalNavn, Navn) VALUES ('Gamle scene', 'Parkett');

INSERT INTO Teatersal(Navn) VALUES ('Hovedscenen');
INSERT INTO Omraade(SalNavn, Navn) VALUES ('Hovedscenen', 'Galleri');
INSERT INTO Omraade(SalNavn, Navn) VALUES ('Hovedscenen', 'Parkett');

-- Legger inn teaterstykker
INSERT INTO Teaterstykke(Navn, Tidspunkt, Sesong, SalNavn) VALUES ('Størst av alt er kjærligheten', '19:30', 'Vår 2024', 'Gamle scene');
INSERT INTO Teaterstykke(Navn, Tidspunkt, Sesong, SalNavn) VALUES ('Kongsemnene', '18:30', 'Vår 2024', 'Hovedscenen');

-- Legger inn teaterforestillinger for Størst av alt er kjærligheten
INSERT INTO Teaterforestilling(Dato, StykkeID) VALUES ('2024-02-03', 1);
INSERT INTO Teaterforestilling(Dato, StykkeID) VALUES ('2024-02-06', 1);
INSERT INTO Teaterforestilling(Dato, StykkeID) VALUES ('2024-02-07', 1);
INSERT INTO Teaterforestilling(Dato, StykkeID) VALUES ('2024-02-12', 1);
INSERT INTO Teaterforestilling(Dato, StykkeID) VALUES ('2024-02-13', 1);
INSERT INTO Teaterforestilling(Dato, StykkeID) VALUES ('2024-02-14', 1);

-- Legger inn teaterforestillinger for Kongsemnene
INSERT INTO Teaterforestilling(Dato, StykkeID) VALUES ('2024-02-01', 2);
INSERT INTO Teaterforestilling(Dato, StykkeID) VALUES ('2024-02-02', 2);
INSERT INTO Teaterforestilling(Dato, StykkeID) VALUES ('2024-02-03', 2);
INSERT INTO Teaterforestilling(Dato, StykkeID) VALUES ('2024-02-05', 2);
INSERT INTO Teaterforestilling(Dato, StykkeID) VALUES ('2024-02-06', 2);

-- Legger inn akter for Størst av alt er kjærligheten
INSERT INTO Akt(StykkeID, Aktnummer, Navn) VALUES (1, 1, 'Akt 1');

-- Legger inn akter for Kongsemnene
INSERT INTO Akt(StykkeID, Aktnummer, Navn) VALUES (2, 1, 'Akt 1');
INSERT INTO Akt(StykkeID, Aktnummer, Navn) VALUES (2, 2, 'Akt 2');
INSERT INTO Akt(StykkeID, Aktnummer, Navn) VALUES (2, 3, 'Akt 3');
INSERT INTO Akt(StykkeID, Aktnummer, Navn) VALUES (2, 4, 'Akt 4');
INSERT INTO Akt(StykkeID, Aktnummer, Navn) VALUES (2, 5, 'Akt 5');

-- Legger inn roller for Størst av alt er kjærligheten
INSERT INTO Rolle(Navn) VALUES ('Sunniva Du Mond Nordal');
INSERT INTO Rolle(Navn) VALUES ('Jo Saberniak');
INSERT INTO Rolle(Navn) VALUES ('Marte M. Steinholt');
INSERT INTO Rolle(Navn) VALUES ('Tor Ivar Hagen');
INSERT INTO Rolle(Navn) VALUES ('Trond-Ove Skrødal');
INSERT INTO Rolle(Navn) VALUES ('Natalie Grøndahl Tangen');
INSERT INTO Rolle(Navn) VALUES ('Åsmund Flaten');

-- Legger inn roller for Kongsemnene
INSERT INTO Rolle(Navn) VALUES ('Håkon Håkonson');
INSERT INTO Rolle(Navn) VALUES ('Dagfinn Bonde');
INSERT INTO Rolle(Navn) VALUES ('Jatgeir Skald');
INSERT INTO Rolle(Navn) VALUES ('Sigrid');
INSERT INTO Rolle(Navn) VALUES ('Ingeborg');
INSERT INTO Rolle(Navn) VALUES ('Guttorm Ingesson');
INSERT INTO Rolle(Navn) VALUES ('Skule Jarl');
INSERT INTO Rolle(Navn) VALUES ('Inga frå Vartejg');
INSERT INTO Rolle(Navn) VALUES ('Paal Flida');
INSERT INTO Rolle(Navn) VALUES ('Ragnhild');
INSERT INTO Rolle(Navn) VALUES ('Gregorius Jonsson');
INSERT INTO Rolle(Navn) VALUES ('Margrete');
INSERT INTO Rolle(Navn) VALUES ('Biskop Nikolas');
INSERT INTO Rolle(Navn) VALUES ('Peter');

-- Legger inn RolleIAkt-relasjoner for Størst av alt er kjærligheten
-- Akt 1
INSERT INTO RolleIAkt(StykkeID, Aktnummer, RolleID) VALUES (1, 1, 1);
INSERT INTO RolleIAkt(StykkeID, Aktnummer, RolleID) VALUES (1, 1, 2);
INSERT INTO RolleIAkt(StykkeID, Aktnummer, RolleID) VALUES (1, 1, 3);
INSERT INTO RolleIAkt(StykkeID, Aktnummer, RolleID) VALUES (1, 1, 4);
INSERT INTO RolleIAkt(StykkeID, Aktnummer, RolleID) VALUES (1, 1, 5);
INSERT INTO RolleIAkt(StykkeID, Aktnummer, RolleID) VALUES (1, 1, 6);
INSERT INTO RolleIAkt(StykkeID, Aktnummer, RolleID) VALUES (1, 1, 7);

-- Legger inn RolleIAkt-relasjoner for Kongsemnene
-- Akt 1
INSERT INTO RolleIAkt(StykkeID, Aktnummer, RolleID) VALUES (2, 1, 8);
INSERT INTO RolleIAkt(StykkeID, Aktnummer, RolleID) VALUES (2, 1, 9);
INSERT INTO RolleIAkt(StykkeID, Aktnummer, RolleID) VALUES (2, 1, 11);
INSERT INTO RolleIAkt(StykkeID, Aktnummer, RolleID) VALUES (2, 1, 13);
INSERT INTO RolleIAkt(StykkeID, Aktnummer, RolleID) VALUES (2, 1, 14);
INSERT INTO RolleIAkt(StykkeID, Aktnummer, RolleID) VALUES (2, 1, 15);
INSERT INTO RolleIAkt(StykkeID, Aktnummer, RolleID) VALUES (2, 1, 16);
INSERT INTO RolleIAkt(StykkeID, Aktnummer, RolleID) VALUES (2, 1, 17);
INSERT INTO RolleIAkt(StykkeID, Aktnummer, RolleID) VALUES (2, 1, 18);
INSERT INTO RolleIAkt(StykkeID, Aktnummer, RolleID) VALUES (2, 1, 19);
INSERT INTO RolleIAkt(StykkeID, Aktnummer, RolleID) VALUES (2, 1, 20);
-- Akt 2
INSERT INTO RolleIAkt(StykkeID, Aktnummer, RolleID) VALUES (2, 2, 8);
INSERT INTO RolleIAkt(StykkeID, Aktnummer, RolleID) VALUES (2, 2, 9);
INSERT INTO RolleIAkt(StykkeID, Aktnummer, RolleID) VALUES (2, 2, 11);
INSERT INTO RolleIAkt(StykkeID, Aktnummer, RolleID) VALUES (2, 2, 14);
INSERT INTO RolleIAkt(StykkeID, Aktnummer, RolleID) VALUES (2, 2, 16);
INSERT INTO RolleIAkt(StykkeID, Aktnummer, RolleID) VALUES (2, 2, 18);
INSERT INTO RolleIAkt(StykkeID, Aktnummer, RolleID) VALUES (2, 2, 19);
INSERT INTO RolleIAkt(StykkeID, Aktnummer, RolleID) VALUES (2, 2, 20);
-- Akt 3
INSERT INTO RolleIAkt(StykkeID, Aktnummer, RolleID) VALUES (2, 3, 8);
INSERT INTO RolleIAkt(StykkeID, Aktnummer, RolleID) VALUES (2, 3, 9);
INSERT INTO RolleIAkt(StykkeID, Aktnummer, RolleID) VALUES (2, 3, 14);
INSERT INTO RolleIAkt(StykkeID, Aktnummer, RolleID) VALUES (2, 3, 15);
INSERT INTO RolleIAkt(StykkeID, Aktnummer, RolleID) VALUES (2, 3, 16);
INSERT INTO RolleIAkt(StykkeID, Aktnummer, RolleID) VALUES (2, 3, 18);
INSERT INTO RolleIAkt(StykkeID, Aktnummer, RolleID) VALUES (2, 3, 19);
INSERT INTO RolleIAkt(StykkeID, Aktnummer, RolleID) VALUES (2, 3, 20);
INSERT INTO RolleIAkt(StykkeID, Aktnummer, RolleID) VALUES (2, 3, 21);
-- Akt 4
INSERT INTO RolleIAkt(StykkeID, Aktnummer, RolleID) VALUES (2, 4, 8);
INSERT INTO RolleIAkt(StykkeID, Aktnummer, RolleID) VALUES (2, 4, 9);
INSERT INTO RolleIAkt(StykkeID, Aktnummer, RolleID) VALUES (2, 4, 10);
INSERT INTO RolleIAkt(StykkeID, Aktnummer, RolleID) VALUES (2, 4, 12);
INSERT INTO RolleIAkt(StykkeID, Aktnummer, RolleID) VALUES (2, 4, 14);
INSERT INTO RolleIAkt(StykkeID, Aktnummer, RolleID) VALUES (2, 4, 16);
INSERT INTO RolleIAkt(StykkeID, Aktnummer, RolleID) VALUES (2, 4, 18);
INSERT INTO RolleIAkt(StykkeID, Aktnummer, RolleID) VALUES (2, 4, 19);
INSERT INTO RolleIAkt(StykkeID, Aktnummer, RolleID) VALUES (2, 4, 21);
-- Akt 5
INSERT INTO RolleIAkt(StykkeID, Aktnummer, RolleID) VALUES (2, 5, 8);
INSERT INTO RolleIAkt(StykkeID, Aktnummer, RolleID) VALUES (2, 5, 9);
INSERT INTO RolleIAkt(StykkeID, Aktnummer, RolleID) VALUES (2, 5, 11);
INSERT INTO RolleIAkt(StykkeID, Aktnummer, RolleID) VALUES (2, 5, 14);
INSERT INTO RolleIAkt(StykkeID, Aktnummer, RolleID) VALUES (2, 5, 16);
INSERT INTO RolleIAkt(StykkeID, Aktnummer, RolleID) VALUES (2, 5, 17);
INSERT INTO RolleIAkt(StykkeID, Aktnummer, RolleID) VALUES (2, 5, 18);
INSERT INTO RolleIAkt(StykkeID, Aktnummer, RolleID) VALUES (2, 5, 19);
INSERT INTO RolleIAkt(StykkeID, Aktnummer, RolleID) VALUES (2, 5, 21);

-- Setter inn skuespillere for Størst av alt er kjærligheten
INSERT INTO Skuespiller(Navn, Epostadresse, Ansattstatus) VALUES ('Sunniva Du Mond Nordal', 'sunniva.nordal@trondelagteater.no', 'Fulltid');
INSERT INTO Skuespiller(Navn, Epostadresse, Ansattstatus) VALUES ('Jo Saberniak', 'jo.saberniak@trondelagteater.no', 'Fulltid');
INSERT INTO Skuespiller(Navn, Epostadresse, Ansattstatus) VALUES ('Marte M. Steinholt', 'marte.steinholt@trondelagteater.no', 'Fulltid');
INSERT INTO Skuespiller(Navn, Epostadresse, Ansattstatus) VALUES ('Tor Ivar Hagen', 'tor.hagen@trondelagteater.no', 'Fulltid');
INSERT INTO Skuespiller(Navn, Epostadresse, Ansattstatus) VALUES ('Trond-Ove Skrødal', 'trond.skrodal@trondelagteater.no', 'Fulltid');
INSERT INTO Skuespiller(Navn, Epostadresse, Ansattstatus) VALUES ('Natalie Grøndahl Tangen', 'natalie.tangen@trondelagteater.no', 'Fulltid');
INSERT INTO Skuespiller(Navn, Epostadresse, Ansattstatus) VALUES ('Åsmund Flaten', 'aasmund.flaten@trondelagteater.no', 'Deltid');

-- Setter inn medvirkende for Størst av alt er kjærligheten
INSERT INTO Medvirkende(Navn, Epostadresse, Ansattstatus, Ansattype) VALUES ('Jonas Corell Petersen', 'jonas.petersen@trondelagteater.no', 'Fulltid', 'Regissør');
INSERT INTO Medvirkende(Navn, Epostadresse, Ansattstatus, Ansattype) VALUES ('David Gehrt', 'david.gehrt@trondelagteater.no', 'Deltid', 'Scenograf');
INSERT INTO Medvirkende(Navn, Epostadresse, Ansattstatus, Ansattype) VALUES ('Gaute Tønder', 'gaute.tonder@trondelagteater.no', 'Deltid', 'Lyddesigner');
INSERT INTO Medvirkende(Navn, Epostadresse, Ansattstatus, Ansattype) VALUES ('Magnus Mikaelsen', 'magnus.mikaelsen@trondelagteater.no', 'Deltid', 'Lysdesigner');
INSERT INTO Medvirkende(Navn, Epostadresse, Ansattstatus, Ansattype) VALUES ('Kristoffer Spender', 'kristoffer.spender@trondelagteater.no', 'Deltid', 'Dramaturg');

-- Setter inn SpillerRolle-relasjon for Størst av alt er kjærligheten
INSERT INTO SpillerRolle(SkuespillerID, RolleID) VALUES (1, 1);
INSERT INTO SpillerRolle(SkuespillerID, RolleID) VALUES (2, 2);
INSERT INTO SpillerRolle(SkuespillerID, RolleID) VALUES (3, 3);
INSERT INTO SpillerRolle(SkuespillerID, RolleID) VALUES (4, 4);
INSERT INTO SpillerRolle(SkuespillerID, RolleID) VALUES (5, 5);
INSERT INTO SpillerRolle(SkuespillerID, RolleID) VALUES (6, 6);
INSERT INTO SpillerRolle(SkuespillerID, RolleID) VALUES (7, 7);

-- Setter inn MedvirkendeForStykke-relasjon for Størst av alt er kjærligheten
INSERT INTO MedvirkendeForStykke(StykkeID, AnsattID) VALUES (1, 1);
INSERT INTO MedvirkendeForStykke(StykkeID, AnsattID) VALUES (1, 2);
INSERT INTO MedvirkendeForStykke(StykkeID, AnsattID) VALUES (1, 3);
INSERT INTO MedvirkendeForStykke(StykkeID, AnsattID) VALUES (1, 4);
INSERT INTO MedvirkendeForStykke(StykkeID, AnsattID) VALUES (1, 5);

-- Setter inn skuespillere for Kongsemnene
INSERT INTO Skuespiller(Navn, Epostadresse, Ansattstatus) VALUES ('Arturo Scotti', 'arturo.scotti@trondelagteater.no', 'Deltid');
INSERT INTO Skuespiller(Navn, Epostadresse, Ansattstatus) VALUES ('Ingunn Beate Strige Øyen', 'ingunn.oyen@trondelagteater.no', 'Fulltid');
INSERT INTO Skuespiller(Navn, Epostadresse, Ansattstatus) VALUES ('Hans Petter Nilsen', 'hans.nilsen@trondelagteater.no', 'Fulltid');
INSERT INTO Skuespiller(Navn, Epostadresse, Ansattstatus) VALUES ('Madeleine Brandtzæg Nilsen', 'madeleine.nilsen@trondelagteater.no', 'Fulltid');
INSERT INTO Skuespiller(Navn, Epostadresse, Ansattstatus) VALUES ('Synnøve Fossum Eriksen', 'synnove.eriksen@trondelagteater.no', 'Deltid');
INSERT INTO Skuespiller(Navn, Epostadresse, Ansattstatus) VALUES ('Emma Caroline Deichmann', 'emma.deichmann@trondelagteater.no', 'Fulltid');
INSERT INTO Skuespiller(Navn, Epostadresse, Ansattstatus) VALUES ('Thomas Jensen Takyi', 'thomas.takyi@trondelagteater.no', 'Fulltid');
INSERT INTO Skuespiller(Navn, Epostadresse, Ansattstatus) VALUES ('Per Bogstad Gulliksen', 'per.gulliksen@trondelagteater.no', 'Fulltid');
INSERT INTO Skuespiller(Navn, Epostadresse, Ansattstatus) VALUES ('Isak Holmen Sørensen', 'isak.sorensen@trondelagteater.no', 'Fulltid');
INSERT INTO Skuespiller(Navn, Epostadresse, Ansattstatus) VALUES ('Fabian Heidelberg Lunde', 'fabian.lunde@trondelagteater.no', 'Deltid');
INSERT INTO Skuespiller(Navn, Epostadresse, Ansattstatus) VALUES ('Emil Olafsson', 'emil.olaffson@trondelagteater.no', 'Deltid');
INSERT INTO Skuespiller(Navn, Epostadresse, Ansattstatus) VALUES ('Snorre Ryen Tøndel', 'snorre.tondel@trondelagteater.no', 'Fulltid');

-- Setter inn medvirkende for Kongsemnene
INSERT INTO Medvirkende(Navn, Epostadresse, Ansattstatus, Ansattype) VALUES ('Yury Butusov', 'yury.butusov@trondelagteater.no', 'Fulltid', 'Regissør');
INSERT INTO Medvirkende(Navn, Epostadresse, Ansattstatus, Ansattype) VALUES ('Aleksandr Shishkin-Hokusai', 'aleksandr.hokusai@trondelagteater.no', 'Deltid', 'Scenograf');
INSERT INTO Medvirkende(Navn, Epostadresse, Ansattstatus, Ansattype) VALUES ('Eivind Myren', 'eivind.myren@trondelagteater.no', 'Deltid', 'Lysdesigner');
INSERT INTO Medvirkende(Navn, Epostadresse, Ansattstatus, Ansattype) VALUES ('Mina Rype Stokke', 'mina.stokke@trondelagteater.no', 'Deltid', 'Dramaturg');

-- Setter inn SpillerRolle-relasjon for Kongsemnene
INSERT INTO SpillerRolle(SkuespillerID, RolleID) VALUES (8, 8);
INSERT INTO SpillerRolle(SkuespillerID, RolleID) VALUES (9, 15);
INSERT INTO SpillerRolle(SkuespillerID, RolleID) VALUES (10, 14);
INSERT INTO SpillerRolle(SkuespillerID, RolleID) VALUES (11, 17);
INSERT INTO SpillerRolle(SkuespillerID, RolleID) VALUES (12, 19);
INSERT INTO SpillerRolle(SkuespillerID, RolleID) VALUES (13, 11);
INSERT INTO SpillerRolle(SkuespillerID, RolleID) VALUES (13, 12); --Tolker Ingebjørg som Ingeborg
INSERT INTO SpillerRolle(SkuespillerID, RolleID) VALUES (14, 20);
INSERT INTO SpillerRolle(SkuespillerID, RolleID) VALUES (15, 18);
INSERT INTO SpillerRolle(SkuespillerID, RolleID) VALUES (16, 16);
INSERT INTO SpillerRolle(SkuespillerID, RolleID) VALUES (17, 13); --Er nok feil, men finner ingen andre som skal spille rolle 13, og rollen til spiller 17 finner jeg ikke
INSERT INTO SpillerRolle(SkuespillerID, RolleID) VALUES (18, 10);
INSERT INTO SpillerRolle(SkuespillerID, RolleID) VALUES (18, 9);
INSERT INTO SpillerRolle(SkuespillerID, RolleID) VALUES (19, 21);

-- Setter inn MedvirkendeForStykke-relasjon for Kongsemnene
INSERT INTO MedvirkendeForStykke(StykkeID, AnsattID) VALUES (2, 6);
INSERT INTO MedvirkendeForStykke(StykkeID, AnsattID) VALUES (2, 7);
INSERT INTO MedvirkendeForStykke(StykkeID, AnsattID) VALUES (2, 8);
INSERT INTO MedvirkendeForStykke(StykkeID, AnsattID) VALUES (2, 9);

-- Setter inn direktør for Trøndelag teater
INSERT INTO Direktoer(Navn, Epostadresse, Ansattstatus) VALUES ('Elisabeth Egseth Hansen', 'elisabeth.hansen@trondelagteater.no', 'Fulltid');
