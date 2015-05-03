CREATE OR REPLACE FUNCTION to_roman_numeral( pv_decimal_number INTEGER ) RETURN VARCHAR2 IS
  lv_decimal_number INTEGER := pv_decimal_number;
  lv_roman_numeral  VARCHAR2(100);
BEGIN
  IF lv_decimal_number >= 50 THEN
    lv_roman_numeral := lv_roman_numeral || 'L';
    lv_decimal_number := lv_decimal_number - 50;
  END IF;
  IF lv_decimal_number >= 40 THEN
    lv_roman_numeral := lv_roman_numeral || 'XL';
    lv_decimal_number := lv_decimal_number - 40;
  END IF;
  IF lv_decimal_number >= 10 THEN
    lv_roman_numeral := lv_roman_numeral || LPAD('X', TRUNC( ( lv_decimal_number ) / 10 ), 'X');
    lv_decimal_number := MOD( lv_decimal_number, 10 );
  END IF;
  IF lv_decimal_number = 9 THEN
    lv_roman_numeral := lv_roman_numeral || 'IX';
  END IF;
  IF lv_decimal_number BETWEEN 5 AND 8 THEN
    lv_roman_numeral := lv_roman_numeral || 'V';
    lv_decimal_number := lv_decimal_number - 5;
  END IF;
  IF lv_decimal_number = 4 THEN
    lv_roman_numeral := lv_roman_numeral || 'IV';
    lv_decimal_number := 0;
  END IF;
  IF lv_decimal_number BETWEEN 1 AND 3 THEN
    lv_roman_numeral := lv_roman_numeral || LPAD('I',MOD( MOD( MOD( lv_decimal_number, 5 ) , 4 ) - 1, 3 ) + 1, 'I' );
  END IF;
  RETURN lv_roman_numeral;
END;
/

