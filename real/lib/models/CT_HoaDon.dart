class CT_HoaDon {
  CT_HoaDon({
    required this.iDThucPham,
    required this.tenThucPham,
    required this.soLuong,
    required this.donGia,
  });

  final int? iDThucPham;
  final String? tenThucPham;
  final int? soLuong;
  final int? donGia;

  factory CT_HoaDon.fromJson(Map<String, dynamic> json) {
    return CT_HoaDon(
      iDThucPham: json["iD_ThucPham"],
      tenThucPham: json["tenThucPham"],
      soLuong: json["soLuong"],
      donGia: json["donGia"],
    );
  }

  Map<String, dynamic> toJson() => {
        "iD_ThucPham": iDThucPham,
        "tenThucPham": tenThucPham,
        "soLuong": soLuong,
        "donGia": donGia,
      };
}
