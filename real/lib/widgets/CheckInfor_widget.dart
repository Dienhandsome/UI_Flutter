import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real/provider/checkout_provider.dart';
import 'package:real/screen/checkout_screen.dart';
import 'package:real/widgets/HaveThongTin_widget.dart';
import 'package:real/widgets/NotThongTin_widget.dart';

class CheckInforWidget extends StatelessWidget {
  const CheckInforWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final checkoutProvider = Provider.of<CheckoutProvider>(context);

    // Nếu dữ liệu đang được tải
    if (checkoutProvider.hoTen.isEmpty &&
        checkoutProvider.soDienThoai.isEmpty &&
        checkoutProvider.diaChi.isEmpty &&
        checkoutProvider.ghiChu.isEmpty) {
      return Center(child: CircularProgressIndicator());
    }

    // Nếu có thông tin giao hàng
    if (checkoutProvider.hoTen.isNotEmpty &&
        checkoutProvider.soDienThoai.isNotEmpty &&
        checkoutProvider.diaChi.isNotEmpty) {
      return HaveThongTinWidget(
        checkoutInfo: {
          'name': checkoutProvider.hoTen,
          'phone': checkoutProvider.soDienThoai,
          'address': checkoutProvider.diaChi,
          'note': checkoutProvider.ghiChu,
        },
        onEdit: () {
          // Điều hướng đến CheckOutScreen để chỉnh sửa
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => CheckOutScreen()),
          );
        },
      );
    }

    // Nếu không có thông tin giao hàng
    return NoThongTinWidget(
      onAdd: () {
        // Điều hướng đến CheckOutScreen để thêm mới thông tin
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => CheckOutScreen()),
        );
      },
    );
  }
}
