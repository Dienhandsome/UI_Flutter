class Thucpham {
  Thucpham({
    required this.iDThucPham,
    required this.tenThucPham,
    required this.dvt,
    required this.soLuong,
    required this.giaBan,
    required this.image,
    required this.iDLoaiThucPham,
    required this.tenLoaiThucPham,
  });

  final int? iDThucPham;
  final String? tenThucPham;
  final String? dvt;
  final double? soLuong;
  final int? giaBan;
  final String? image;
  final int? iDLoaiThucPham;
  final String? tenLoaiThucPham;

  factory Thucpham.fromJson(Map<String, dynamic> json) {
    return Thucpham(
      iDThucPham: json["iD_ThucPham"],
      tenThucPham: json["tenThucPham"],
      dvt: json["dvt"],
      soLuong: (json["soLuong"] is int)
          ? (json["soLuong"] as int).toDouble() // Chuyển đổi int sang double
          : json["soLuong"] as double?, // Giữ nguyên nếu đã là double
      giaBan: json["giaBan"],
      image: json["image"],
      iDLoaiThucPham: json["iD_LoaiThucPham"],
      tenLoaiThucPham: json["tenLoaiThucPham"],
    );
  }

  Map<String, dynamic> toJson() => {
        "iD_ThucPham": iDThucPham,
        "tenThucPham": tenThucPham,
        "dvt": dvt,
        "soLuong": soLuong,
        "giaBan": giaBan,
        "image": image,
        "iD_LoaiThucPham": iDLoaiThucPham,
        "tenLoaiThucPham": tenLoaiThucPham,
      };
}
