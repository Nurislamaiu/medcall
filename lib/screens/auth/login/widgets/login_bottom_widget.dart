import 'package:flutter/material.dart';

import '../../../../util/color.dart';
import '../../../../widgets/custom_button.dart';

class LoginBottom extends StatefulWidget {
  const LoginBottom({
    super.key,
  });

  @override
  State<LoginBottom> createState() => _LoginBottomState();
}

class _LoginBottomState extends State<LoginBottom> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/register');
            },
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.grey.withOpacity(0.1);
                }
                return null;
              }),
            ),
            child: Text(
              'Нет аккаунта? Зарегистрироваться',
              style: TextStyle(color: ScreenColor.color2),
            ),
          ),
        ),
        SizedBox(height: 20),
        CustomButton(
          text: 'Google',
          colorBackground: Colors.white,
          colorBorder: ScreenColor.color2.withOpacity(0.5),
          colorText: ScreenColor.color2,
          icon: "assets/svg/google.svg",
          onPressed: () {},
        ),
        SizedBox(height: 10),
        CustomButton(
          text: 'Apple ID',
          colorBackground: Colors.white,
          colorBorder: ScreenColor.color2.withOpacity(0.5),
          colorText: ScreenColor.color2,
          icon: "assets/svg/apple.svg",
          onPressed: () {},
        ),
      ],
    );
  }
}
