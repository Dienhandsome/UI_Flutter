class CartItem {
  final int productId;
  final String name;
  final double price;
  final String urlImage;
  int quantity;

  CartItem({
    required this.productId,
    required this.name,
    required this.price,
    required this.urlImage,
    this.quantity = 1,
  });

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'name': name,
      'price': price,
      'urlImage': urlImage,
      'quantity': quantity,
    };
  }

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      productId: json['productId'],
      name: json['name'],
      price: json['price'],
      quantity: json['quantity'],
      urlImage: json['urlImage'],
    );
  }
}
