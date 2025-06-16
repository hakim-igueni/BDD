-- 📄 create.sql — Définition des tables avec ON DELETE CASCADE
CREATE TABLE
    Ville (
        id SERIAL PRIMARY KEY,
        nom TEXT NOT NULL,
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
        ville_id INT REFERENCES Ville (id) ON DELETE CASCADE
    );

CREATE TABLE
    PointInteret (
        id SERIAL PRIMARY KEY,
        nom TEXT NOT NULL,
        description_courte TEXT,
        latitude FLOAT,
        longitude FLOAT,
        ville_id INT REFERENCES Ville (id) ON DELETE CASCADE
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
        poi_id INT REFERENCES PointInteret (id) ON DELETE CASCADE
    );

CREATE TABLE
    Avis (
        id SERIAL PRIMARY KEY,
        note INT CHECK (note BETWEEN 1 AND 5),
        utilisateur TEXT,
        date_avis DATE,
        commentaire_id TEXT, -- Référence à MongoDB
        hebergement_id INT REFERENCES Hebergement (id) ON DELETE CASCADE
    );