-- triggers.sql
-- 1. Fonction de mise à jour automatique de la note moyenne d’un hébergement
CREATE OR REPLACE FUNCTION maj_note_hebergement() 
RETURNS TRIGGER AS $$
DECLARE
    heberg_id INT;
BEGIN
    -- Récupère l'ID de l'hébergement concerné (nouvelle ligne ou ancienne)
    heberg_id := COALESCE(NEW.hebergement_id, OLD.hebergement_id);

    -- Calcule et arrondit la moyenne des notes à 2 décimales
    UPDATE hebergement
    SET note = (
        SELECT ROUND(AVG(note)::NUMERIC, 2)
        FROM avis
        WHERE hebergement_id = heberg_id
    )
    WHERE id = heberg_id;

    RETURN NULL;
END;
$$ LANGUAGE plpgsql;


-- 2. Triggers liés à la table "avis"
-- Après chaque insertion
DROP TRIGGER IF EXISTS trig_insert_avis ON avis;
CREATE TRIGGER trig_insert_avis
AFTER INSERT ON avis
FOR EACH ROW
EXECUTE FUNCTION maj_note_hebergement();

-- Après chaque mise à jour qui change la note ou l'hébergement
DROP TRIGGER IF EXISTS trig_update_avis ON avis;
CREATE TRIGGER trig_update_avis
AFTER UPDATE ON avis
FOR EACH ROW
WHEN (
    OLD.note IS DISTINCT FROM NEW.note
    OR OLD.hebergement_id IS DISTINCT FROM NEW.hebergement_id
)
EXECUTE FUNCTION maj_note_hebergement();

-- Après chaque suppression
DROP TRIGGER IF EXISTS trig_delete_avis ON avis;
CREATE TRIGGER trig_delete_avis
AFTER DELETE ON avis
FOR EACH ROW
EXECUTE FUNCTION maj_note_hebergement();
