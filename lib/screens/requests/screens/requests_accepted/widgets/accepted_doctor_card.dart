import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../util/color.dart';

class DoctorCard extends StatelessWidget {
  final Map<String, dynamic> doctor;
  final Function(String) onAccept;
  final Function(String) onReject;

  const DoctorCard({
    Key? key,
    required this.doctor,
    required this.onAccept,
    required this.onReject,
  }) : super(key: key);

  void showOptionsModal(BuildContext context, String doctorName) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.report, color: Colors.red),
              title: Text('Жалоба'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Вы подали жалобу на $doctorName'),
                ));
              },
            ),
            ListTile(
              leading: Icon(Icons.visibility_off, color: Colors.grey),
              title: Text('Не показывать'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
            gradient: const LinearGradient(
              colors: [ScreenColor.background, Colors.white70],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: ScreenColor.white,
                      foregroundColor: ScreenColor.color6,
                      maxRadius: 25,
                      child: Text(doctor['name']![0])),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(doctor['name'] ?? 'Неизвестно', style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(doctor['specialty'] ?? 'Не указано'),
                          Row(
                            children: [
                              Text(doctor['rating'].toString()),
                              SizedBox(width: 4),
                              Icon(Iconsax.star1, color: Colors.amber, size: 16),                        ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () => onReject(doctor['name']),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ScreenColor.color1.withOpacity(0.2),
                        foregroundColor: ScreenColor.white,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        'Отклонить',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => onAccept(doctor['name']),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ScreenColor.color6,
                        foregroundColor: ScreenColor.white,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        'Принять',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: IconButton(
          icon: Icon(Icons.more_vert),
          color: Colors.grey,
          iconSize: 16,
          onPressed: () => showOptionsModal(context, doctor['name']),
        ),)
      ],
    );
  }
}