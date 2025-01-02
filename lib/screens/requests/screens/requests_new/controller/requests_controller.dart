import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestController extends GetxController {
  RxString selectedService = ''.obs; // Инициализируем пустой строкой
  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  Rx<TimeOfDay?> selectedTime = Rx<TimeOfDay?>(null);

  void setSelectedService(String? service) {
    selectedService.value = service ?? ''; // Используем безопасное значение по умолчанию
  }

  void setSelectedDate(DateTime? date) {
    selectedDate.value = date;
  }

  void setSelectedTime(TimeOfDay? time) {
    selectedTime.value = time;
  }
}