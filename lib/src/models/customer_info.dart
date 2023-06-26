class CustomerInfo {
  final String lastName;
  final String firstName;
  final String bvn;
  final String email;
  final String phone;
  final String? address;

  CustomerInfo({
    this.address,
    required this.lastName,
    required this.firstName,
    required this.bvn,
    required this.email,
    required this.phone,
  });

  Map<String, dynamic> toJson() => {
        "fname": firstName,
        "lname": lastName,
        "bvn": bvn,
        "email": email,
        "phone": phone,
      };
}
