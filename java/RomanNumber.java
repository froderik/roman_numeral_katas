public class RomanNumber
{
	private int number;
	
	public RomanNumber(int number)
	{
		if(number > 3000) throw new IllegalArgumentException("RomanNumber only supports numbers up to 3000");
		this.number = number;
	}
	
	public RomanNumber(String number)
	{
		this(Integer.parseInt(number));
	}
	
	public String toString()
	{
		String result = "";
		
		int thousands =  this.number / 1000;
		result += times(thousands, "M");
		
		int hundreds = this.number / 100 % 10;
		result += times(hundreds, "C", "D", "M");

		int tens = this.number / 10 % 10;
		result += times(tens, "X", "L", "C");
		
		int ones = this.number % 10;
		result += times(ones, "I", "V", "X");
		
		
		return result;
	}
	
	private String times(int number, String character)
	{
		String result = "";
		for(int i = 0; i < number; i++)
		{
			result += character;
		}
		return result;
	}
	
	private String times(int number, String onesChar, String fivesChar, String tensChar )
	{
		switch(number)
		{
			case 0:
				return "";
			case 1:
			case 2:
			case 3:
				return times(number, onesChar);
			case 4:
				return onesChar + fivesChar;
			case 5:
			case 6:
			case 7:
			case 8:
				return fivesChar + times(number - 5, onesChar);
			case 9:
				return onesChar + tensChar;
			default:
				throw new IllegalArgumentException("Only single digits allowed - not " + number);
		}
	}
}
