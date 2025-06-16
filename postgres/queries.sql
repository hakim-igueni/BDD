-- 📌 Requêtes d'interrogation SQL pour le projet polyglotte
-- 1. Quels sont les hébergements d’une ville donnée (ex: Montréal)
SELECT
    h.*
FROM
    Hebergement h
    JOIN Ville v ON h.ville_id = v.id
WHERE
    v.nom = 'Montreal';

-- 2. Quelle est la note moyenne d’un hébergement (ex: id = 1)
SELECT
    note
FROM
    Hebergement
WHERE
    id = 1;

-- 3. Quels sont les avis liés à un hébergement donné (ex: id = 1)
SELECT
    *
FROM
    Avis
WHERE
    hebergement_id = 1;

-- 4. Liste des activités entre avril et juin (inclus)
SELECT
    *
FROM
    Activite
WHERE
    EXTRACT(
        MONTH
        FROM
            date_debut
    ) <= 6
    AND EXTRACT(
        MONTH
        FROM
            date_fin
    ) >= 4;

-- 5. Quelles sont les activités associées à un point d’intérêt donné (ex: 'Tour CN')
SELECT
    a.*
FROM
    Activite a
    JOIN PointInteret p ON a.poi_id = p.id
WHERE
    p.nom = 'Tour CN';