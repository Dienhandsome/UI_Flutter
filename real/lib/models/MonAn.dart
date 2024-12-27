class MonAn {
  MonAn({
    required this.iDTenMonAn,
    required this.tenMonAn,
    required this.iDLoaiMonAn,
    required this.tenLoaiMonAn,
  });

  final int? iDTenMonAn;
  final String? tenMonAn;
  final int? iDLoaiMonAn;
  final String? tenLoaiMonAn;

  factory MonAn.fromJson(Map<String, dynamic> json) {
    return MonAn(
      iDTenMonAn: json["iD_TenMonAn"],
      tenMonAn: json["tenMonAn"],
      iDLoaiMonAn: json["iD_LoaiMonAn"],
      tenLoaiMonAn: json["tenLoaiMonAn"],
    );
  }

  Map<String, dynamic> toJson() => {
        "iD_TenMonAn": iDTenMonAn,
        "tenMonAn": tenMonAn,
        "iD_LoaiMonAn": iDLoaiMonAn,
        "tenLoaiMonAn": tenLoaiMonAn,
      };
}
