CREATE OR REPLACE FUNCTION to_roman_numeral( pv_decimal_number INTEGER ) RETURN VARCHAR2 IS
  lv_decimal_number INTEGER := pv_decimal_number;
  lv_roman_numeral  VARCHAR2(100);

  TYPE lt_decimal_roman_map_rec IS RECORD (
    divisor INTEGER,
    symbol VARCHAR2(2)
  );
  TYPE la_decimal_roman_map IS TABLE OF lt_decimal_roman_map_rec;
  lv_decimal_roman_map la_decimal_roman_map;

  FUNCTION map( pv_divisor INTEGER, pv_symbol VARCHAR2 ) RETURN lt_decimal_roman_map_rec IS
    lv_map_rec lt_decimal_roman_map_rec;
    BEGIN
      lv_map_rec.divisor := pv_divisor;
      lv_map_rec.symbol := pv_symbol;
      RETURN lv_map_rec;
    END map;

  FUNCTION build_roman_numeral_piece(
    pv_map lt_decimal_roman_map_rec,
    pv_decimal_number IN OUT NOCOPY INTEGER
  ) RETURN VARCHAR2 IS
    lv_roman_numeral  VARCHAR2(100);
    BEGIN
      IF pv_decimal_number >= pv_map.divisor THEN
        lv_roman_numeral :=
          LPAD( pv_map.symbol
              , LENGTH( pv_map.symbol )
                * TRUNC( ( pv_decimal_number ) / pv_map.divisor )
              , pv_map.symbol);
        pv_decimal_number := MOD( pv_decimal_number, pv_map.divisor );
      END IF;
      RETURN lv_roman_numeral;
    END build_roman_numeral_piece;

BEGIN
  lv_decimal_roman_map
    := la_decimal_roman_map( map(90,'XC'), map(50,'L'), map(40,'XL'), map(10,'X'), map(9,'IX'), map(5,'V'), map(4,'IV'), map(1,'I') );
  FOR i IN lv_decimal_roman_map.FIRST .. lv_decimal_roman_map.LAST LOOP
    lv_roman_numeral := lv_roman_numeral || build_roman_numeral_piece( lv_decimal_roman_map(i), lv_decimal_number);
  END LOOP;
  RETURN lv_roman_numeral;
END;
/

