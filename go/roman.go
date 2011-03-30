package main

import (
	"fmt"
	"flag"
	"strconv"
	"bytes"
)

var input = flag.String("w", "", "Enter the string to translate")

func main() {

	flag.Parse()
	number,_ := strconv.Atoi(*input)
	result := bytes.NewBufferString("")

	fmt.Fprint(result, times(number / 1000, "M"))
	fmt.Fprint(result, timesMany(number / 100 % 10, "C", "D", "M"))
	fmt.Fprint(result, timesMany(number / 10 % 10, "X", "L", "C"))
	fmt.Fprint(result, timesMany(number % 10, "I", "V", "X"))

	fmt.Printf("%v\n", string(result.Bytes()))
}

func timesMany(number int, onesChar string, fivesChar string, tensChar string) string {
	switch number {
	case 0:
		return ""
	case 1,2,3:
		return times(number, onesChar)
	case 4:
		return fmt.Sprintf("%v%v",onesChar,fivesChar)
	case 5,6,7,8:
		return fmt.Sprintf("%v%v",fivesChar,times(number - 5, onesChar))
	case 9:
		return fmt.Sprintf("%v%v",onesChar,tensChar)
	}
	return fmt.Sprintf("Only single digits allowed - not %v", number)
}

func times(number int, character string) string {
	result := bytes.NewBufferString("")
	for i := 0; i < number; i++ {
		fmt.Fprint(result, character)
	}
	return string(result.Bytes())
}