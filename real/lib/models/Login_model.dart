class Login {
  Login({
    required this.email,
    required this.password,
  });

  final String? email;
  final String? password;

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      email: json["email"],
      password: json["password"],
    );
  }

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
