import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../util/color.dart';
import '../../../../widgets/custom_text_filed.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key}); // Добавлен key для соответствия best practices

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          controller: emailController,
          label: 'Почта',
          icon: Iconsax.sms,
        ),
        SizedBox(height: 20),
        CustomTextField(
          controller: passwordController,
          label: 'Пароль',
          icon: Iconsax.lock,
          obscureText: true,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Забыл пароль?',
                  style: TextStyle(
                    color: ScreenColor.color2.withOpacity(0.5),
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}