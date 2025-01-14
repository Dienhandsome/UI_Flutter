class UpdateUserInfo {
  final String fullName;
  final String phoneNumber;
  UpdateUserInfo({required this.fullName, required this.phoneNumber});
  factory UpdateUserInfo.fromJson(Map<String, dynamic> json) {
    return UpdateUserInfo(
      fullName: json['fullName'],
      phoneNumber: json['phoneNumber'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'phoneNumber': phoneNumber,
    };
  }

  UpdateUserInfo copyWith({
    String? fullName,
    String? phoneNumber,
  }) {
    return UpdateUserInfo(
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }
}
