CREATE OR REPLACE FUNCTION to_roman_numeral( pv_decimal_number INTEGER ) RETURN VARCHAR2 IS
BEGIN
  RETURN
    CASE pv_decimal_number
      WHEN 1 THEN 'I'
      WHEN 2 THEN 'II'
    END;
END;
/

