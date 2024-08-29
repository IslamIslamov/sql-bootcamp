CREATE OR REPLACE FUNCTION fnc_persons(pgender text DEFAULT 'female')
RETURNS SETOF person AS
$$
SELECT * FROM person WHERE gender = $1;
$$ LANGUAGE SQL IMMUTABLE;

--- CHECK FUNCS ---
select *
from fnc_persons(pgender := 'male');

select *
from fnc_persons();