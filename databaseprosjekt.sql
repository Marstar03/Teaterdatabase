CREATE TABLE Kundeprofil (
    KundeID INTEGER PRIMARY KEY AUTOINCREMENT,
    Navn TEXT NOT NULL,
    Mobilnummer INTEGER NOT NULL,
    Adresse TEXT NOT NULL
);

CREATE TABLE Billett (
    BillettID INTEGER PRIMARY KEY AUTOINCREMENT,
    StykkeID INTEGER NOT NULL,
    Forestillingsdato TEXT NOT NULL,
    Stolnummer INTEGER NOT NULL,
    Radnummer INTEGER NOT NULL,
    OmraadeNavn INTEGER NOT NULL,
    SalNavn INTEGER NOT NULL,
    BillettType TEXT NOT NULL,
    Pris INTEGER NOT NULL,
    FOREIGN KEY (StykkeID) REFERENCES Teaterforestilling(StykkeID) ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (Forestillingsdato) REFERENCES Teaterforestilling(Dato) ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (Stolnummer) REFERENCES Stol(Stolnummer) ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (Radnummer) REFERENCES Stol(Radnummer) ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (OmraadeNavn) REFERENCES Omraade(Navn) ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (BillettType) REFERENCES Gruppe(BillettType) ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (Pris) REFERENCES TillaterGruppe(Pris) ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (SalNavn) REFERENCES Teatersal(Navn) ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE Billettkjoep (
    BillettID INTEGER PRIMARY KEY,
    KundeID INTEGER NOT NULL,
    Dato TEXT NOT NULL,
    Klokkeslett TEXT NOT NULL,
    FOREIGN KEY (BillettID) REFERENCES Billett(BillettID) ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (KundeID) REFERENCES Kundeprofil(KundeID) ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE Omraade (
    SalNavn TEXT NOT NULL,
    Navn TEXT NOT NULL,
    FOREIGN KEY (SalNavn) REFERENCES Teatersal(Navn) ON DELETE NO ACTION ON UPDATE CASCADE,
    PRIMARY KEY (SalNavn, Navn)
);

CREATE TABLE Stol (
    SalNavn TEXT NOT NULL,
    OmraadeNavn TEXT NOT NULL,
    Stolnummer INTEGER NOT NULL,
    Radnummer INTEGER NOT NULL,
    FOREIGN KEY (SalNavn) REFERENCES Teatersal(Navn) ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (OmraadeNavn) REFERENCES Omraade(Navn) ON DELETE NO ACTION ON UPDATE CASCADE,
    PRIMARY KEY (SalNavn, OmraadeNavn, Stolnummer, Radnummer)
);

CREATE TABLE Teatersal (
    Navn TEXT PRIMARY KEY NOT NULL
);

CREATE TABLE Teaterstykke (
    StykkeID INTEGER PRIMARY KEY AUTOINCREMENT,
    Navn TEXT NOT NULL,
    Tidspunkt TEXT NOT NULL,
    Sesong TEXT NOT NULL,
    SalNavn TEXT NOT NULL,
    FOREIGN KEY (SalNavn) REFERENCES Teatersal(Navn) ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE Gruppe(
    BillettType TEXT PRIMARY KEY NOT NULL
);

CREATE TABLE TillaterGruppe (
    BillettType TEXT NOT NULL,
    StykkeID INTEGER NOT NULL,
    Pris INTEGER NOT NULL,
    FOREIGN KEY (BillettType) REFERENCES Gruppe(BillettType) ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (StykkeID) REFERENCES Teaterstykke(StykkeID) ON DELETE NO ACTION ON UPDATE CASCADE,
    PRIMARY KEY (BillettType, StykkeID)
);

CREATE TABLE Teaterforestilling (
    Dato TEXT NOT NULL,
    StykkeID INTEGER NOT NULL,
    FOREIGN KEY (StykkeID) REFERENCES Teaterstykke(StykkeID) ON DELETE NO ACTION ON UPDATE CASCADE,
    PRIMARY KEY (Dato, StykkeID)
);

CREATE TABLE Akt (
    StykkeID INTEGER NOT NULL,
    Aktnummer INTEGER NOT NULL,
    Navn TEXT NOT NULL,
    FOREIGN KEY (StykkeID) REFERENCES Teaterstykke(StykkeID) ON DELETE NO ACTION ON UPDATE CASCADE,
    PRIMARY KEY (StykkeID, Aktnummer)
);

CREATE TABLE Rolle (
    RolleID INTEGER PRIMARY KEY AUTOINCREMENT,
    Navn TEXT NOT NULL
);

CREATE TABLE RolleIAkt (
    StykkeID INTEGER NOT NULL,
    Aktnummer INTEGER NOT NULL,
    RolleID INTEGER NOT NULL,
    FOREIGN KEY (StykkeID) REFERENCES Teaterstykke(StykkeID) ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (Aktnummer) REFERENCES Akt(Aktnummer) ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (RolleID) REFERENCES Rolle(RolleID) ON DELETE NO ACTION ON UPDATE CASCADE,
    PRIMARY KEY (StykkeID, Aktnummer, RolleID)
);

CREATE TABLE Skuespiller (
    AnsattID INTEGER PRIMARY KEY AUTOINCREMENT,
    Navn TEXT NOT NULL,
    Epostadresse TEXT NOT NULL,
    Ansattstatus TEXT NOT NULL
);

CREATE TABLE SpillerRolle (
    SkuespillerID INTEGER NOT NULL,
    RolleID INTEGER NOT NULL,
    FOREIGN KEY (SkuespillerID) REFERENCES Skuespiller(AnsattID) ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (RolleID) REFERENCES Rolle(RolleID) ON DELETE NO ACTION ON UPDATE CASCADE,
    PRIMARY KEY (SkuespillerID, RolleID)
);

CREATE TABLE Medvirkende (
    AnsattID INTEGER PRIMARY KEY AUTOINCREMENT,
    Navn TEXT NOT NULL NOT NULL,
    Epostadresse TEXT NOT NULL,
    Ansattstatus TEXT NOT NULL,
    Ansattype TEXT NOT NULL
);

CREATE TABLE MedvirkendeForStykke(
    StykkeID INTEGER NOT NULL,
    AnsattID INTEGER NOT NULL,
    FOREIGN KEY (StykkeID) REFERENCES Teaterstykke(StykkeID) ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (AnsattID) REFERENCES Medvirkende(AnsattID) ON DELETE NO ACTION ON UPDATE CASCADE,
    PRIMARY KEY (StykkeID, AnsattID)
);

CREATE TABLE Direktoer (
    AnsattID INTEGER PRIMARY KEY AUTOINCREMENT,
    Navn TEXT NOT NULL,
    Epostadresse TEXT NOT NULL,
    Ansattstatus TEXT NOT NULL
);