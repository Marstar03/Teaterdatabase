CREATE TABLE Kundeprofil (
    KundeID INTEGER PRIMARY KEY,
    Navn TEXT,
    Mobilnummer INTEGER,
    Adresse TEXT
);

CREATE TABLE Billett (
    BillettID INTEGER PRIMARY KEY,
    StykkeID TEXT NOT NULL,
    Forestillingsdato TEXT NOT NULL,
    Stolnummer INTEGER NOT NULL,
    Radnummer INTEGER NOT NULL,
    OmraadeNavn INTEGER NOT NULL,
    SalNavn INTEGER NOT NULL,
    Billettype TEXT,
    Pris INTEGER,
    FOREIGN KEY (StykkeID) REFERENCES Teaterforestilling(StykkeID) ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (Forestillingsdato) REFERENCES Teaterforestilling(Dato) ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (Stolnummer) REFERENCES Stol(Stolnummer) ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (Radnummer) REFERENCES Stol(Radnummer) ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (OmraadeNavn) REFERENCES Omraade(Navn) ON DELETE NO ACTION ON UPDATE CASCADE,
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
    Navn TEXT PRIMARY KEY
);

CREATE TABLE Teaterstykke (
    StykkeID INTEGER PRIMARY KEY,
    Navn TEXT,
    Tidspunkt TEXT,
    Sesong TEXT,
    SalNavn INTEGER NOT NULL,
    FOREIGN KEY (SalNavn) REFERENCES Teatersal(Navn) ON DELETE NO ACTION ON UPDATE CASCADE
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
    Navn TEXT,
    FOREIGN KEY (StykkeID) REFERENCES Teaterstykke(StykkeID) ON DELETE NO ACTION ON UPDATE CASCADE,
    PRIMARY KEY (StykkeID, Aktnummer)
);

CREATE TABLE Rolle (
    RolleID INTEGER PRIMARY KEY,
    Navn TEXT
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
    AnsattID INTEGER PRIMARY KEY,
    Navn TEXT,
    Epostadresse TEXT,
    Ansattstatus TEXT
);

CREATE TABLE SpillerRolle (
    SkuespillerID INTEGER NOT NULL,
    RolleID INTEGER NOT NULL,
    FOREIGN KEY (SkuespillerID) REFERENCES Skuespiller(AnsattID) ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (RolleID) REFERENCES Rolle(RolleID) ON DELETE NO ACTION ON UPDATE CASCADE,
    PRIMARY KEY (SkuespillerID, RolleID)
);

CREATE TABLE Medvirkende (
    AnsattID INTEGER PRIMARY KEY,
    Navn TEXT,
    Epostadresse TEXT,
    Ansattstatus TEXT,
    Ansattype TEXT
    Ansattype TEXT,
);

CREATE TABLE Direktoer (
    AnsattID INTEGER PRIMARY KEY,
    Navn TEXT,
    Epostadresse TEXT,
    Ansattstatus TEXT
    Epostadresse TEXT
    Ansattype TEXT
);