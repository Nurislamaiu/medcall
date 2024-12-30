import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medcall/screens/auth/login/widgets/login_bottom.dart';
import 'package:medcall/screens/auth/login/widgets/login_form.dart';
import 'package:medcall/screens/auth/login/widgets/login_head.dart';

import '../../../util/color.dart';
import '../../../widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;

  void _login() async {
    setState(() {
      _isLoading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: ScreenColor.white,
        body: Stack(children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Head
                  LoginHead(),
                  SizedBox(height: 30),

                  /// Body
                  LoginForm(),
                  SizedBox(height: 30),

                  CustomButton(
                    text: 'Войти',
                    onPressed: _login,
                    colorBackground: ScreenColor.color6,
                  ),
                  SizedBox(height: 20),

                  /// Buttons
                  LoginBottom(),
                ],
              ),
            ),
          ),
          if (_isLoading)
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.4),
                child: Center(
                    child: CircularProgressIndicator(
                  color: ScreenColor.color6,
                )),
              ),
            ),
        ]),
      ),
    );
  }
}

