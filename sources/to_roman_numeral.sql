CREATE OR REPLACE TYPE decimal_to_roman IS OBJECT (
  divisor INTEGER,
  symbol VARCHAR2(2),
  MEMBER FUNCTION get( pv_number IN OUT NOCOPY INTEGER ) RETURN VARCHAR2
);
/

CREATE OR REPLACE TYPE BODY decimal_to_roman IS
  MEMBER FUNCTION get( pv_number IN OUT NOCOPY INTEGER ) RETURN VARCHAR2 IS
    lv_result VARCHAR2(100);
    lv_times  INTEGER := FLOOR( ( pv_number ) / divisor );
  FUNCTION repeat( pv_what VARCHAR2, pv_times INTEGER ) RETURN VARCHAR2 IS
    BEGIN
      RETURN RTRIM(LPAD( ' ', pv_times * LENGTH( pv_what ) + 1, pv_what ));
    END;
  BEGIN
    IF pv_number >= divisor THEN
      lv_result := repeat( symbol, lv_times );
      pv_number := MOD( pv_number, divisor );
    END IF;
    RETURN lv_result;
  END;
END;
/

CREATE OR REPLACE FUNCTION to_roman_numeral( pv_decimal_number INTEGER ) RETURN VARCHAR2 IS
  lv_decimal_number INTEGER := pv_decimal_number;
  lv_roman_numeral  VARCHAR2(100);

  TYPE la_decimal_roman_map IS TABLE OF decimal_to_roman;
  lv_decimal_roman_map la_decimal_roman_map;

BEGIN
  lv_decimal_roman_map
    := la_decimal_roman_map(
      decimal_to_roman(1000,'M'),
      decimal_to_roman(900,'CM'), decimal_to_roman(500,'D'), decimal_to_roman(400,'CD'), decimal_to_roman(100,'C'),
      decimal_to_roman(90,'XC'), decimal_to_roman(50,'L'), decimal_to_roman(40,'XL'), decimal_to_roman(10,'X'),
      decimal_to_roman(9,'IX'), decimal_to_roman(5,'V'), decimal_to_roman(4,'IV'), decimal_to_roman(1,'I')
      );
  FOR i IN lv_decimal_roman_map.FIRST .. lv_decimal_roman_map.LAST LOOP
    lv_roman_numeral := lv_roman_numeral || lv_decimal_roman_map(i).get(lv_decimal_number);
  END LOOP;
  RETURN lv_roman_numeral;
END;
/

