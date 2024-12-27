import 'package:real/models/MonAn.dart';

class ThucDon {
  ThucDon({
    required this.ngay,
    required this.buas,
  });

  final int? ngay;
  final List<Bua> buas;

  factory ThucDon.fromJson(Map<String, dynamic> json) {
    return ThucDon(
      ngay: json["ngay"],
      buas: json["buas"] == null
          ? []
          : List<Bua>.from(json["buas"]!.map((x) => Bua.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "ngay": ngay,
        "buas": buas.map((x) => x?.toJson()).toList(),
      };
}

class Bua {
  Bua({
    required this.buoi,
    required this.monAn,
  });

  final String? buoi;
  final Map<String, MonAn> monAn;

  factory Bua.fromJson(Map<String, dynamic> json) {
    return Bua(
      buoi: json["buoi"],
      monAn: Map.from(json["monAn"])
          .map((k, v) => MapEntry<String, MonAn>(k, MonAn.fromJson(v))),
    );
  }

  Map<String, dynamic> toJson() => {
        "buoi": buoi,
        "monAn": Map.from(monAn)
            .map((k, v) => MapEntry<String, dynamic>(k, v?.toJson())),
      };
}
