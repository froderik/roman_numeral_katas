CREATE OR REPLACE FUNCTION to_roman_numeral( pv_decimal_number INTEGER ) RETURN VARCHAR2 IS

  FUNCTION get_leading_ones( pv_decimal_number INTEGER , pv_range INTEGER ) RETURN VARCHAR2 IS
    BEGIN
      RETURN
        CASE
          WHEN pv_range = 10 AND MOD( pv_decimal_number, 10 ) = 9
            OR pv_range =  5 AND MOD( pv_decimal_number, 10 ) = 4
          THEN 'I'
        END;
    END;

  FUNCTION get_v( pv_decimal_number INTEGER ) RETURN VARCHAR2 IS
    BEGIN
      RETURN
        get_leading_ones( pv_decimal_number,  5 )
        || CASE WHEN MOD( pv_decimal_number, 10 ) BETWEEN 4 AND  8 THEN  'V' END;
    END;

  FUNCTION get_x( pv_decimal_number INTEGER ) RETURN VARCHAR2 IS
    BEGIN
      RETURN
        get_leading_ones( pv_decimal_number, 10 )
        || TRIM( LPAD(' ', TRUNC( ( pv_decimal_number + 1 ) / 10 )+1, 'X') );
    END;

  FUNCTION get_trailing_ones( pv_decimal_number INTEGER ) RETURN VARCHAR2 IS
    BEGIN
      RETURN LPAD('I',MOD( MOD( MOD( pv_decimal_number, 5 ) , 4 ) - 1, 3 ) + 1, 'I' );
    END;

BEGIN
  RETURN get_x(pv_decimal_number) || get_v( pv_decimal_number ) || get_trailing_ones( pv_decimal_number );
END;
/

