public class ChooseOne implements Runnable {
	public void run() {
		Object a = getObject();
	}

	private static Object getObject() {
		return chooseOne(new Object(), new Object()); // bug occurs here$\label{line:ea:improve:bug:chooseOne}$
	}

	private static Object chooseOne(Object a, Object b) {
		if (Math.random() < 0.5)
			return a;
		return b;
	}
}
