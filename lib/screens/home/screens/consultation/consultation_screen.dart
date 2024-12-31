import 'package:flutter/material.dart';
import 'package:medcall/screens/home/screens/consultation/widgets/consultation_doctor_list_widget.dart';
import 'package:medcall/screens/home/screens/consultation/widgets/consultation_option_card_widget.dart';
import 'package:medcall/widgets/custom_banner.dart';
import '../../../../util/color.dart';

class ConsultationScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomBannerOur(
              title: 'Выберите вариант \nконсультации',
              subTitle: 'Выберите доктора и \nукажите дату и время',
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Доступные специалисты',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: ScreenColor.color1,
                    ),
                  ),
                  const SizedBox(height: 10),
                  DoctorListWidget(),
                  const SizedBox(height: 20),
                  const Text(
                    'Другие варианты',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: ScreenColor.color1,
                    ),
                  ),
                  const SizedBox(height: 10),
                  OptionCardWidget(
                    icon: Icons.book,
                    title: 'База знаний',
                    subtitle: 'Найдите ответы на популярные вопросы.',
                    onTap: () {
                      Navigator.pushNamed(context, '/knowledge');
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}