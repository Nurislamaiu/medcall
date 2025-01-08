import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../util/color.dart';
import '../screens/requests_edit/requests_edit_screen.dart';

class RequestList extends StatelessWidget {
  RequestList({super.key});

  final now = DateTime.now();

  final List<Map<String, dynamic>> requests = [
    {
      'id': '1',
      'service': 'Капельницы',
      'dateTime': DateTime.now().add(const Duration(days: 3)),
    },
    {
      'id': '2',
      'service': 'Внутривенные инъекции',
      'dateTime': DateTime.now().add(const Duration(days: 2)),
    },
    {
      'id': '3',
      'service': 'Перевязки',
      'dateTime': DateTime.now().subtract(const Duration(days: 1)),
    },
  ];

  List<Map<String, dynamic>> getActiveRequests() {
    return requests.where((request) {
      final requestDateTime = request['dateTime'] as DateTime;
      return requestDateTime.isAfter(now);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final activeRequests = getActiveRequests();

    if (activeRequests.isEmpty) {
      return const Center(
        child: Text('Нет заявок'),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: activeRequests.length,
      itemBuilder: (context, index) {
        final request = activeRequests[index];
        final service = request['service'];
        final dateTime = request['dateTime'] as DateTime;

        final formattedDate = DateFormat('dd.MM.yyyy').format(dateTime);
        final formattedTime = DateFormat('HH:mm').format(dateTime);

        return GestureDetector(
          onTap: () {
            // Navigate to EditRequestScreen with request details
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditRequestScreen(
                  requestId: request['id'], // Pass the request ID
                  initialService: service, // Pass the selected service
                  initialDate: dateTime, // Pass the initial date
                ),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
              gradient: const LinearGradient(
                colors: [ScreenColor.background, Colors.white70],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                  vertical: 10, horizontal: 20),
              title: Text(
                'Заявка ${index + 1}',
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildRichText('Услуга: ', service),
                    Row(
                      children: [
                        _buildRichText('Дата: ', formattedDate),
                        _buildRichText(' | Время: ', formattedTime),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildRichText(String label, String value) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: label,
            style: GoogleFonts.openSans(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: value,
            style: GoogleFonts.openSans(
              fontSize: 12,
              color: Colors.black45,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}