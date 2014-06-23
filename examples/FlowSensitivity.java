public class FlowSensitivity implements Runnable {
	static Object global;

	public void run() {
		Object a = new H();
		Object b = new I();
		Object c = new J();

		a = b;
		b = c;
		c = a;
		
		FlowSensitivity.global = c;
	}
}
