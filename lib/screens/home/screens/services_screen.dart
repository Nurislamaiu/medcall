import 'package:flutter/material.dart';

import '../../../util/color.dart';
import '../../../widgets/custom_banner.dart';

class ServiceScreen extends StatelessWidget {
  final List<Map<String, String>> services = [
    {
      'title': 'Внутримышечные инъекции',
      'description': 'Стоимость: от 3000 тг',
    },
    {
      'title': 'Внутривенные инъекции',
      'description': 'Стоимость: от 4000 тг',
    },
    {
      'title': 'Капельницы',
      'description': 'Стоимость: от 5000 тг',
    },
    {
      'title': 'Перевязки',
      'description': 'Стоимость: от 6000 тг',
    },
    {
      'title': 'Установка мочевого катетера и стом',
      'description': 'Стоимость: от 10 000 тг',
    },
    {
      'title': 'Клизмы',
      'description': 'Стоимость: от 15 000 тг',
    },
    {
      'title': 'Снятие алкогольной интоксикации',
      'description': 'Стоимость: от 20 000 тг',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CustomBannerOur(title: 'Наши услуги!', subTitle: 'Выберите услугу или проконсультируйтесь со специалистом.'),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.all(16),
              itemCount: services.length,
              separatorBuilder: (context, index) =>
              const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final service = services[index];
                return Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [ScreenColor.background, Colors.white70],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.medical_information_outlined,
                        color: ScreenColor.color6),
                    title: Text(
                      service['title']!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: ScreenColor.color1,
                      ),
                    ),
                    subtitle: Text(
                      service['description']!,
                      style:
                      TextStyle(fontSize: 12, color: ScreenColor.color2),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
