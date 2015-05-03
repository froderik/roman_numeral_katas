CREATE OR REPLACE FUNCTION to_roman_numeral( pv_decimal_number INTEGER ) RETURN VARCHAR2 IS
BEGIN
  RETURN
    CASE pv_decimal_number
      WHEN 1 THEN 'I'
      WHEN 2 THEN 'II'
      WHEN 3 THEN 'III'
      WHEN 4 THEN 'IV'
      WHEN 5 THEN 'V'
      WHEN 6 THEN 'VI'
      WHEN 7 THEN 'VII'
      WHEN 8 THEN 'VIII'
    END;
END;
/

