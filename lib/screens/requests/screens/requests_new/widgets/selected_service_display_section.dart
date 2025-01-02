import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../util/color.dart';
import '../controller/requests_controller.dart';

class SelectedServiceDisplaySection extends StatelessWidget {
  final RequestController controller;
  final VoidCallback onSubmit;

  SelectedServiceDisplaySection({
    required this.controller,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Obx(() {
            if (controller.selectedService.value != null) {
              return Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Text(
                    '${controller.selectedService.value}\n${_getServicePrice(controller.selectedService.value!)}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              );
            }
            return SizedBox.shrink();
          }),
          SizedBox(width: 20),
          Expanded(
            child: ElevatedButton(
              onPressed: onSubmit,
              style: ElevatedButton.styleFrom(
                backgroundColor: ScreenColor.color6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text('Создать заявку', style: TextStyle(color: Colors.white),),
            ),
          ),
        ],
      ),
    );
  }

  String _getServicePrice(String service) {
    final Map<String, String> servicePrices = {
      'Внутримышечные инъекции': '3000 тг',
      'Внутривенные инъекции': '4000 тг',
      'Капельницы': '5000 тг',
      'Перевязки': '6000 тг',
      'Установка мочевого катетера и стом': '10000 тг',
      'Клизмы': '15000 тг',
      'Снятие алкогольной интоксикации': '20000 тг',
    };
    return servicePrices[service] ?? '';
  }
}