import 'package:flutter/material.dart';

import '../../../../../util/color.dart';

class DoctorListWidget extends StatelessWidget {

  DoctorListWidget({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Map<String, String>> doctors = [
      {
        'name': 'Доктор Иванов',
        'specialization': 'Терапевт',
        'experience': '10'
      },
      {
        'name': 'Доктор Петров',
        'specialization': 'Кардиолог',
        'experience': '8'
      },
      {
        'name': 'Доктор Сидоров',
        'specialization': 'Невролог',
        'experience': '5'
      },
    ];
    return Column(
      children: doctors.map((doctor) {
        return _buildDoctorCard(
          context,
          name: doctor['name']!,
          specialization: doctor['specialization']!,
          experience: doctor['experience']!,
          onTap: () {
            Navigator.pushNamed(
              context,
              '/doctor-details',
              arguments: doctor,
            );
          },
        );
      }).toList(),
    );
  }

  Widget _buildDoctorCard(BuildContext context,
      {required String name,
        required String specialization,
        required String experience,
        required Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [ScreenColor.background, Colors.white70],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: ScreenColor.color6.withOpacity(0.2),
                child: Icon(Icons.person, size: 30, color: ScreenColor.color6),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: ScreenColor.color1,
                      ),
                    ),
                    Text(
                      'Специалист: $specialization',
                      style: TextStyle(
                        fontSize: 14,
                        color: ScreenColor.color1.withOpacity(0.6),
                      ),
                    ),
                    Text(
                      'Опыт: $experience лет',
                      style: TextStyle(
                        fontSize: 12,
                        color: ScreenColor.color1.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios,
                  size: 16, color: ScreenColor.color1),
            ],
          ),
        ),
      ),
    );
  }
}