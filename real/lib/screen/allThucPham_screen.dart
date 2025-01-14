// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:real/models/Thucpham_model.dart';
import 'package:real/services/TimThucPham_service.dart';
import 'package:real/widgets/ProductCardAll_widget.dart';

class AllThucPham extends StatefulWidget {
  final int idLoaiThucPham;

  const AllThucPham({Key? key, required this.idLoaiThucPham}) : super(key: key);

  @override
  _AllThucPhamState createState() => _AllThucPhamState();
}

class _AllThucPhamState extends State<AllThucPham> {
  final TimthucphamService _service = TimthucphamService();
  List<Thucpham> products = [];
  bool isLoading = true;
  String? tenLoaiThucPham; // Tên loại thực phẩm, lấy từ API

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    try {
      final data = await _service.getThucPhamByIDLTP(widget.idLoaiThucPham);
      setState(() {
        products = data;
        // Lấy tên loại thực phẩm từ sản phẩm đầu tiên
        if (products.isNotEmpty) {
          tenLoaiThucPham = products.first.tenLoaiThucPham;
        }
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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(54.0), // Chiều cao của AppBar
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(28.0),
            bottomRight: Radius.circular(28.0),
          ),
          child: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios,
                  color: const Color.fromARGB(255, 39, 38, 38)),
              padding: EdgeInsets.only(left: 10),
              iconSize: 20,
              onPressed: () => Navigator.pop(context),
            ),
            title: Text("Sản Phẩm Theo loại", style: TextStyle(fontSize: 27)),
            centerTitle: true,
            elevation: 0.0,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color.fromARGB(255, 46, 121, 49)!, // Màu xanh lá đậm
                    Colors.green[500]!, // Màu xanh lá trung bình
                    const Color.fromARGB(
                        255, 24, 172, 100)!, // Màu xanh lá nhạt hơn
                  ],
                  begin: Alignment.topLeft, // Điểm bắt đầu gradient
                  end: Alignment.bottomRight, // Điểm kết thúc gradient
                ),
              ),
            ),
          ),
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : products.isEmpty
              ? Center(child: Text('Không có dữ liệu'))
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 25),
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
                                  shrinkWrap:
                                      true, // Điều chỉnh chiều cao GridView
                                  physics: NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3, // Hiển thị 3 cột
                                    crossAxisSpacing: 1,
                                    mainAxisSpacing: 1,
                                    childAspectRatio: 0.65,
                                  ),
                                  itemCount: products.length,
                                  itemBuilder: (context, index) {
                                    return ProductCardAllWidget(
                                        thucpham: products[index]);
                                  },
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
                                padding: EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 10),
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 195, 235, 188),
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
                                  tenLoaiThucPham ?? '', // Hiển thị tên loại
                                  style: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 5, 127, 52),
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
                      SizedBox(height: 30),
                    ],
                  ),
                ),
    );
  }
}
