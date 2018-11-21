package info.bean;

public class LogicCalculator {
public static int score (int x, int y, String operation) {
	switch(operation) {
	case "+":
		return x+y;
	case "-":
		return x-y;
	case "*":
		return x*y;
	case "/":
		return x/y;
		default:
			return 0;
	}
}
}
