// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:real/provider/cart_provider.dart';
import 'package:real/screen/home_screen.dart';
import 'package:real/screen/allThucPham_screen.dart';
import 'package:real/services/GroupThucPham_service.dart';
import 'package:real/widgets/ProductCard_widget.dart';
import '../models/GroupThucPham_model.dart';

class ThucPhamWidget extends StatefulWidget {
  const ThucPhamWidget({Key? key}) : super(key: key);
  @override
  _ThucPhamWidgetState createState() => _ThucPhamWidgetState();
}

class _ThucPhamWidgetState extends State<ThucPhamWidget> {
  final GroupthucphamService _groupService = GroupthucphamService();
  List<GroupThucPham> products = [];
  final Aprovider cartProvider = Aprovider();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    try {
      final data = await _groupService.fetchGroupThucPham();
      print("data: $data");
      setState(() {
        products = data;
        isLoading = false;
      });
    } catch (e) {
      print('Error loading products: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: products.map((group) {
          return Column(
            children: [
              Stack(
                children: [
                  // Container chính chứa danh sách sản phẩm
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.only(top: 35),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 195, 235, 188),
                      borderRadius: BorderRadius.circular(12),
                      border: Border(
                        top: BorderSide(
                          color: const Color.fromARGB(
                              255, 35, 209, 85), // Viền trên màu xanh
                          width: 2, // Độ dày của viền trên
                        ),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GridView.builder(
                          padding: EdgeInsets.all(2),
                          shrinkWrap: true, // Điều chỉnh chiều cao GridView
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, // Hiển thị 3 cột
                            crossAxisSpacing: 1,
                            mainAxisSpacing: 1,
                            childAspectRatio: 0.65,
                          ),
                          itemCount: group.products.length,
                          itemBuilder: (context, index) {
                            return ProductCardWidget(
                                cartProvider: cartProvider,
                                product: group.products[index]);
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 10),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AllThucPham(
                                      idLoaiThucPham:
                                          group.iDLoaiThucPham ?? 1),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 136, 210, 125),
                              foregroundColor:
                                  const Color.fromARGB(255, 0, 0, 0),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 100, vertical: 7),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Text(
                              "Xem thêm",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Tiêu đề nằm giữa (50% trong/ngoài)
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 195, 235, 188),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              color: Color.fromARGB(255, 35, 209, 85),
                              width: 2),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 4,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Text(
                          group.tenLoaiThucPham.toString(),
                          style: TextStyle(
                            color: const Color.fromARGB(255, 5, 127, 52),
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Thêm khoảng cách giữa các bảng
              SizedBox(height: 30),
            ],
          );
        }).toList(),
      ),
    );
  }
}
