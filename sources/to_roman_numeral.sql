CREATE OR REPLACE FUNCTION to_roman_numeral( pv_decimal_number INTEGER ) RETURN VARCHAR2 IS

  FUNCTION get_v_or_x( pv_decimal_number INTEGER ) RETURN VARCHAR2 IS
    BEGIN
      RETURN
        CASE
          WHEN MOD( pv_decimal_number,     10 )     BETWEEN 4 AND  8 THEN  'V'
          WHEN MOD( pv_decimal_number - 1, 10 ) + 1 BETWEEN 9 AND 10 THEN  'X'
        END;
    END;
  FUNCTION get_leading_ones( pv_decimal_number INTEGER ) RETURN VARCHAR2 IS
    BEGIN
      RETURN CASE WHEN MOD( pv_decimal_number, 5 ) = 4 THEN  'I' END;
    END;
  FUNCTION get_trailing_ones( pv_decimal_number INTEGER ) RETURN VARCHAR2 IS
    BEGIN
      RETURN LPAD('I',MOD( MOD( MOD( pv_decimal_number, 5 ) , 4 ) - 1, 3 ) + 1, 'I' );
    END;
BEGIN
  RETURN get_leading_ones( pv_decimal_number ) || get_v_or_x( pv_decimal_number ) || get_trailing_ones( pv_decimal_number );
END;
/

