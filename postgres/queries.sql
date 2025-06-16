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

-- 3. Quels sont les avis associés à un hébergement donné (ex: id = 1)
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

-- 5. Quelles sont les activités associées à un point d’intérêt donné (ex: Tour CN)
SELECT
    a.*
FROM
    Activite a
    JOIN PointInteret p ON a.poi_id = p.id
WHERE
    p.nom = 'Tour CN';

-- 6. Afficher les points d’intérêt d’une ville donnée (ex: Toronto)
SELECT
    p.*
FROM
    PointInteret p
    JOIN Ville v ON p.ville_id = v.id
WHERE
    v.nom = 'Toronto';

-- 7. Quelles sont les activités organisées dans une ville donnée (ex: Ottawa)
SELECT
    a.*
FROM
    Activite a
    JOIN PointInteret p ON a.poi_id = p.id
    JOIN Ville v ON p.ville_id = v.id
WHERE
    v.nom = 'Ottawa';

-- 8. Nombre d’hébergements par ville
SELECT
    v.nom AS ville,
    COUNT(h.id) AS nb_hebergements
FROM
    Ville v
    LEFT JOIN Hebergement h ON v.id = h.ville_id
GROUP BY
    v.nom;

-- 9. Moyenne des notes des hébergements par ville
SELECT
    v.nom AS ville,
    ROUND(AVG(h.note)::numeric, 2) AS note_moyenne
FROM
    Ville v
    JOIN Hebergement h ON v.id = h.ville_id
GROUP BY
    v.nom;

-- 10. Afficher les avis les plus récents
SELECT
    *
FROM
    Avis
ORDER BY
    date_avis DESC
LIMIT
    5;