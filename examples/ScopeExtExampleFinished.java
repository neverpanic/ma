public class ScopeExtExampleFinished implements Runnable {
	public StringBuilder buildString(StringBuilder sb) {
		sb.append("Ground control to Major Tom\n");
		sb.append("Ground control to Major Tom\n");
		sb.append("Lock your Soyuz hatch and put your helmet on\n");
		sb.append("Ground control to Major Tom\n");
		sb.append("Commencing countdown, engines on\n");
		sb.append("Detach from Station, and may god's love be with you\n");
		// $\ldots$
		return sb;
	}

	public void run() {
		StringBuilder sb = buildString(new StringBuilder());
		System.out.println(sb.toString());
	}
}
