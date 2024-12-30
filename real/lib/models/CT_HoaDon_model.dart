class CtHoaDon {
  CtHoaDon({
    required this.iDThucPham,
    required this.tenThucPham,
    required this.soLuong,
    required this.donGia,
    required this.thanhTien,
  });

  final int? iDThucPham;
  final String? tenThucPham;
  final double? soLuong;
  final double? donGia;
  final double? thanhTien;

  factory CtHoaDon.fromJson(Map<String, dynamic> json) {
    return CtHoaDon(
      iDThucPham: json["iD_ThucPham"],
      tenThucPham: json["tenThucPham"],
      soLuong: json["soLuong"],
      donGia: json["donGia"],
      thanhTien: json["thanhTien"],
    );
  }

  Map<String, dynamic> toJson() => {
        "iD_ThucPham": iDThucPham,
        "tenThucPham": tenThucPham,
        "soLuong": soLuong,
        "donGia": donGia,
        "thanhTien": thanhTien,
      };
}
