-- delete.sql : Vider toute la base et réinitialiser les séquences
-- Supprimer toutes les données (grâce à ON DELETE CASCADE)
DELETE FROM Ville;

-- Réinitialiser les séquences
ALTER SEQUENCE ville_id_seq
RESTART WITH 1;

ALTER SEQUENCE hebergement_id_seq
RESTART WITH 1;

ALTER SEQUENCE pointinteret_id_seq
RESTART WITH 1;

ALTER SEQUENCE activite_id_seq
RESTART WITH 1;

ALTER SEQUENCE avis_id_seq
RESTART WITH 1;