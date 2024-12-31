import 'package:flutter/material.dart';
import 'package:medcall/widgets/custom_banner.dart';

import '../../../../../../util/color.dart';

class RequestConsultationScreen extends StatefulWidget {
  @override
  _BookConsultationScreenState createState() => _BookConsultationScreenState();
}

class _BookConsultationScreenState extends State<RequestConsultationScreen> {
  DateTime? selectedDate;
  TextEditingController dataController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CustomBannerOur(title: 'Создайте заявку!', subTitle: 'Укажите дату.'),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ListTile(
                  title: Text(
                    selectedDate == null
                        ? 'Выберите дату'
                        : 'Дата: ${selectedDate!.toLocal().toString().split(' ')[0]}',
                  ),
                  trailing: const Icon(Icons.calendar_today),
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 365)),
                    );

                    if (picked != null && picked != selectedDate) {
                      setState(() {
                        selectedDate = picked;
                      });
                    }
                  },
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: dataController,
                  decoration: InputDecoration(
                    labelText: 'Введите данные для обратной связи',
                    labelStyle:
                    TextStyle(fontSize: 12, color: ScreenColor.color6),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide:
                      BorderSide(color: ScreenColor.color6, width: 2),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: ScreenColor.color6,
                    ),
                    child: const Text(
                      'Подтвердить запись',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}