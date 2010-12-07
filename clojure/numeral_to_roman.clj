(defn times
    [count sign]
    (cond (= count 1) sign
        (< count 1) ""
        (> count 1) (str (times (- count 1) sign) sign))
)

(defn singular_number 
    [ones_sign fives_sign tens_sign number]
    (cond 
        (= number 0) ""
        (= number 1) ones_sign
        (= number 2) (times 2 ones_sign)
        (= number 3) (times 3 ones_sign)
        (= number 4) (str ones_sign fives_sign)
        (= number 5) fives_sign
        (= number 6) (str fives_sign ones_sign)
        (= number 7) (str fives_sign (times 2 ones_sign))
        (= number 8) (str fives_sign (times 3 ones_sign))
        (= number 9) (str ones_sign tens_sign)
    )
)

(defn numeral_to_roman
    [number]
    (str
        (times (/ number 1000) "M")
        (singular_number "C" "D" "M" (rem (/ number 100) 10))
        (singular_number "X" "L" "C" (rem (/  number 10) 10))
        (singular_number "I" "V" "X" (rem number 10))
    )
)

(defn numeral_to_roman_main 
    "A function that calculates the roman value of a number"
	[x]

	(println (numeral_to_roman x))
)

