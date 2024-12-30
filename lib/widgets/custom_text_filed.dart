import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';

import '../util/color.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final bool obscureText;
  final TextInputType type;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.label,
    required this.icon,
    this.obscureText = false,
    this.validator,
    this.type = TextInputType.text,
    this.inputFormatters,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscured = false;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      keyboardType: widget.type,
      controller: widget.controller,
      obscureText: _isObscured,
      validator: widget.validator,
      inputFormatters: widget.inputFormatters,
      decoration: InputDecoration(
        labelText: widget.label,
        prefixIcon: Icon(widget.icon, color: ScreenColor.color1.withOpacity(0.5)),
        suffixIcon: widget.obscureText
            ? IconButton(
          icon: Icon(
            _isObscured ? Iconsax.eye : Iconsax.eye_slash,
            color: ScreenColor.color1.withOpacity(0.5)
          ),
          onPressed: () {
            setState(() {
              _isObscured = !_isObscured;
            });
          },
        )
            : null,
        filled: true,
        fillColor: Colors.grey.withOpacity(0.1),
        labelStyle: TextStyle(color: Colors.black),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.transparent, width: 1, style: BorderStyle.solid),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: ScreenColor.color1.withOpacity(0.5), width: 2),
        ),
      ),
    );
  }
}