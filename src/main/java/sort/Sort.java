package sort;

public class Sort {

	/*
	 * ========================================================= Selection sort:
	 * pick the smallest from the array and put it at the n[0], again search for the
	 * smallest in the remaining array and put it to n[1] Repeat the process.
	 * =========================================================
	 */

	public void selectionSort(int[] n) {
		// TODO Auto-generated method stub
		int t = n.length;

		for (int i = 0; i < t - 1; i++) {
			int min = i;// for comparing one will be necessary
			for (int j = i + 1; j < t; j++) {
				if (n[min] > n[j])
					min = j;
			}
			// We got the min number now swap with correct position
			// swap(n[min],n[i]);
			int temp = n[min];
			n[min] = n[i];
			n[i] = temp;

		}
	}

	/*
	 * ========================================================= Bubble Sort:
	 * Compare the adjacent element and swap if out of order. 1.Compare pair of
	 * adjacent items 2.Swap if the items are out of order 3.Repeat until the end of
	 * array  The largest item will be at the last position 4.Reduce n by 1 and go
	 * to Step 1 =========================================================
	 */

	public void bubbleSort(int[] a) {
		for (int i = 0; i < a.length - 1; i++) {
			for (int j = 0; j < a.length - i - 1; j++) {
				if (a[j] > a[j + 1]) {
					// the two numbers are out of order swap
					int temp = a[j];
					a[j] = a[j + 1];
					a[j + 1] = temp;
				}
			}
		}
	}

	/*
	 * ========================================================= Insertion Sort
	 * Array divided into two parts Sorted and Unsorted Pick an element from the
	 * unsorted and put it to it's right position in Sorted array. you insert the
	 * element to the sorted array;
	 * =========================================================
	 */

	public void insertionSort(int[] n) {
		for (int i = 1; i < n.length; i++) {
			int temp = n[i];

			int j = i - 1;
			while (j > -1 && n[j] > temp) {
				n[j + 1] = n[j];
				j--;
			}
			n[j + 1] = temp;
		}
	}
	public void insertionSort(String[] n) {
		for (int i = 1; i < n.length; i++) {
			String temp = n[i];

			int j = i - 1;
			while (j > -1 && n[j].compareTo(temp)>=0) {
				n[j + 1] = n[j];
				j--;
			}
			n[j + 1] = temp;
		}
	}

	/*
	 * ========================================================= MergeSort: Merge
	 * Merge Sort is a divide-and-conquer sorting algorithm
	 * 
	 *  Divide step =>>  Divide the array into two (equal) halves  Recursively
	 * sort the two halves
	 * 
	 *  Conquer step =>>  Merge the two halves to form a sorted array
	 * =========================================================
	 */
	public void mergeSort(int a[], int low, int high) {

		if (low < high) {
			int mid = (low + high) / 2;

			mergeSort(a, low, mid);
			mergeSort(a, mid + 1, high);
			merge(a, low, mid, high);
		}
	}

	private void merge(int[] a, int low, int mid, int high) {
		// TODO Auto-generated method stub
		int n = high - low + 1;
		int[] b = new int[n];
		int left = low, right = mid + 1, bIdx = 0;
		while (left <= mid && right <= high) {
			if (a[left] <= a[right]) {
				b[bIdx++] = a[left++];

			} else {
				b[bIdx++] = a[right++];

			}

		}

		while (left <= mid) {
			b[bIdx++] = a[left++];
		}

		while (right <= high) {
			b[bIdx++] = a[right++];
		}

		for (int i = 0; i < b.length; i++) {
			a[low + i] = b[i];
		}
		b = null;
	}

	public void mergeSort(String a[], int low, int high) {

		if (low < high) {
			int mid = (low + high) / 2;

			mergeSort(a, low, mid);
			mergeSort(a, mid + 1, high);
			merge(a, low, mid, high);
		}
	}

	private void merge(String[] a, int low, int mid, int high) {
		// TODO Auto-generated method stub
		int n = high - low + 1;
		String[] b = new String[n];
		int left = low, right = mid + 1, bIdx = 0;
		while (left <= mid && right <= high) {
			if (a[left].compareTo(a[right]) <= 0) {
				b[bIdx++] = a[left++];

			} else {
				b[bIdx++] = a[right++];

			}

		}

		while (left <= mid) {
			b[bIdx++] = a[left++];
		}

		while (right <= high) {
			b[bIdx++] = a[right++];
		}

		for (int i = 0; i < b.length; i++) {
			a[low + i] = b[i];
		}
		b = null;
	}

	/*
	 * ========================================================= MergeSort: Merge
	 * Quick Sort is a divide-and-conquer algorithm  Divide step  Choose an item
	 * Choose an item p (known as (known as pivot) and partition the ) and partition
	 * the items of a[i...j] into two parts  Items that are smaller than p  Items
	 * that are greater than or equal to p  Recursively sort the two parts 
	 * Conquer step  Do nothing!  In comparison, Merge Sort spends most of the
	 * time in conquer step but very little time in divide step
	 * =========================================================
	 */

