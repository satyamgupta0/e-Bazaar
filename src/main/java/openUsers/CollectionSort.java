package openUsers;

import java.io.IOException;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.LinkedList;
import sort.ProductSort;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import reg.Product;



@SuppressWarnings("serial")
@WebServlet("/serial")
public class CollectionSort extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();// Creates a session
		@SuppressWarnings("unchecked")

		LinkedList<Product> list = (LinkedList<Product>) session.getAttribute("products");// Receives the product list
		String field = (String) session.getAttribute("field");// takes the field name
		Product[] products = new Product[list.size()];// Creates a Product array for further functions
		ProductSort pr = new ProductSort();// creates an object of ProductSort class
		switch (field) {
		case "name": {

			for (int i = 0; i < list.size(); i++) {
				products[i] = new Product(list.get(i)) {
					@Override
					public int compareTo(Product o) {
						// TODO Auto-generated method stub
						return this.name.compareTo(o.name);
					}
				};
				list.clear();
				pr.mergeSort(products, 0, products.length - 1);
				for (int j = 0; j < products.length; j++) {
					list.add(products[i]);
				}
				session.setAttribute("products", list);
				break;

			}
		}
		case "subCategory": {

			for (int i = 0; i < list.size(); i++) {
				products[i] = new Product(list.get(i)) {
					@Override
					public int compareTo(Product o) {
						// TODO Auto-generated method stub
						return this.subCategory.compareTo(o.subCategory);
					}
				};
				list.clear();
				pr.mergeSort(products, 0, products.length - 1);
				for (int j = 0; j < products.length; j++) {
					list.add(products[i]);
				}
				session.setAttribute("products", list);
				break;

			}
		}
		case "productID": {

			for (int i = 0; i < list.size(); i++) {
				products[i] = new Product(list.get(i)) {
					@Override
					public int compareTo(Product o) {
						// TODO Auto-generated method stub
						return this.productID.compareTo(o.productID);
					}
				};
				list.clear();
				pr.mergeSort(products, 0, products.length - 1);
				for (int j = 0; j < products.length; j++) {
					list.add(products[i]);
				}
				session.setAttribute("products", list);
				break;

			}
		}

		case "sellerID": {

			for (int i = 0; i < list.size(); i++) {
				products[i] = new Product(list.get(i)) {
					@Override
					public int compareTo(Product o) {
						// TODO Auto-generated method stub
						return this.sellerID.compareTo(o.sellerID);
					}
				};
				list.clear();
				pr.mergeSort(products, 0, products.length - 1);
				for (int j = 0; j < products.length; j++) {
					list.add(products[i]);
				}
				session.setAttribute("products", list);
				break;

			}
		}
		case "price": {

			for (int i = 0; i < list.size(); i++) {
				products[i] = new Product(list.get(i)) {
					@Override
					public int compareTo(Product o) {
						// TODO Auto-generated method stub
						double i = this.getProductPrice() - o.getProductPrice();
						if (i > 0) {
							return 1;
						} else if (i < 0) {
							return -1;
						} else if (i == 0) {
							return 0;
						}
						return 0;
					}
				};
				list.clear();
				pr.mergeSort(products, 0, products.length - 1);
				for (int j = 0; j < products.length; j++) {
					list.add(products[i]);
				}
				session.setAttribute("products", list);
				break;

			}
		}
		case "unit": {

			for (int i = 0; i < list.size(); i++) {
				products[i] = new Product(list.get(i)) {
					@Override
					public int compareTo(Product o) {
						// TODO Auto-generated method stub
						return this.productUnit - o.productUnit;
					}
				};
				list.clear();
				pr.mergeSort(products, 0, products.length - 1);
				for (int j = 0; j < products.length; j++) {
					list.add(products[i]);
				}
				session.setAttribute("products", list);
				break;

			}
		}
		default:
			throw new IllegalArgumentException("Unexpected value: " + field);
		}

		//resp.sendRedirect("");

		/// Switch case Complete
	}
}
