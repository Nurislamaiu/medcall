import 'package:flutter/material.dart';

import '../../../util/color.dart';
import '../../../widgets/custom_banner.dart';

class MassageServiceScreen extends StatelessWidget {
  final List<Map<String, String>> massages = [
    {
      'title': 'Классический массаж',
      'description': 'Стоимость: от 5000 тг',
    },
    {
      'title': 'Точечный массаж',
      'description': 'Стоимость: от 6000 тг',
    },
    {
      'title': 'Релаксирующий массаж',
      'description': 'Стоимость: от 7000 тг',
    },
    {
      'title': 'Антицеллюлитный массаж',
      'description': 'Стоимость: от 8000 тг',
    },
    {
      'title': 'Массаж шейно-воротниковой зоны',
      'description': 'Стоимость: от 5000 тг',
    },
    {
      'title': 'Спортивный массаж',
      'description': 'Стоимость: от 9000 тг',
    },
    {
      'title': 'Терапевтический массаж',
      'description': 'Стоимость: от 10000 тг',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CustomBannerOur(
            title: 'Лечебный массаж',
            subTitle: 'Выберите подходящий массаж и расслабьтесь!',
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.all(16),
              itemCount: massages.length,
              separatorBuilder: (context, index) =>
              const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final massage = massages[index];
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
                    leading: const Icon(Icons.spa_outlined,
                        color: ScreenColor.color6),
                    title: Text(
                      massage['title']!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: ScreenColor.color1,
                      ),
                    ),
                    subtitle: Text(
                      massage['description']!,
                      style: TextStyle(
                        fontSize: 12,
                        color: ScreenColor.color2,
                      ),
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