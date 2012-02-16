object Roman extends App {

  if (args.length <= 0) {
    println("You have to supply a roman numeral!")
    sys.exit
  }

  val number = args.reduceLeft(_ + _).toInt

  println(List(times(number / 1000,"M"),
    times ((number / 100) % 10,"C","D","M"),
    times ((number / 10) % 10,"X","L","C"),
    times ((number % 10),"I","V","X")).reduceLeft(_ + _))

  def times(n : Int, s : String) : String = {
    n match {
      case 0 => ""
      case _ => List.fill(n)(s).reduceLeft(_ + _)
    }
  }

  def times(n : Int, a : String, b : String, c : String) : String = {
    n match {
      case x if x <= 0 => ""
      case x if x <= 3 => times(n,a)
      case x if x <= 4 => a + b
      case x if x <= 8 => b + times((n-5),a)
      case x if x <= 9 => a + c
      case _ => "Only single digits allowed!"
    }
}

}