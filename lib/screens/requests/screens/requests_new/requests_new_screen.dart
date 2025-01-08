import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medcall/screens/requests/screens/requests_new/widgets/selected_service_display_section.dart';
import 'package:medcall/screens/requests/screens/requests_new/widgets/service_selection_section.dart';
import '../../../../util/color.dart';
import '../../../../util/size.dart';
import '../../../../widgets/custom_banner.dart';

class RequestNewScreen extends StatefulWidget {
  @override
  _RequestNewScreenState createState() => _RequestNewScreenState();
}

class _RequestNewScreenState extends State<RequestNewScreen> {
  String? _selectedService;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  final _services = <String>[
    'Внутримышечные инъекции',
    'Внутривенные инъекции',
    'Капельницы',
    'Перевязки',
    'Установка мочевого катетера и стом',
    'Клизмы',
    'Снятие алкогольной интоксикации',
  ];

  final Map<String, String> _servicePrices = {
    'Внутримышечные инъекции': '3000 тг',
    'Внутривенные инъекции': '4000 тг',
    'Капельницы': '5000 тг',
    'Перевязки': '6000 тг',
    'Установка мочевого катетера и стом': '10000 тг',
    'Клизмы': '15000 тг',
    'Снятие алкогольной интоксикации': '20000 тг',
  };

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      builder:
          (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            datePickerTheme: DatePickerThemeData(
              backgroundColor: ScreenColor.white,
              headerBackgroundColor:
              ScreenColor.color6,
              todayBackgroundColor:
              MaterialStateProperty.all(
                  ScreenColor.color6),
              headerHelpStyle: const TextStyle(
                  color: Colors.white),
              headerForegroundColor: Colors.white,
              dayStyle: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 14,
              ),
              cancelButtonStyle: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all(
                    Colors.transparent),
                foregroundColor:
                MaterialStateProperty.all(
                    ScreenColor.color6),
                shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(8),
                      side: const BorderSide(
                          color: ScreenColor.color6),
                    )),
                padding:
                MaterialStateProperty.all(
                    const EdgeInsets
                        .symmetric(
                        horizontal: 20,
                        vertical: 10)),
              ),
              confirmButtonStyle: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all(
                    ScreenColor.color6),
                foregroundColor:
                MaterialStateProperty.all(
                    Colors.white),
                shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(8),
                    )),
                padding:
                MaterialStateProperty.all(
                    const EdgeInsets
                        .symmetric(
                        horizontal: 20,
                        vertical: 10)),
                elevation:
                MaterialStateProperty.all(5),
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay now = TimeOfDay.now();

    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: now,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            timePickerTheme: TimePickerThemeData(
              hourMinuteTextColor: Colors.white,
              dialBackgroundColor: ScreenColor.color6,
              entryModeIconColor: ScreenColor.color2,
              backgroundColor: ScreenColor.white,
              dialHandColor: Colors.white24,
              hourMinuteColor: ScreenColor.color6,
              helpTextStyle: TextStyle(color: Colors.black),
              timeSelectorSeparatorColor: MaterialStateProperty.all(Colors.black),
              dialTextColor: Colors.white,
              cancelButtonStyle: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(ScreenColor.color2),
              ),
              confirmButtonStyle: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(ScreenColor.color2),
              ),
              hourMinuteShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      final DateTime nowDateTime = DateTime.now();
      final DateTime oneHourLater = nowDateTime.add(Duration(hours: 1));

      final DateTime pickedDateTime = DateTime(
        _selectedDate?.year ?? nowDateTime.year,
        _selectedDate?.month ?? nowDateTime.month,
        _selectedDate?.day ?? nowDateTime.day,
        picked.hour,
        picked.minute,
      );

      if (_selectedDate != null && _selectedDate!.year == nowDateTime.year && _selectedDate!.month == nowDateTime.month && _selectedDate!.day == nowDateTime.day) {
        // Проверяем только время, если дата совпадает с текущей
        if (pickedDateTime.isAfter(oneHourLater)) {
          setState(() {
            _selectedTime = picked;
          });
        } else {
          Get.snackbar('Упс', 'Выберите время, которое как минимум на 1 час позже текущего момента');
        }
      } else {
        // Для будущих дат любое время подходит
        setState(() {
          _selectedTime = picked;
        });
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ScreenColor.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            CustomBannerOur(title: 'Создайте заявку!', subTitle: 'Выберите услугу и \nукажите дату и время.'),
            SizedBox(height: ScreenSize(context).height * 0.04),
            // Select Service Section
            SelectServiceSection(
              services: _services,
              selectedService: _selectedService,
              onServiceSelected: (value) {
                setState(() {
                  _selectedService = value;
                });
              },
              onSelectDate: () => _selectDate(context),
              onSelectTime: () => _selectTime(context),
              selectedDate: _selectedDate,
              selectedTime: _selectedTime,
            ),
            SizedBox(height: ScreenSize(context).height * 0.05),
            // Service Summary Section
            ServiceSummarySection(
              selectedService: _selectedService,
              servicePrices: _servicePrices,
            ),
          ],
        ),
      ),
    );
  }
}