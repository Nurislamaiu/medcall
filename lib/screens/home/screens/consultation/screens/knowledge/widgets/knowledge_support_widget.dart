import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medcall/util/size.dart';
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
      Get.snackbar('Ошибка', 'Не удалось открыть приложение');
    }
  }

  @override
  Widget build(BuildContext context) {
    IconData icon;
    String label;
    Color? color;

    switch (index) {
      case 0:
        icon = Icons.telegram;
        label = 'Telegram';
        color = Colors.blue;
        break;
      case 1:
        icon = Icons.phone;
        label = 'WhatsApp';
        color = Colors.green;
        break;
      case 2:
        icon = Icons.phone;
        label = 'Позвонить';
        color = Colors.grey;
        break;
      case 3:
        icon = Icons.email;
        label = 'Написать';
        color = Colors.orangeAccent;
        break;
      default:
        icon = Icons.help;
        label = 'Помощь';
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
        child: Icon(icon, color: Colors.white, size: ScreenSize(context).height * 0.07)
      ),
    );
  }
}