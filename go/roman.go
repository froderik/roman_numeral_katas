package main

import (
	"fmt"
	"flag"
	"strconv"
	"bytes"
	"runtime"
)

var input = flag.String("w", "", "Enter the string to translate")

func main() {
	runtime.GOMAXPROCS(12)
	flag.Parse()
	number,_ := strconv.Atoi(*input)
	result := bytes.NewBufferString("")

	c1 := times(number / 1000, "M")
	c2 := timesMany(number / 100 % 10, "C", "D", "M")
	c3 := timesMany(number / 10 % 10, "X", "L", "C")
	c4 := timesMany(number % 10, "I", "V", "X")

	fmt.Fprint(result, <- c1)
	fmt.Fprint(result, <- c2)
	fmt.Fprint(result, <- c3)
	fmt.Fprint(result, <- c4)

	fmt.Printf("%v\n", string(result.Bytes()))
}

func timesMany(number int, onesChar string, fivesChar string, tensChar string) chan string {
	ch := make(chan string)
	
	go func(){
		switch number {
		case 0:
			ch <- ""
		case 1,2,3:
			//times := <- times(number, onesChar)
			ch <- <- times(number, onesChar)
		case 4:
			ch <- fmt.Sprintf("%v%v",onesChar,fivesChar)
		case 5,6,7,8:
			ch <- fmt.Sprintf("%v%v",fivesChar,<- times(number - 5, onesChar))
		case 9:
			ch <- fmt.Sprintf("%v%v",onesChar,tensChar)
		}
        }()
	return ch
}

func times(number int, character string) chan string {
	ch := make(chan string)

	go func(){
		result := bytes.NewBufferString("")
		for i := 0; i < number; i++ {
			fmt.Fprint(result, character)
		}
		ch <- string(result.Bytes())
        }()

	return ch
}
