--- FUNC ---
CREATE OR REPLACE FUNCTION fnc_trg_person_update_audit()
RETURNS TRIGGER AS 
$fnc_trg_person_update_audit$
BEGIN
    INSERT INTO person_audit (type_event, row_id, name, age, gender, address)
    	SELECT 'U', OLD.*;
    RETURN NULL;
END;
$fnc_trg_person_update_audit$ 
LANGUAGE plpgsql VOLATILE;

--- TRIGGER ---
CREATE TRIGGER trg_person_update_audit 
AFTER UPDATE ON person 
FOR EACH ROW 
EXECUTE PROCEDURE fnc_trg_person_update_audit();

--- UPDATE ---
UPDATE person 
	SET name = 'Bulat' 
	WHERE id = 10;
UPDATE person 
	SET name = 'Damir' 
	WHERE id = 10;

--- SELECT ---
SELECT * FROM person_audit;