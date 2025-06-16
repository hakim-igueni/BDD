-- Villes
INSERT INTO
    Ville (nom, latitude, longitude)
VALUES
    ('Montreal', 45.5017, -73.5673),
    ('Quebec', 46.8139, -71.2080),
    ('Ottawa', 45.4215, -75.6990),
    ('Toronto', 43.6510, -79.3470),
    ('Vancouver', 49.2827, -123.1207),
    ('Halifax', 44.6488, -63.5752);

-- Hebergements
INSERT INTO
    Hebergement (
        nom,
        type,
        prix,
        latitude,
        longitude,
        note,
        ville_id
    )
VALUES
    (
        'Hotel Belle Vue',
        'Hotel',
        120.00,
        45.5020,
        -73.5675,
        NULL,
        1
    ),
    (
        'Auberge du Vieux-Port',
        'Auberge',
        85.00,
        45.5041,
        -73.5540,
        NULL,
        1
    ),
    (
        'Chateau Laurier',
        'Hotel',
        130.00,
        46.8135,
        -71.2075,
        NULL,
        2
    ),
    (
        'Backpackers Ottawa',
        'Auberge',
        45.00,
        45.4231,
        -75.6988,
        NULL,
        3
    ),
    (
        'The Drake Hotel',
        'Hotel',
        160.00,
        43.6481,
        -79.3925,
        NULL,
        4
    ),
    (
        'Sea Breeze Lodge',
        'Maison dhotes',
        95.00,
        49.2850,
        -123.1205,
        NULL,
        5
    );

-- Points d'interet
INSERT INTO
    PointInteret (
        nom,
        description_courte,
        latitude,
        longitude,
        ville_id
    )
VALUES
    (
        'Vieux-Montreal',
        'Quartier historique',
        45.5070,
        -73.5530,
        1
    ),
    (
        'Chateau Frontenac',
        'Hotel emblematique',
        46.8120,
        -71.2050,
        2
    ),
    (
        'Parlement canadien',
        'Institution politique',
        45.4235,
        -75.7000,
        3
    ),
    (
        'Tour CN',
        'Tour dobservation',
        43.6426,
        -79.3871,
        4
    ),
    (
        'Stanley Park',
        'Parc urbain',
        49.3043,
        -123.1443,
        5
    ),
    (
        'Citadelle Halifax',
        'Site historique',
        44.6470,
        -63.5800,
        6
    );

-- Activites
INSERT INTO
    Activite (
        nom,
        description,
        prix,
        duree,
        date_debut,
        date_fin,
        poi_id
    )
VALUES
    (
        'Visite guidee Vieux-Montreal',
        'Decouverte historique a pied',
        20.00,
        90,
        '2025-04-01',
        '2025-10-31',
        1
    ),
    (
        'Spectacle Chateau Frontenac',
        'Soiree artistique',
        55.00,
        120,
        '2025-05-15',
        '2025-09-15',
        2
    ),
    (
        'Visite parlement',
        'Decouverte politique canadienne',
        0.00,
        60,
        '2025-03-01',
        '2025-12-31',
        3
    ),
    (
        'Ascension Tour CN',
        'Vue panoramique',
        35.00,
        45,
        '2025-02-01',
        '2025-11-30',
        4
    ),
    (
        'Balade velo Stanley Park',
        'Nature et detente',
        15.00,
        120,
        '2025-05-01',
        '2025-09-30',
        5
    ),
    (
        'Visite nocturne Citadelle',
        'Ambiance historique',
        25.00,
        60,
        '2025-06-01',
        '2025-08-31',
        6
    );

-- Avis
INSERT INTO
    Avis (
        note,
        utilisateur,
        date_avis,
        commentaire_id,
        hebergement_id
    )
VALUES
    (
        5,
        'alice@example.com',
        '2025-05-20',
        '6650a1a1a1a1a1a1a1a1a1a1',
        1
    ),
    (
        4,
        'bob@example.com',
        '2025-05-22',
        '6650a1a2a2a2a2a2a2a2a2a2',
        1
    ),
    (
        3,
        'charlie@example.com',
        '2025-05-23',
        '6650a1a3a3a3a3a3a3a3a3a3',
        3
    ),
    (
        4,
        'diane@example.com',
        '2025-05-24',
        '6650a1a4a4a4a4a4a4a4a4a4',
        2
    ),
    (
        2,
        'emilie@example.com',
        '2025-05-25',
        '6650a1a5a5a5a5a5a5a5a5a5',
        5
    ),
    (
        5,
        'fadil@example.com',
        '2025-05-26',
        '6650a1a6a6a6a6a6a6a6a6a6',
        6
    );