-- 1. Mise à jour d’un avis (modification de la note et de la date)
UPDATE Avis
SET note = 3,
    date_avis = CURRENT_DATE
WHERE utilisateur = 'alice@example.com'
  AND hebergement_id = 1;

-- 2. Mise à jour du prix d’un hébergement
UPDATE Hebergement
SET prix = 175.00
WHERE nom = 'The Drake Hotel'
  AND ville_id = (
    SELECT id FROM Ville WHERE nom = 'Toronto'
);

-- 3. Mise à jour de la description d’une activité
UPDATE Activite
SET description = 'Visite guidée du Parlement canadien avec explication historique'
WHERE nom = 'Visite parlement';

-- 4. Mise à jour des coordonnées d’un point d’intérêt
UPDATE PointInteret
SET latitude = 43.6427,
    longitude = -79.3870
WHERE nom = 'Tour CN';

-- 5. Correction de l’attribution d’un hébergement à une mauvaise ville
UPDATE Hebergement
SET ville_id = (
    SELECT id FROM Ville WHERE nom = 'Quebec'
)
WHERE nom = 'Auberge du Vieux-Port';

-- 6. Mise à jour du type d’hébergement
UPDATE Hebergement
SET type = 'Maison d''hôtes'
WHERE nom = 'Sea Breeze Lodge';

