import 'package:real/model/product_model.dart';

class CategoryModel {
  final String image;
 final List<ProductModel> products;
 
  CategoryModel({required this.image, required this.products});
}