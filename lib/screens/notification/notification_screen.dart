import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medcall/screens/notification/widgets/notification_service.dart';
import 'package:medcall/screens/notification/widgets/notification_tile_widget.dart';
import 'package:medcall/widgets/custom_banner.dart';
import '../../util/color.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final NotificationService _notificationService = NotificationService();
  List<Map<String, dynamic>> notifications = [];
  Set<int> readNotifications = {};

  @override
  void initState() {
    super.initState();
    _loadNotifications();
  }

  Future<void> _loadNotifications() async {
    final result = await _notificationService.loadNotifications();
    setState(() {
      notifications = result['notifications'];
      readNotifications = result['readNotifications'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CustomBannerOur(title: 'Уведомление', subTitle: 'Входящие уведомлений', isButton: false,),
          notifications.isEmpty
              ? Expanded(child: Center(child: Text('Уведомлений нет')))
              : Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                final isRead = readNotifications.contains(index);
                final timestamp = notification['timestamp'];
                final formattedTime = timestamp != null
                    ? DateFormat('dd.MM.yyyy HH:mm').format(DateTime.parse(timestamp))
                    : 'Нет времени';

                return NotificationTile(
                  notification: notification,
                  isRead: isRead,
                  formattedTime: formattedTime,
                  onTap: () {
                    setState(() {
                      readNotifications.add(index);
                      notifications[index]['read'] = true;
                    });
                    _notificationService.saveNotifications(notifications);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}