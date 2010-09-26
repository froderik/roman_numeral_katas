import junit.framework.*;

public class RomanNumberTest extends TestCase
{
	private String expectedRomanAsString;
	private int number;
	
	public RomanNumberTest(String expectedRomanAsString, int number)
	{
		super("testThisOne");
		this.expectedRomanAsString = expectedRomanAsString;
		this.number = number;
	}
	
	public void testThisOne()
	{
		RomanNumber roman = new RomanNumber(number);
		assertEquals(expectedRomanAsString, roman.toString() );
	}
	
	public static Test suite()
	{
		TestSuite suite = new TestSuite();
		suite.addTest(new RomanNumberTest("I", 1));
		suite.addTest(new RomanNumberTest("II", 2));
		suite.addTest(new RomanNumberTest("III", 3));
		suite.addTest(new RomanNumberTest("IV", 4));
		suite.addTest(new RomanNumberTest("V", 5));
		suite.addTest(new RomanNumberTest("VI", 6));
		suite.addTest(new RomanNumberTest("VIII", 8));
		suite.addTest(new RomanNumberTest("IX", 9));
		suite.addTest(new RomanNumberTest("X", 10));
		suite.addTest(new RomanNumberTest("XI", 11));
		suite.addTest(new RomanNumberTest("XIV", 14));
		suite.addTest(new RomanNumberTest("CCLVI", 256));
		return suite;
	}
}