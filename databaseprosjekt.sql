CREATE TABLE Kundeprofil (
    KundeID INTEGER PRIMARY KEY,
    Navn TEXT,
    Mobilnummer INTEGER,
    Adresse TEXT,
);

CREATE TABLE Billett (
    BillettID INTEGER PRIMARY KEY,
    Forestillingsdato TEXT NOT NULL,
    SalID INTEGER NOT NULL,
    OmraadeID INTEGER NOT NULL,
    Stolnummer INTEGER NOT NULL,
    Radnummer INTEGER NOT NULL,
    Billettype TEXT,
    Pris INTEGER,
    FOREIGN KEY (Forestillingsdato) REFERENCES Teaterforestilling(Dato) ON DELETE CASCADE,
    FOREIGN KEY (SalID) REFERENCES Teatersal(SalID) ON DELETE CASCADE,
    FOREIGN KEY (OmraadeID) REFERENCES Omraade(OmraadeID) ON DELETE CASCADE,
    FOREIGN KEY (Stolnummer) REFERENCES Stol(Stolnummer) ON DELETE CASCADE,
    FOREIGN KEY (Radnummer) REFERENCES Stol(Radnummer) ON DELETE CASCADE
);

CREATE TABLE Billettkjop (
    BillettID INTEGER PRIMARY KEY,
    KundeID INTEGER NOT NULL,
    Dato TEXT,
    Klokkeslett TEXT,
    FOREIGN KEY (BillettID) REFERENCES Billett(BillettID) ON DELETE CASCADE,
    FOREIGN KEY (KundeID) REFERENCES Kundeprofil(KundeID) ON DELETE CASCADE
);

CREATE TABLE Omraade (
    SalID INTEGER NOT NULL,
    OmraadeID INTEGER NOT NULL,
    Navn TEXT,
    FOREIGN KEY (SalID) REFERENCES Teatersal(SalID) ON DELETE CASCADE,
    PRIMARY KEY (SalID, OmraadeID)
);

CREATE TABLE Stol (
    SalID INTEGER NOT NULL,
    OmraadeID INTEGER NOT NULL,
    Stolnummer INTEGER NOT NULL,
    Radnummer INTEGER NOT NULL,
    FOREIGN KEY (SalID) REFERENCES Teatersal(SalID) ON DELETE CASCADE,
    FOREIGN KEY (OmraadeID) REFERENCES Omraade(OmraadeID) ON DELETE CASCADE,
    PRIMARY KEY (SalID, OmraadeID, Stolnummer, Radnummer)
);

CREATE TABLE Teatersal (
    SalID INTEGER PRIMARY KEY,
    Navn TEXT,
);

CREATE TABLE Teaterstykke (
    StykkeID INTEGER PRIMARY KEY,
    Navn TEXT,
    Sesong TEXT,
    SalID INTEGER NOT NULL,
    FOREIGN KEY (SalID) REFERENCES Teatersal(SalID) ON DELETE CASCADE,
);

CREATE TABLE Teaterforestilling (
    Dato TEXT NOT NULL,
    StykkeID INTEGER NOT NULL,
    FOREIGN KEY (StykkeID) REFERENCES Teaterstykke(StykkeID) ON DELETE CASCADE,
    PRIMARY KEY (Dato, StykkeID)
);

CREATE TABLE Akt (
    StykkeID INTEGER NOT NULL,
    Aktnummer INTEGER NOT NULL,
    Navn TEXT,
    FOREIGN KEY (StykkeID) REFERENCES Teaterstykke(StykkeID) ON DELETE CASCADE,
    PRIMARY KEY (StykkeID, Aktnummer)
);

CREATE TABLE Rolle (
    RolleID INTEGER PRIMARY KEY,
    Navn TEXT,
);

CREATE TABLE RolleIAkt (
    StykkeID INTEGER NOT NULL,
    Aktnummer INTEGER NOT NULL,
    RolleID INTEGER NOT NULL,
    FOREIGN KEY (StykkeID) REFERENCES Teaterstykke(StykkeID) ON DELETE CASCADE,
    FOREIGN KEY (Aktnummer) REFERENCES Akt(Aktnummer) ON DELETE CASCADE,
    FOREIGN KEY (RolleID) REFERENCES Rolle(RolleID) ON DELETE CASCADE,
    PRIMARY KEY (StykkeID, Aktnummer, RolleID)
);

CREATE TABLE Skuespiller (
    AnsattID INTEGER PRIMARY KEY,
    Navn TEXT,
    Epostadresse TEXT,
);

CREATE TABLE SpillerRolle (
    Forestillingsdato TEXT NOT NULL,
    SkuespillerID INTEGER NOT NULL,
    RolleID TEXT NOT NULL,
    FOREIGN KEY (Forestillingsdato) REFERENCES Teaterforestilling(Dato) ON DELETE CASCADE,
    FOREIGN KEY (SkuespillerID) REFERENCES Skuespiller(AnsattID) ON DELETE CASCADE,
    FOREIGN KEY (RolleID) REFERENCES Rolle(RolleID) ON DELETE CASCADE,
    PRIMARY KEY (Forestillingsdato, SkuespillerID, RolleID)
);

CREATE TABLE Medvirkende (
    AnsattID INTEGER PRIMARY KEY,
    Navn TEXT,
    Epostadresse TEXT,
    Ansattstatus TEXT,
    Ansattype TEXT,
);