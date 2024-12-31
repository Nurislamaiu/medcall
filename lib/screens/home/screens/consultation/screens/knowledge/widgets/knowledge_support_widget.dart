import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportButton extends StatelessWidget {
  final int index;

  const SupportButton({Key? key, required this.index}) : super(key: key);

  void _openApp(BuildContext context) async {
    String url;

    switch (index) {
      case 0:
        url = 'https://t.me/NurislamAiu';
        break;
      case 1:
        url = 'https://wa.me/77473193061';
        break;
      case 2:
        url = 'tel:+77473193061';
        break;
      case 3:
        url = 'mailto:example@example.com';
        break;
      default:
        url = 'https://www.example.com';
    }

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      Get.snackbar(
        'Ошибка',
        'Не удалось открыть приложение. Проверьте наличие установленного приложения.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String path = "assets/svg/default.svg"; // Файл по умолчанию
    Color? color;

    switch (index) {
      case 0:
        path = "assets/svg/telegram.svg";
        color = Colors.grey.shade100;
        break;
      case 1:
        path = "assets/svg/whatsapp.svg";
        color = Colors.grey.shade100;
        break;
      case 2:
        path = "assets/svg/google.svg";
        color = Colors.grey.shade100;
        break;
      case 3:
        path = "assets/svg/gmail.svg";
        color = Colors.grey.shade100;
        break;
    }

    if (color == null || path.isEmpty) {
      return const SizedBox.shrink();
    }

    return GestureDetector(
      onTap: () => _openApp(context),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SvgPicture.asset(
            path
          ),
        ),
      ),
    );
  }
}