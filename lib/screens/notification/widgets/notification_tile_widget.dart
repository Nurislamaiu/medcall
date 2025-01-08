import 'package:flutter/material.dart';
import '../../../util/color.dart';

class NotificationTile extends StatelessWidget {
  final Map<String, dynamic> notification;
  final bool isRead;
  final String formattedTime;
  final VoidCallback onTap;

  const NotificationTile({
    Key? key,
    required this.notification,
    required this.isRead,
    required this.formattedTime,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: const LinearGradient(
          colors: [ScreenColor.background, Colors.white70],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            ListTile(
              splashColor: Colors.transparent,
              title: Text(notification['title']!),
              subtitle: Text(notification['body']!),
              trailing: isRead
                  ? null
                  : const Icon(
                Icons.circle,
                color: Colors.green,
                size: 12.0,
              ),
              onTap: onTap,
            ),
            Positioned(
              bottom: 5,
              right: 5,
              child: Text(
                formattedTime,
                style: TextStyle(fontSize: 10, color: Colors.grey),
              ),
            )
          ],
        ),
      ),
    );
  }
}