class CustomerModel {
  final String name;
  final String status;

  CustomerModel({required this.name, required this.status});
}

List<CustomerModel> customerList = [
  CustomerModel(name: 'John Muthama', status: 'Paid'),
  CustomerModel(name: 'Aisha Uthman', status: 'Pending'),
  CustomerModel(name: 'Kofi Siriboe', status: 'Pending'),
  CustomerModel(name: 'Stephen Mwangi', status: 'Paid'),
  CustomerModel(name: 'Ken Kuria', status: 'Pending'),
  CustomerModel(name: 'Jeremiah Omondi', status: 'Paid'),
  CustomerModel(name: 'Rai Patel', status: 'Paid'),
];
