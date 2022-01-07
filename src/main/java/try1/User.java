package try1;

public class User {
	// Can Be a customer or a Vendor
	String name;
	String email ;
	String mobNumber;
	String address;
	String password;
	String userType;
	String userID;
	
	public User(String name, String email, String mobNumber, String address, String password, String userType,
			String userID) {
		
		this.name = name;
		this.email = email;
		this.mobNumber = mobNumber;
		this.address = address;
		this.password = password;
		this.userType = userType;
		this.userID = userType+userID;
	}

	public User() {
		// TODO Auto-generated constructor stub
		this.userID = "";
	}

	public User(String name, String email, String mobNumber, String address, String password, String userType) {
		super();
		this.name = name;
		this.email = email;
		this.mobNumber = mobNumber;
		this.address = address;
		this.password = password;
		this.userType = userType;
		this.userID="";
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobNumber() {
		return mobNumber;
	}

	public void setMobNumber(String mobNumber) {
		this.mobNumber = mobNumber;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}
	
	public void printUserDetails() {
		System.out.println("Name: "+getName());
		System.out.println("Email: "+getEmail());
		System.out.println("mobNumber: "+getMobNumber());
		System.out.println("address: "+getAddress());
		System.out.println("Password: "+getPassword());
		System.out.println("userType: "+getUserType());
		System.out.println("UserID: "+getUserID());
		
	}
	
	

}
