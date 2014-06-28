public class ScopeExtExample implements Runnable {
	public StringBuilder buildString() {
		StringBuilder sb = new StringBuilder();

		sb.append("Ground control to Major Tom\n");
		sb.append("Ground control to Major Tom\n");
		sb.append("Lock your Soyuz hatch and put your helmet on\n");
		sb.append("Ground control to Major Tom\n");
		sb.append("Commencing countdown, engines on\n");
		sb.append("Detach from Station, and may God's love be with you\n");
		// $\ldots$

		return sb;
	}

	public void run() {
		StringBuilder sb = buildString();
		System.out.println(sb.toString());
	}
}
