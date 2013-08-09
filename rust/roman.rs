use std::int::*;
use std::os::*;
use std::str::*;

fn main() {

    assert!(args().len()>1,"You have to supply a number")
    
    let start_opt = from_str(args()[1]);
    
    match (start_opt) { 
        Some(start) => convert(start),
        _ => println(fmt!("Did you really give me a number: %s",args()[1]))
    }
}

fn convert(num: int) {
    println(fmt!("You entered: '%d'", num));
    times(num / 1000, ~"M");
}

fn times(num: int, ch: ~str) -> ~str {
    let mut s = with_capacity(num as uint);
    let mut i = 0;
    while i < num {
        i += 1;
        s.push_str(ch);
    }
    s
}

#[test]
fn times_with_program_input_1000_should_return_M() {
    let m = times(1000/1000,~"M");
    assert!(m == ~"M","1000 did not give 'M'");
}

#[test]
fn times_with_program_input_2000_should_return_MM() {
    let m = times(2000/1000,~"M");
    assert!(m == ~"MM","1000 did not give 'M'");
}

#[test]
fn times_should_return_M_as_a_multiple_of_1000() {
    let max = 200;
    let num = 1000;
    let mut i = 1;
    let mut expect = with_capacity(max as uint);

    while i < max {
        expect.push_str("M");
        let m = times((i*num)/1000,~"M");
        assert!(m == expect,fmt!("times(%d,%s) did not give '%s'",(i*num)/1000,"M",expect));
        i += 1;
    }
}