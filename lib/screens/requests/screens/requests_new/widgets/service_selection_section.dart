import 'package:flutter/material.dart';
import '../../../../../util/color.dart';
import '../../../../../util/size.dart';
import '../widgets/section_widget.dart';

class SelectServiceSection extends StatelessWidget {
  final List<String> services;
  final String? selectedService;
  final Function(String?) onServiceSelected;
  final VoidCallback onSelectDate;
  final VoidCallback onSelectTime;
  final DateTime? selectedDate;
  final TimeOfDay? selectedTime;

  const SelectServiceSection({
    Key? key,
    required this.services,
    required this.selectedService,
    required this.onServiceSelected,
    required this.onSelectDate,
    required this.onSelectTime,
    this.selectedDate,
    this.selectedTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionWidget(
          title: 'Выберите услугу',
          icon: Icons.medical_information_outlined,
          content: DropdownButtonFormField<String>(
            dropdownColor: Colors.white,
            borderRadius: BorderRadius.circular(30),
            decoration: InputDecoration(
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: ScreenColor.color6, width: 2),
              ),
            ),
            value: selectedService,
            items: services.map((entry) {
              return DropdownMenuItem<String>(
                value: entry,
                child: Text(
                  entry,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              );
            }).toList(),
            onChanged: onServiceSelected,
            hint: Text(
              'Выберите услугу',
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ),
        ),
        SizedBox(height: ScreenSize(context).height * 0.04),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SectionWidget(
                title: 'Выберите дату',
                icon: Icons.calendar_today,
                content: GestureDetector(
                  onTap: onSelectDate,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        textAlign: TextAlign.center,
                        selectedDate == null
                            ? ''
                            : '${selectedDate!.day}.${selectedDate!.month}.${selectedDate!.year}',
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: SectionWidget(
                title: 'Выберите время',
                icon: Icons.access_time,
                content: GestureDetector(
                  onTap: onSelectTime,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        textAlign: TextAlign.center,
                        selectedTime == null
                            ? ''
                            : '${selectedTime!.hour.toString().padLeft(2, '0')}:${selectedTime!.minute.toString().padLeft(2, '0')}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
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