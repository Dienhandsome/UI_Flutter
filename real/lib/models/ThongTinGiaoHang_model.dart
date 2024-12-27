class ThongTinGiaoHang {
  ThongTinGiaoHang({
    required this.hoTen,
    required this.soDienThoai,
    required this.noiNhan,
    required this.ghiChu,
    required this.iDTinhTrang,
    required this.iDHinhThuc,
  });

  final String? hoTen;
  final String? soDienThoai;
  final String? noiNhan;
  final String? ghiChu;
  final int? iDTinhTrang;
  final int? iDHinhThuc;

  factory ThongTinGiaoHang.fromJson(Map<String, dynamic> json) {
    return ThongTinGiaoHang(
      hoTen: json["hoTen"],
      soDienThoai: json["soDienThoai"],
      noiNhan: json["noiNhan"],
      ghiChu: json["ghiChu"],
      iDTinhTrang: json["iD_TinhTrang"],
      iDHinhThuc: json["iD_HinhThuc"],
    );
  }

  Map<String, dynamic> toJson() => {
        "hoTen": hoTen,
        "soDienThoai": soDienThoai,
        "noiNhan": noiNhan,
        "ghiChu": ghiChu,
        "iD_TinhTrang": iDTinhTrang,
        "iD_HinhThuc": iDHinhThuc,
      };
}
