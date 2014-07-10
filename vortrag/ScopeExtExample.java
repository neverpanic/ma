public class ScopeExtExample {
	public void run() {
		StringBuilder sb = buildString();
		System.out.println(sb.toString());
	}

	public StringBuilder buildString() {
		StringBuilder sb = new StringBuilder();
		sb.append("Ground control to Major Tom\n");
		sb.append("Ground control to Major Tom\n");
		sb.append("Commencing countdown, engines on\n");
		// ...

		return sb;
	}
}
