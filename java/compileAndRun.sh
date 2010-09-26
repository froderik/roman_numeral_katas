rm *.class
javac -cp junit.jar *.java
java -cp .:junit.jar junit.textui.TestRunner RomanNumberTest