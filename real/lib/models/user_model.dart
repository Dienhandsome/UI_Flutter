class User {
  final String id;
  final String email;
  final String fullName;
  final String phoneNumber;
  final String address;

  User({
    required this.id,
    required this.email,
    required this.fullName,
    required this.phoneNumber,
    required this.address,
  });
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      email: json['email'] as String,
      fullName: json['fullName'] as String,
      phoneNumber: json['phoneNumber'] as String,
      address: json['address'] as String,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'address': address,
    };
  }
}
