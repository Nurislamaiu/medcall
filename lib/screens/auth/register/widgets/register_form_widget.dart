import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medcall/widgets/custom_text_filed.dart';

import '../../../../util/color.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    super.key,
  });

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController nameController;
  late final TextEditingController ageController;
  late final TextEditingController phoneController;

  String _gender = 'Не выбран';

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
    ageController = TextEditingController();
    phoneController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    ageController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Введите адрес электронной почты';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Некорректный формат почты';
    }
    return null;
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Введите пароль';
    }
    if (value.length < 6) {
      return 'Пароль должен быть не менее 6 символов';
    }
    return null;
  }

  String? _nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Введите имя';
    }
    return null;
  }

  String? _ageValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Введите возраст';
    }
    final age = int.tryParse(value);
    if (age == null || age <= 0) {
      return 'Возраст должен быть положительным числом';
    }
    return null;
  }

  String? _phoneValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Введите номер телефона';
    }

    // Удаляем все нечисловые символы
    final sanitizedValue = value.replaceAll(RegExp(r'[^0-9]'), '');

    // Проверяем только цифры
    if (sanitizedValue.length < 10 || sanitizedValue.length > 12) {
      return 'Некорректный номер телефона';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: emailController,
          label: 'Email',
          icon: Iconsax.sms,
          validator: _emailValidator,
        ),
        SizedBox(height: 20),
        CustomTextField(
          controller: passwordController,
          obscureText: true,
          label: 'Пароль',
          icon: Iconsax.lock,
          validator: _passwordValidator,
        ),
        SizedBox(height: 20),
        CustomTextField(
          controller: nameController,
          label: 'Имя',
          icon: Iconsax.user,
          validator: _nameValidator,
        ),
        SizedBox(height: 20),
        CustomTextField(
          controller: ageController,
          label: 'Возраст',
          icon: Iconsax.calendar,
          type: TextInputType.number,
          validator: _ageValidator,
        ),
        SizedBox(height: 20),
        CustomTextField(
          controller: phoneController,
          label: 'Телефон',
          icon: Iconsax.mobile,
          type: TextInputType.phone,
          inputFormatters: [
            MaskedInputFormatter('+# (###) ###-##-##'),
          ],
          validator: _phoneValidator,
        ),
        SizedBox(height: 20),
        _buildGenderSelection(),
      ],
    );
  }

  Widget _buildGenderSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Icon(Iconsax.aquarius,
                  color: ScreenColor.color1.withOpacity(0.5)),
              SizedBox(width: 10),
              Text('Пол',
                  style: TextStyle(color: ScreenColor.color2, fontSize: 16)),
              SizedBox(width: 10),
              DropdownButton<String>(
                value: _gender,
                borderRadius: BorderRadius.circular(10),
                dropdownColor: Colors.white,
                onChanged: (String? newValue) {
                  setState(() {
                    _gender = newValue!;
                  });
                },
                items: <String>['Не выбран', 'Мужчина', 'Женщина']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,
                        style:
                            TextStyle(color: ScreenColor.color2, fontSize: 14)),
                  );
                }).toList(),
                underline: SizedBox(),
                icon: Icon(Icons.arrow_drop_down, color: ScreenColor.color2),
              ),
            ],
          ),
        ),
        if (_gender == 'Не выбран')
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 8.0),
            child: Text(
              'Выберите пол',
              style: TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
      ],
    );
  }
}
