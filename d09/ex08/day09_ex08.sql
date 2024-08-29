CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INTEGER DEFAULT 10)
  RETURNS TABLE (fib INTEGER) AS
$$
DECLARE
  a integer := 0;
  b integer := 1;
  temp integer;
BEGIN
  RETURN QUERY SELECT a;
  WHILE a < pstop LOOP
    temp := a;
    a := b;
    b := temp + b;
    IF a < pstop THEN
      RETURN QUERY SELECT a;
    ELSE
      EXIT;
    END IF;
  END LOOP;
END;
$$ LANGUAGE plpgsql;

--- CHECK ---
select * from fnc_fibonacci(100);
select * from fnc_fibonacci();