--- FUNC ---
CREATE OR REPLACE FUNCTION fnc_trg_person_delete_audit()
RETURNS TRIGGER AS 
$fnc_trg_person_delete_audit$
BEGIN
    INSERT INTO person_audit (type_event, row_id, name, age, gender, address)
    	SELECT 'D', OLD.*;
    RETURN NULL;
END;
$fnc_trg_person_delete_audit$ 
LANGUAGE plpgsql VOLATILE;

--- TRIGGER ---
CREATE TRIGGER trg_person_delete_audit 
AFTER DELETE ON person 
FOR EACH ROW 
EXECUTE PROCEDURE fnc_trg_person_delete_audit();

--- DELETE ---
DELETE FROM person WHERE id = 10;

--- SELECT ---
SELECT * FROM person_audit;