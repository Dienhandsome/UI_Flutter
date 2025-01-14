class GroupThucPham {
  GroupThucPham({
    required this.iDLoaiThucPham,
    required this.tenLoaiThucPham,
    required this.products,
  });

  final int? iDLoaiThucPham;
  final String? tenLoaiThucPham;
  final List<Product> products;

  factory GroupThucPham.fromJson(Map<String, dynamic> json) {
    return GroupThucPham(
      iDLoaiThucPham: json["iD_LoaiThucPham"],
      tenLoaiThucPham: json["tenLoaiThucPham"],
      products: json["products"] == null
          ? []
          : List<Product>.from(
              json["products"]!.map((x) => Product.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "iD_LoaiThucPham": iDLoaiThucPham,
        "tenLoaiThucPham": tenLoaiThucPham,
        "products": products.map((x) => x?.toJson()).toList(),
      };
}

class Product {
  Product({
    required this.iDThucPham,
    required this.tenThucPham,
    required this.giaBan,
    required this.soLuong,
    required this.image,
  });

  final int? iDThucPham;
  final String? tenThucPham;
  final int? giaBan;
  final double? soLuong;
  final String? image;

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      iDThucPham: json["iD_ThucPham"],
      tenThucPham: json["tenThucPham"],
      giaBan: json["giaBan"],
      soLuong: (json['soLuong'] as num?)?.toDouble(),
      image: json["image"],
    );
  }

  Map<String, dynamic> toJson() => {
        "iD_ThucPham": iDThucPham,
        "tenThucPham": tenThucPham,
        "giaBan": giaBan,
        "soLuong": soLuong,
        "image": image,
      };
}
