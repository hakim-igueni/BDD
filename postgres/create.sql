-- Création des tables relationnelles du projet
-- Table Ville
CREATE TABLE Ville (
    id SERIAL PRIMARY KEY,
    nom TEXT NOT NULL,
    latitude DOUBLE PRECISION,
    longitude DOUBLE PRECISION
);

-- Table Hébergement
CREATE TABLE Hebergement (
    id SERIAL PRIMARY KEY,
    nom TEXT NOT NULL,
    type TEXT,
    prix DECIMAL(8, 2) CHECK (prix >= 0),
    latitude DOUBLE PRECISION,
    longitude DOUBLE PRECISION,
    note FLOAT,
    -- moyenne des notes d'avis
    ville_id INT REFERENCES Ville(id)
);

-- Table Point d’intérêt
CREATE TABLE PointInteret (
    id SERIAL PRIMARY KEY,
    nom TEXT NOT NULL,
    description_courte TEXT,
    latitude DOUBLE PRECISION,
    longitude DOUBLE PRECISION,
    ville_id INT REFERENCES Ville(id)
);

-- Table Activité
CREATE TABLE Activite (
    id SERIAL PRIMARY KEY,
    nom TEXT NOT NULL,
    description TEXT,
    prix DECIMAL(8, 2) CHECK (prix >= 0),
    duree INT CHECK (duree > 0),
    -- durée en minutes
    date_debut DATE,
    date_fin DATE,
    CHECK (date_debut <= date_fin),
    poi_id INT REFERENCES PointInteret(id)
);

-- Table Avis
CREATE TABLE Avis (
    id SERIAL PRIMARY KEY,
    note INT CHECK (
        note BETWEEN 1
        AND 5
    ),
    utilisateur TEXT,
    date_avis DATE,
    commentaire_id VARCHAR(24),
    -- Référence à MongoDB
    hebergement_id INT REFERENCES Hebergement(id)
);