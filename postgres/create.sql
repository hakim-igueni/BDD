--create.sql — Définition des tables avec ON DELETE CASCADE + contraintes UNIQUE
CREATE TABLE
    Ville (
        id SERIAL PRIMARY KEY,
        nom TEXT NOT NULL UNIQUE, -- Ville unique par nom
        latitude FLOAT,
        longitude FLOAT
    );

CREATE TABLE
    Hebergement (
        id SERIAL PRIMARY KEY,
        nom TEXT NOT NULL,
        type TEXT,
        prix NUMERIC,
        latitude FLOAT,
        longitude FLOAT,
        note NUMERIC,
        ville_id INT REFERENCES Ville (id) ON DELETE CASCADE,
        UNIQUE (nom, ville_id) -- Un hébergement unique par nom et ville
    );

CREATE TABLE
    PointInteret (
        id SERIAL PRIMARY KEY,
        nom TEXT NOT NULL,
        description_courte TEXT,
        latitude FLOAT,
        longitude FLOAT,
        ville_id INT REFERENCES Ville (id) ON DELETE CASCADE,
        UNIQUE (nom, ville_id) --  Un POI unique par nom et ville
    );

CREATE TABLE
    Activite (
        id SERIAL PRIMARY KEY,
        nom TEXT NOT NULL,
        description TEXT,
        prix NUMERIC,
        duree INT,
        date_debut DATE,
        date_fin DATE,
        poi_id INT REFERENCES PointInteret (id) ON DELETE CASCADE,
        UNIQUE (nom, poi_id) --  Une activité unique par nom et POI
    );

CREATE TABLE
    Avis (
        id SERIAL PRIMARY KEY,
        note INT CHECK (note BETWEEN 1 AND 5),
        utilisateur TEXT,
        date_avis DATE,
        commentaire_id TEXT UNIQUE, --  Clé MongoDB unique
        hebergement_id INT REFERENCES Hebergement (id) ON DELETE CASCADE,
        UNIQUE (utilisateur, hebergement_id) -- Un utilisateur ne note qu’un hébergement une fois
    );