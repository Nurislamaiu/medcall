import 'package:flutter/material.dart';
import 'package:medcall/screens/home/widgets/actions_widget.dart';
import 'package:medcall/screens/home/widgets/advertising_widget.dart';

import '../../util/color.dart';
import '../../util/size.dart';
import '../../widgets/custom_banner.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ScreenColor.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Баннер
            CustomBanner(title: 'Ваше здоровье \nв надежных руках!', child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ScreenColor.white,
                foregroundColor: ScreenColor.color6,
                padding:
                EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/patient/new-request');
              },
              child: Text('Оставить заявку'),
            ),),
            SizedBox(height: ScreenSize(context).height * 0.05),
            // Кнопки быстрого действия
            ActionButtons(),

            SizedBox(height: ScreenSize(context).height * 0.05),
            // Преимущества сервиса
            Advertising(),
          ],
        ),
      ),
    );
  }
}

