public class Factory {
	class Builder {
		// ...
	}
	protected Builder getBuilder() {
		return new Builder();
	}
}

class Simulation implements Runnable {
	@Override
	public void run() {
		Factory f = new Factory();
		while (true) {
			Builder b = f.getBuilder();
			for (Aircraft a : getAircrafts()) {
				b.addPosition(a, getPositionForAircraft(a));
			}
			SimFrame frame = b.makeFrame(); // last reference of b$\label{line:eea:idea:builder:lastb}$
			simulate(frame);
		}
	}
	// ...
}
