import java.io.*;

public class Main {
	public static void main (String[] args) {
		try {
			DecafScanner scanner = new DecafScanner(new java.io.FileReader(args[0]));
			parser p = new parser(scanner);
			Object result = p.parse().value;
			System.out.println(result);
		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}
	}
}
