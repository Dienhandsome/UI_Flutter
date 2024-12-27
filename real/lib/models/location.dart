// models/location_models.dart

class Province {
  final int code;
  final String name;
  final String codename;
  final String division_type;

  Province({
    required this.code,
    required this.name,
    required this.codename,
    required this.division_type,
  });

  factory Province.fromJson(Map<String, dynamic> json) {
    return Province(
      code: json['code'],
      name: json['name'],
      codename: json['codename'],
      division_type: json['division_type'],
    );
  }
}

class District {
  final int code;
  final String name;
  final String codename;
  final String division_type;
  final int province_code;

  District({
    required this.code,
    required this.name,
    required this.codename,
    required this.division_type,
    required this.province_code,
  });

  factory District.fromJson(Map<String, dynamic> json) {
    return District(
      code: json['code'],
      name: json['name'],
      codename: json['codename'],
      division_type: json['division_type'],
      province_code: json['province_code'],
    );
  }
}

class Ward {
  final int code;
  final String name;
  final String codename;
  final String division_type;
  final int district_code;

  Ward({
    required this.code,
    required this.name,
    required this.codename,
    required this.division_type,
    required this.district_code,
  });

  factory Ward.fromJson(Map<String, dynamic> json) {
    return Ward(
      code: json['code'],
      name: json['name'],
      codename: json['codename'],
      division_type: json['division_type'],
      district_code: json['district_code'],
    );
  }
}
