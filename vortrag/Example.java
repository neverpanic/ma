public class Example {
	public long distance(Point2D a, Point2D b) {
		Vector2D vec = new Vector2D(b.x - a.x, b.y - a.y);
		return vec.length();
	}
}
