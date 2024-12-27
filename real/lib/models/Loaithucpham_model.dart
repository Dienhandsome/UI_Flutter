class Loaithucpham {
  Loaithucpham({
    required this.iDLoaiThucPham,
    required this.tenLoaiThucPham,
  });

  final int? iDLoaiThucPham;
  final String? tenLoaiThucPham;

  factory Loaithucpham.fromJson(Map<String, dynamic> json) {
    return Loaithucpham(
      iDLoaiThucPham: json["iD_LoaiThucPham"],
      tenLoaiThucPham: json["tenLoaiThucPham"],
    );
  }

  Map<String, dynamic> toJson() => {
        "iD_LoaiThucPham": iDLoaiThucPham,
        "tenLoaiThucPham": tenLoaiThucPham,
      };
}
