import 'package:real/models/product_model.dart';

class CategoryModel {
  final String image;
  final List<ProductModel> products;

  CategoryModel({required this.image, required this.products});
}
