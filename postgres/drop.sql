-- Supprimer d’abord les tables de jointure
DROP TABLE IF EXISTS Etape_Activite CASCADE;

DROP TABLE IF EXISTS Etape_POI CASCADE;

-- Puis la table Etape (qui référence Voyage, Ville, Hebergement)
DROP TABLE IF EXISTS Etape CASCADE;

-- Puis la table Voyage
DROP TABLE IF EXISTS Voyage CASCADE;

-- Ensuite les tables de ton schéma initial, dans l’ordre inverse de leurs dépendances
DROP TABLE IF EXISTS Avis CASCADE;

DROP TABLE IF EXISTS Activite CASCADE;

DROP TABLE IF EXISTS PointInteret CASCADE;

DROP TABLE IF EXISTS Hebergement CASCADE;

DROP TABLE IF EXISTS Ville CASCADE;