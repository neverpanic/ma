public class LinkedList<T> {
	private static final class ListElement<U> {
		ListElement next;
		U           elem;

		public ListElement(U elem) {
			this.elem = elem;
		}
	}

	private ListElement<T> head;

	public void addElement(T element) {
		insert(this, new ListElement<>(element));
	}

	private static <V> void insert(LinkedList<V> list,
	                               ListElement<V> newElement) {
		newElement.next = list.head;
		list.head = newElement;
	}
}
