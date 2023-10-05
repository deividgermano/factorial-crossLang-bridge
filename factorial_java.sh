#!/usr/bin/java --source 20

import java.io.IOException;
import java.util.Scanner;

public class X {
	public static Integer fact(Integer n) {
		if (n <= 1) {
         try { Thread.sleep(10000); } catch (InterruptedException ex) { }
			return 1;
		}
      Integer out = Integer.valueOf(Subprocess.run(String.format("./factorial_python.sh %s", (n - 1))));
		return n * out;
	}

	public static void main(String[] args) {
		System.out.println(fact(Integer.valueOf(args[0])));
   }
}

class Subprocess {
	public static String run(String commands) {
		String[] command = commands.split(" ");
		Process exec = null;
		String input = "";
		try {
			exec = Runtime.getRuntime().exec(command);
			Scanner s = new Scanner(exec.getInputStream()).useDelimiter("\\A");
			input = s.next();
		} catch (IOException e) {

		}
		return input.lines().findFirst().get();
	}
}