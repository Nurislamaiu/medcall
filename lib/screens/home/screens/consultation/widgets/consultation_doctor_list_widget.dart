import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medcall/widgets/custom_button.dart';

import '../../../../../util/color.dart';

class DoctorListWidget extends StatelessWidget {
  DoctorListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> doctors = [
      {
        'name': 'Ilyasov Nurislam Bayirzhanuli',
        'specialization': 'Терапевт',
        'experience': '10',
        'rating': '11',
      },
    ];
    return Column(
      children: doctors.map((doctor) {
        return _buildDoctorCard(
          context,
          name: doctor['name']!,
          specialization: doctor['specialization']!,
          experience: doctor['experience']!,
          rating: doctor['rating']!,
        );
      }).toList(),
    );
  }

  Widget _buildDoctorCard(BuildContext context,
      {required String name,
      required String specialization,
      required String experience,
      required String rating}) {
    return Container(
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
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: ScreenColor.color6.withOpacity(0.2),
                    child:
                        Icon(Icons.person, size: 30, color: ScreenColor.color6),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          specialization,
                          style: TextStyle(
                            fontSize: 12,
                            color: ScreenColor.color1,
                          ),
                        ),
                        Text(
                          name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: ScreenColor.color1,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Стаж - $experience лет',
                              style: TextStyle(
                                fontSize: 12,
                                color: ScreenColor.color1,
                              ),
                            ),
                            SizedBox(width: 10),
                            Row(
                              children: [
                                Icon(Iconsax.message_text, size: 12),
                                Text(
                                  '  $rating отзывов',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: ScreenColor.color1,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Divider(),
              SizedBox(height: 10),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Онлайн консультация',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '6900 тг',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Iconsax.clock, size: 18),
                      Text(
                        '  Длительность - 30 минут',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              Divider(),
              SizedBox(height: 10),
              CustomButton(text: 'Записаться', onPressed: (){
                Navigator.pushNamed(context, '/requestConsultation');
              })

            ],
          ),
        ),
    );
  }
}
