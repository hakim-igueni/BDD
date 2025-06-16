-- Fonction de mise à jour automatique de la note moyenne d’un hébergement
CREATE OR REPLACE FUNCTION maj_note_hebergement() 
RETURNS TRIGGER AS $$
DECLARE
    heberg_id INT;
BEGIN
    -- Déterminer l'ID concerné
    heberg_id := COALESCE(NEW.hebergement_id, OLD.hebergement_id);

    -- Mettre à jour la note moyenne
    UPDATE Hebergement
    SET note = (
        SELECT ROUND(AVG(note)::NUMERIC, 2)
        FROM Avis
        WHERE hebergement_id = heberg_id
    )
    WHERE id = heberg_id;

    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

-- Trigger après insertion
CREATE TRIGGER trig_insert_avis
AFTER INSERT ON Avis
FOR EACH ROW
EXECUTE FUNCTION maj_note_hebergement();

-- Trigger après mise à jour
CREATE TRIGGER trig_update_avis
AFTER UPDATE ON Avis
FOR EACH ROW
WHEN (
    OLD.note IS DISTINCT FROM NEW.note
    OR OLD.hebergement_id IS DISTINCT FROM NEW.hebergement_id
)
EXECUTE FUNCTION maj_note_hebergement();

-- Trigger après suppression
CREATE TRIGGER trig_delete_avis
AFTER DELETE ON Avis
FOR EACH ROW
EXECUTE FUNCTION maj_note_hebergement();
