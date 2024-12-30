class Cart {
  Cart({
    required this.iDHoaDon,
    required this.iDThucPham,
    required this.tenThucPham,
    required this.soLuong,
    required this.donGia,
    required this.thanhTien,
  });

  final int? iDHoaDon;
  final int? iDThucPham;
  final String? tenThucPham;
  final int? soLuong;
  final int? donGia;
  final int? thanhTien;

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      iDHoaDon: json["iD_HoaDon"],
      iDThucPham: json["iD_ThucPham"],
      tenThucPham: json["tenThucPham"],
      soLuong: json["soLuong"],
      donGia: json["donGia"],
      thanhTien: json["thanhTien"],
    );
  }

  Map<String, dynamic> toJson() => {
        "iD_HoaDon": iDHoaDon,
        "iD_ThucPham": iDThucPham,
        "tenThucPham": tenThucPham,
        "soLuong": soLuong,
        "donGia": donGia,
        "thanhTien": thanhTien,
      };
}
