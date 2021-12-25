package sort;

import reg.Product;

public class ProductSort {

	public void mergeSort(Product a[], int low, int high) {

		if (low < high) {
			int mid = (low + high) / 2;

			mergeSort(a, low, mid);
			mergeSort(a, mid + 1, high);
			merge(a, low, mid, high);
		}
	}

	private void merge(Product[] a, int low, int mid, int high) {
		// TODO Auto-generated method stub
		int n = high - low + 1;
		Product[] b = new Product[n];
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

}