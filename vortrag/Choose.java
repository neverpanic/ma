public class Choose {
	public static O get() {
		return choose(new O(), new O());
	}

	private static O choose(O a, O b) {
		if (Math.random() < 0.5)
			return a;
		return b;
	}
}
