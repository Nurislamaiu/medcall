import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medcall/widgets/custom_banner.dart';

import '../../../../util/color.dart';
import '../../../../util/size.dart';

class EditRequestScreen extends StatefulWidget {
  final String requestId;
  final String initialService;
  final DateTime initialDate;

  const EditRequestScreen({
    Key? key,
    required this.requestId,
    required this.initialService,
    required this.initialDate,
  }) : super(key: key);

  @override
  _EditRequestScreenState createState() => _EditRequestScreenState();
}

class _EditRequestScreenState extends State<EditRequestScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _dateController;
  late TextEditingController _timeController;
  String _service = '';

  final List<String> _services = [
    'Внутримышечные инъекции',
    'Внутривенные инъекции',
    'Капельницы',
    'Перевязки',
    'Установка мочевого катетера и стом',
    'Клизмы',
    'Снятие алкогольной интоксикации'
  ];

  @override
  void initState() {
    super.initState();
    _dateController = TextEditingController(
      text: DateFormat('dd.MM.yyyy').format(widget.initialDate),
    );
    _timeController = TextEditingController(
      text: DateFormat('HH:mm').format(widget.initialDate),
    );
    _service = widget.initialService;
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime now = DateTime.now();
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: now, // Ensure the firstDate is the current date or later
      lastDate: now.add(const Duration(days: 365 * 2)), // Add 2 years for the lastDate
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            datePickerTheme: DatePickerThemeData(
              backgroundColor: ScreenColor.white,
              headerBackgroundColor: ScreenColor.color6,
              todayBackgroundColor:
              MaterialStateProperty.all(ScreenColor.color6),
              headerHelpStyle: const TextStyle(color: Colors.white),
              headerForegroundColor: Colors.white,
              dayStyle: const TextStyle(color: Colors.black),
            ),
          ),
          child: child!,
        );
      },
    );

    if (selectedDate != null) {
      setState(() {
        _dateController.text = DateFormat('dd.MM.yyyy').format(selectedDate);
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(widget.initialDate),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            timePickerTheme: TimePickerThemeData(
              hourMinuteTextColor: Colors.white,
              dialBackgroundColor: ScreenColor.color6,
              backgroundColor: ScreenColor.white,
            ),
          ),
          child: child!,
        );
      },
    );

    if (selectedTime != null) {
      setState(() {
        _timeController.text =
        '${selectedTime.hour.toString().padLeft(2, '0')}:${selectedTime.minute.toString().padLeft(2, '0')}';
      });
    }
  }

  @override
  void dispose() {
    _dateController.dispose();
    _timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ScreenColor.white,
      body: Column(
        children: [
          CustomBannerOur(title: 'Редактирование \nзаявки', subTitle: 'Пожалуйста, заполните все поля'),
          SizedBox(height: ScreenSize(context).height * 0.025),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    DropdownButtonFormField<String>(
                      dropdownColor: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      style: const TextStyle(fontSize: 14, color: Colors.black),
                      value: _service,
                      items: _services
                          .map((service) => DropdownMenuItem<String>(
                        value: service,
                        child: Text(service),
                      ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _service = value!;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Услуга',
                        labelStyle: TextStyle(color: ScreenColor.color6),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Пожалуйста, выберите услугу';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _dateController,
                      readOnly: true,
                      onTap: () => _selectDate(context),
                      decoration: InputDecoration(
                        labelText: 'Дата',
                        labelStyle: TextStyle(color: ScreenColor.color6),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Пожалуйста, выберите дату';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _timeController,
                      readOnly: true,
                      onTap: () => _selectTime(context),
                      decoration: InputDecoration(
                        labelText: 'Время',
                        labelStyle: TextStyle(color: ScreenColor.color6),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Пожалуйста, выберите время';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ScreenColor.color6,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: const Text(
                        'Обновить заявку',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}