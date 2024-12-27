class CheDoAn {
  CheDoAn({
    required this.iDCda,
    required this.tenCheDoAn,
  });

  final int? iDCda;
  final String? tenCheDoAn;

  factory CheDoAn.fromJson(Map<String, dynamic> json) {
    return CheDoAn(
      iDCda: json["iD_CDA"],
      tenCheDoAn: json["tenCheDoAn"],
    );
  }

  Map<String, dynamic> toJson() => {
        "iD_CDA": iDCda,
        "tenCheDoAn": tenCheDoAn,
      };
}
