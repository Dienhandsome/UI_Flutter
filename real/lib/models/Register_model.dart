class Register {
  Register({
    required this.userName,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.fullName,
    required this.phoneNumber,
    required this.address,
  });

  final String? userName;
  final String? email;
  final String? password;
  final String? confirmPassword;
  final String? fullName;
  final String? phoneNumber;
  final String? address;

  factory Register.fromJson(Map<String, dynamic> json) {
    return Register(
      userName: json["userName"],
      email: json["email"],
      password: json["password"],
      confirmPassword: json["confirmPassword"],
      fullName: json["fullName"],
      phoneNumber: json["phoneNumber"],
      address: json["address"],
    );
  }

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "email": email,
        "password": password,
        "confirmPassword": confirmPassword,
        "fullName": fullName,
        "phoneNumber": phoneNumber,
        "address": address,
      };
}