	/*
	 * public void quickSort(int a[], int low, int high) { if (low < high) { int
	 * pivotIdx = partition(a, low, high); quickSort(a, low, pivotIdx - 1);
	 * quickSort(a, pivotIdx + 1, high); } }
	 * 
	 * public int partition(int a[], int i, int j) { int p = a[i];// pivot int m =
	 * i;// s1, s2 initially empty
	 * 
	 * for (int k = i + 1; k < j; k++) { if (a[k] < p) { m++; // swap(a[k], a[m]);
	 * int temp=a[k]; a[k]=a[m]; a[m]=temp; } }
	 * 
	 * // swap(a[i], a[m]); int temp=a[i]; a[i]=a[m]; a[m]=temp; return m; }
	 */
	public int partition(int array[], int low, int high) {

		// choose the rightmost element as pivot
		int pivot = array[high];

		// pointer for greater element
		int i = (low - 1);

		// traverse through all elements
		// compare each element with pivot
		for (int j = low; j < high; j++) {
			if (array[j] <= pivot) {

				// if element smaller than pivot is found
				// swap it with the greatr element pointed by i
				i++;

				// swapping element at i with element at j
				int temp = array[i];
				array[i] = array[j];
				array[j] = temp;
			}

		}

		// swapt the pivot element with the greater element specified by i
		int temp = array[i + 1];
		array[i + 1] = array[high];
		array[high] = temp;

		// return the position from where partition is done
		return (i + 1);
	}

	public void quickSort(int array[], int low, int high) {
		if (low < high) {

			// find pivot element index such that
			// elements smaller than pivot are on the left
			// elements greater than pivot are on the right
			int pi = partition(array, low, high);

			// recursive call on the left of pivot
			quickSort(array, low, pi - 1);

			// recursive call on the right of pivot
			quickSort(array, pi + 1, high);
		}
	}

	/*
	 * ========================================================= Method Overloading
	 * =========================================================
	 */
	public void selectionSort(double n[]) {

		int t = n.length;

		for (int i = 0; i < t - 1; i++) {
			int min = i;// for comparing one will be necessary
			for (int j = i + 1; j < t; j++) {
				if (n[min] > n[j])
					min = j;
			}
			// We got the min number now swap with correct position
			double temp = n[min];
			n[min] = n[i];
			n[i] = temp;
		}
	}

	public void bubbleSort(double[] a) {
		for (int i = 0; i < a.length - 1; i++) {
			for (int j = 0; j < a.length - i - 1; j++) {
				if (a[j] > a[j + 1]) {
					// the two numbers are out of order swap
					double temp = a[j];
					a[j] = a[j + 1];
					a[j + 1] = temp;
				}
			}
		}
	}

	static void threeWaySort(int[] arr, int low, int high) {
		// Base condition
		if (low > high)
			return;
		// 2 stationary points and a moving point
		int l = low;
		int h = high;
		int i = low + 1;
		// if the moving point crosses the rightmost
		// point then cycle is complete
		while (i < h) {
			// if moving element is less than one of
			// the pointers swap it with the left pointer
			if (arr[i] < arr[low])
				swap(arr, i++, l++);
			// increase the i and left pointer by 1
			// if moving pointer is less than one
			// of the pivot element swap it with the left pointer
			else if (arr[i] > arr[low])
				swap(arr, i, h--);// decrease the right pointer

			// else just increment the i if the value
			// is equal to the left point
			else
				i++;
		}
		// recursive condition
		threeWaySort(arr, low, l - 1);
		threeWaySort(arr, h + 1, high);
	}

	void threeWaySort(String[] arr, int low, int high) {
		// Base condition
		if (low > high)
			return;
		// 2 stationary points and a moving point
		int l = low;
		int h = high;
		int i = low + 1;
		// if the moving point crosses the rightmost
		// point then cycle is complete
		while (i < h) {
			// if moving element is less than one of
			// the pointers swap it with the left pointer
			if (arr[i].compareTo(arr[low]) <= 0) {
				String temp = arr[i];
				arr[i] = arr[l];
				arr[l] = temp;
				i++;
				l++;
			}
//				swap(arr, i++, l++);
			// increase the i and left pointer by 1
			// if moving pointer is less than one
			// of the pivot element swap it with the left pointer
			else if (arr[i].compareTo(arr[low]) >= 0) {
				String temp = arr[i];
				arr[i] = arr[h];
				arr[h] = temp;
				h--;
			}
			// swap(arr, i, h--);// decrease the right pointer

			// else just increment the i if the value
			// is equal to the left point
			else
				i++;
		}
		// recursive condition
		threeWaySort(arr, low, l - 1);
		threeWaySort(arr, h + 1, high);
	}

	static void swap(int[] a, int i, int j) {
		int temp = a[i];
		a[i] = a[j];
		a[j] = temp;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Sort sort = new Sort();
		String[] a = { "Harry", "Ross", "Bruce", "Cook", "Carolyn", "Morgan", "Albert", "Walker", "Randy", "Reed",
				"Larry", "Barnes", "Lois", "Wilson", "Jesse", "Campbell", "Ernest", "Rogers", "Theresa", "Patterson",
				"Henry", "Simmons", "Michelle", "Perry", "Frank", "Butler", "Shirley" };
		sort.insertionSort(a);
		//sort.threeWaySort(a, 0, a.length - 1);
		for (int i = 0; i < a.length; i++) {
			System.out.println(a[i]);
		}
	}

}
