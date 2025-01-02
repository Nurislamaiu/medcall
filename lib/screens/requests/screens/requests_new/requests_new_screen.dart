import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medcall/screens/requests/screens/requests_new/widgets/selected_service_display_section.dart';
import 'package:medcall/screens/requests/screens/requests_new/widgets/service_selection_section.dart';
import 'package:medcall/widgets/custom_banner.dart';

import '../../../../util/color.dart';
import '../../../../util/size.dart';
import 'controller/requests_controller.dart';

class RequestNewScreen extends StatelessWidget {
  final RequestController _controller = Get.put(RequestController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ScreenColor.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomBannerOur(
              title: 'Создайте заявку!',
              subTitle: 'Выберите услугу и \nукажите дату и время.',
            ),
            SizedBox(height: ScreenSize(context).height * 0.04),

            // Секция выбора услуги
            ServiceSelectionSection(controller: _controller),

            SizedBox(height: ScreenSize(context).height * 0.05),

            // Отображение выбранной услуги и её цены
            SelectedServiceDisplaySection(
              controller: _controller,
              onSubmit: () {
                if (_controller.selectedService.value == null ||
                    _controller.selectedDate.value == null ||
                    _controller.selectedTime.value == null) {
                  Get.snackbar('Пожалуйста', 'Заполните все поля');
                  return;
                }
                // Логика создания заявки
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}