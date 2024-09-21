// Abstract class demonstrating abstraction
abstract class User {
  // Private variables demonstrating encapsulation
  String _username;
  String _password;

  // Constructor for the abstract class
  User(this._username, this._password);

  // Getters and Setters for encapsulated data
  String get username => _username;

  void set password(String newPassword) {
    if (newPassword.length >= 6) {
      _password = newPassword;
    } else {
      print("Password must be at least 6 characters long.");
    }
  }

  // Abstract method that must be implemented by subclasses
  void userDetails();
}

// Superclass
class Admin extends User {
  String _adminCode;

  // Constructor
  Admin(String username, String password, this._adminCode)
      : super(username, password);

  // Implementing abstract method from User class
  @override
  void userDetails() {
    print("Admin Username: $username");
    print("Admin Code: $_adminCode");
  }
}

// Subclass demonstrating inheritance and method overriding
class Customer extends User {
  String _customerID;

  // Constructor
  Customer(String username, String password, this._customerID)
      : super(username, password);

  // Overriding the userDetails method (polymorphism)
  @override
  void userDetails() {
    print("Customer Username: $username");
    print("Customer ID: $_customerID");
  }
}

// Another subclass demonstrating polymorphism
class Vendor extends User {
  String _vendorID;

  // Constructor
  Vendor(String username, String password, this._vendorID)
      : super(username, password);

  // Overriding the userDetails method (polymorphism)
  @override
  void userDetails() {
    print("Vendor Username: $username");
    print("Vendor ID: $_vendorID");
  }
}

void main() {
  // Creating objects of Admin, Customer, and Vendor classes
  Admin admin = Admin("adminUser", "adminPass123", "ADM001");
  Customer customer = Customer("customerUser", "custPass123", "CUST001");
  Vendor vendor = Vendor("vendorUser", "vendPass123", "VEND001");

  // Accessing the userDetails method (demonstrating polymorphism)
  admin.userDetails();
  customer.userDetails();
  vendor.userDetails();

  // Testing encapsulation by changing password via setter
  customer.password = "short"; // Will print error message
  customer.password = "newCustomerPass"; // Sets successfully
}
