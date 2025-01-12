import 'package:flutter/material.dart';
import 'package:real/screen/DangNhap.dart';
import 'package:real/services/signup_service.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final SignUpService _signupService = SignUpService();
  void _signup() async {
    if (_formKey.currentState!.validate()) {
      try {
        final response = await _signupService.signup(
          _fullNameController.text,
          _userNameController.text,
          _emailController.text,
          _passwordController.text,
          _confirmPasswordController.text,
          _phoneController.text,
          _addressController.text,
        );
        print("Dang kys thong tin: $response");
        if (response != null) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Đăng ký thành công')));
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => SignIn()),
          );
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Đăng ký thất bại')));
        }
      } catch (e) {
        print('Signup failed: $e');
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Lỗi đăng ký: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Đăng Ký')),
        backgroundColor: Color(0xFF81C408),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white, // Background màu trắng
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                //Full Name
                TextFormField(
                  controller: _fullNameController,
                  decoration: InputDecoration(
                    labelText: 'FullName',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFF81C408)), // Viền màu xanh
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập họ và tên';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                //UserName
                TextFormField(
                  controller: _userNameController,
                  decoration: InputDecoration(
                    labelText: 'UserName',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFF81C408)), // Viền màu xanh
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập UserName';
                    }
                    if (value.length < 3) {
                      return 'Username phải có ít nhất 3 ký tự';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                //Email
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email/SĐT',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFF81C408)), // Viền màu xanh
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập email hoặc điện thoại';
                    }
                    if (!value.endsWith('@gmail.com')) {
                      return 'Email phải kết thúc bằng @gmail.com';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                //Password
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Mật khẩu',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFF81C408)), // Viền màu xanh
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập mật khẩu';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                //Nhập lại mật khẩu
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Nhập lại mật khẩu',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFF81C408)), // Viền màu xanh
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập lại mật khẩu';
                    }
                    if (value != _passwordController.text) {
                      return 'Mật khẩu không khớp';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                //Phone
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    labelText: 'Phone',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFF81C408)), // Viền màu xanh
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập Phone';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),

                //Dia Chi
                TextFormField(
                  controller: _addressController,
                  decoration: InputDecoration(
                    labelText: 'Địa Chỉ',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFF81C408)), // Viền màu xanh
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập Địa Chỉ';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: _signup,
                  child: Text('Đăng ký'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF81C408),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
