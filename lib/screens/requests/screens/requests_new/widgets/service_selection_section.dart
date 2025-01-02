import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medcall/screens/requests/screens/requests_new/widgets/section_widget.dart';
import '../../../../../util/color.dart';
import '../controller/requests_controller.dart';

class ServiceSelectionSection extends StatelessWidget {
  final RequestController controller;

  ServiceSelectionSection({required this.controller});

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      barrierColor: Colors.black.withOpacity(0.8),
      // Полупрозрачный фон
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            datePickerTheme: DatePickerThemeData(
              backgroundColor: ScreenColor.white,
              // Цвет фона всего окна
              headerBackgroundColor: ScreenColor.color6,
              // Цвет фона заголовка
              todayBackgroundColor:
              MaterialStateProperty.all(ScreenColor.color6),
              headerHelpStyle: TextStyle(color: Colors.white),
              headerForegroundColor: Colors.white,

              dayStyle: TextStyle(
                // Цвет текста для всех дней
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 14,
              ),
              cancelButtonStyle: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                // Прозрачный фон
                foregroundColor: MaterialStateProperty.all(ScreenColor.color6),
                // Цвет текста
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: ScreenColor.color6),
                )),
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
              ),
              confirmButtonStyle: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(ScreenColor.color6),
                // Цвет фона
                foregroundColor: MaterialStateProperty.all(Colors.white),
                // Белый текст
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                )),
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
                elevation: MaterialStateProperty.all(5), // Легкая тень
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    controller.setSelectedDate(picked);
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      barrierColor: Colors.black.withOpacity(0.8),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            timePickerTheme: TimePickerThemeData(
              hourMinuteTextColor: Colors.white,
              // Цвет текста для часов и минут
              dialBackgroundColor: ScreenColor.color6,
              // Цвет фона циферблата
              entryModeIconColor: ScreenColor.color2,
              // Цвет иконки выбора формата времени
              backgroundColor: ScreenColor.white,
              // Цвет фона всего окна
              dialHandColor: Colors.black,
              hourMinuteColor: ScreenColor.color6,
              helpTextStyle: TextStyle(color: Colors.black),
              timeSelectorSeparatorColor:
              MaterialStateProperty.all(Colors.black),
              dialTextColor: Colors.white,
              cancelButtonStyle: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(ScreenColor.color2),
              ),
              confirmButtonStyle: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(ScreenColor.color2),
              ),
              hourMinuteShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), // Округленные края для времени
            ),
          ),
          child: child!,
        );
      },
    );
    controller.setSelectedTime(picked);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Секция выбора услуги
        SectionWidget(
          title: 'Выберите услугу',
          icon: Iconsax.menu,
          content: DropdownButtonFormField<String>(
            value: controller.selectedService.value.isNotEmpty
                ? controller.selectedService.value
                : null,
            dropdownColor: Colors.white,
            onChanged: (value) {
              controller.setSelectedService(value);
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16, vertical: 12),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: ScreenColor.color6, width: 2),
              ),
              hintStyle: TextStyle(color: Colors.grey.shade600),
            ),
            hint: const Text('Выберите услугу'),
            items: [
              'Внутримышечные инъекции',
              'Внутривенные инъекции',
              'Капельницы',
              'Перевязки',
              'Установка мочевого катетера и стом',
              'Клизмы',
              'Снятие алкогольной интоксикации',
            ]
                .map((service) => DropdownMenuItem<String>(
              value: service,
              child: Text(service, style: TextStyle(fontSize: 12),),
            ))
                .toList(),
          ),
        ),
        const SizedBox(height: 16),

        Row(
          children: [
            // Секция выбора даты
            Expanded(
              child: SectionWidget(
                title: 'Выберите дату',
                icon: Iconsax.calendar,
                content: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => _selectDate(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ScreenColor.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Obx(
                          () => Text(
                        controller.selectedDate.value != null
                            ? '${controller.selectedDate.value!.day}.${controller.selectedDate.value!.month}.${controller.selectedDate.value!.year}'
                            : '',
                        style: const TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Секция выбора времени
            Expanded(
              child: SectionWidget(
                title: 'Выберите время',
                icon: Iconsax.clock,
                content: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => _selectTime(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ScreenColor.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Obx(
                          () => Text(
                        controller.selectedTime.value != null
                            ? '${controller.selectedTime.value!.hour.toString().padLeft(2, '0')}:${controller.selectedTime.value!.minute.toString().padLeft(2, '0')}'
                            : '',
                        style: const TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}