public class FS {
	static Obj global;

	public void run() {
		Obj a = new H();
		Obj c = new I();

		c = a;
		FS.global = c;
	}
}
