CREATE TABLE Car (
    carMake   TEXT,
    carModel  TEXT,
    carYear   INTEGER,
    dailyCost INTEGER,
    kmCost    REAL,
    PRIMARY KEY (
        carMake,
        carModel,
        carYear
    )
);

CREATE TABLE Customer (
    id    INTEGER PRIMARY KEY,
    name  TEXT,
    email TEXT
);

CREATE TABLE rental (
    customerId INTEGER REFERENCES Customer (id) ON UPDATE CASCADE,
    VIN        TEXT    REFERENCES Vehicle (VIN) ON DELETE RESTRICT,
    odo_out    INTEGER,
    odo_back   INTEGER,
    date_out   TEXT,
    date_back  TEXT
);

CREATE TABLE Vehicle (
    carMake  TEXT,
    carModel TEXT,
    carYear  INTEGER,
    VIN      TEXT    PRIMARY KEY,
    odometer INTEGER CHECK (LENGTH(VIN) = 5 AND 
                            VIN GLOB '[A-HJ-NPR-Z0-9][A-HJ-NPR-Z0-9][0-9X][A-HJ-NPR-Z0-9][A-HJ-NPR-Z0-9]') 
);
