import 'package:flutter/material.dart';
import '../../../../../util/color.dart';

class ServiceSummarySection extends StatelessWidget {
  final String? selectedService;
  final Map<String, String> servicePrices;

  const ServiceSummarySection({
    Key? key,
    this.selectedService,
    required this.servicePrices,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (selectedService != null)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                '$selectedService\nЦена: ${servicePrices[selectedService]}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: ScreenColor.color1,
                ),
              ),
            ),
          ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Создать заявку',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: ScreenColor.color6,
                padding: const EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}