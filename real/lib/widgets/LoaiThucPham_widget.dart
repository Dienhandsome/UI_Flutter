import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real/models/Loaithucpham_model.dart';
import 'package:real/screen/allThucPham_screen.dart';
import 'package:real/services/LoaiThucPham_services.dart';

class LoaiThucPhamWidget extends StatefulWidget {
  const LoaiThucPhamWidget({Key? key}) : super(key: key);

  @override
  _LoaiThucPhamWidgetState createState() => _LoaiThucPhamWidgetState();
}

class _LoaiThucPhamWidgetState extends State<LoaiThucPhamWidget> {
  final LoaiThucPhamService _service = LoaiThucPhamService();
  late Future<List<Loaithucpham>> _loaiThucPhamFuture;

  final List<String> categoryImages = [
    'assets/images/category1.jpg',
    'assets/images/category2.jpg',
    'assets/images/category3.jpg',
    'assets/images/category4.jpg',
    'assets/images/category5.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _loaiThucPhamFuture = _service.fetchLoaiThucPham();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Loaithucpham>>(
      future: _loaiThucPhamFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No categories available'));
        }

        return SingleChildScrollView(
          padding: EdgeInsets.only(left: 12.0),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              snapshot.data!.length,
              (index) => Padding(
                padding: const EdgeInsets.all(6.0),
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AllThucPham(
                          idLoaiThucPham:
                              snapshot.data![index].iDLoaiThucPham ?? 0,
                        ),
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Card(
                      color: Colors.white,
                      elevation: 6.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Container(
                        height: 100,
                        width: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image: AssetImage(categoryImages[
                                      index % categoryImages.length]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              snapshot.data![index].tenLoaiThucPham ?? '',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
