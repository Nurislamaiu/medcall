import 'package:flutter/material.dart';
import 'package:medcall/screens/requests/screens/requests_accepted/widgets/accepted_doctor_card.dart';
import 'package:medcall/widgets/custom_home_banner.dart';
import '../../../../widgets/custom_banner.dart';
import '../../../../util/color.dart';
import '../../../../util/size.dart';

class RequestsAcceptedScreen extends StatefulWidget {
  const RequestsAcceptedScreen({
    Key? key,
  }) : super(key: key);

  @override
  _RequestsAcceptedScreenState createState() => _RequestsAcceptedScreenState();
}

class _RequestsAcceptedScreenState extends State<RequestsAcceptedScreen> {
  final List<Map<String, dynamic>> doctors = [
    {'name': 'Доктор Айбек', 'specialty': 'Кардиолог', 'rating': 4.5},
    {'name': 'Доктор Асель', 'specialty': 'Педиатр', 'rating': 4.2},
    {'name': 'Доктор Марат', 'specialty': 'Хирург', 'rating': 4.8},
    {'name': 'Доктор Жанар', 'specialty': 'Терапевт', 'rating': 4.0},
  ];

  void rejectDoctor(String doctorName) {
    setState(() {
      doctors.removeWhere((doctor) => doctor['name'] == doctorName);
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('$doctorName отклонен'),
    ));
  }

  void acceptDoctor(String doctorName) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('$doctorName принят'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ScreenColor.white,
      body: Column(
        children: [
          CustomBanner(
            title: 'Ниже представлен список доступных специалистов.',
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: ScreenColor.white,
                foregroundColor: ScreenColor.color6,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text(
                'Отменить заявку',
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
          Expanded(
            child: doctors.isEmpty
                ? Center(
              child: Text(
                'Ожидайте',
                style: TextStyle(
                  fontSize: 16,
                  color: ScreenColor.color6,
                ),
              ),
            )
                : ListView.builder(
              itemCount: doctors.length,
              itemBuilder: (context, index) {
                final doctor = doctors[index];
                return DoctorCard(
                  doctor: doctor,
                  onAccept: acceptDoctor,
                  onReject: rejectDoctor,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}