public class LinkedList<T> {
	private static final class ListElement<U> {
		ListElement<U> next;
		U              elem;

		public ListElement(U elem) {
			this.elem = elem;
		}
	}

	private ListElement<T> head;

	public void addElement(T elem) {
		insert(this, new ListElement<>(elem));
	}

	private static <V> void insert(LinkedList<V> list,
	                               ListElement<V> elem) {
		elem.next = list.head;
		list.head = elem; // make elem the first entry$\label{line:ea:basics:ll:headassign}$
	}
}
