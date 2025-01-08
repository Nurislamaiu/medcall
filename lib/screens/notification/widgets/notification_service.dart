import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationService {
  Future<Map<String, dynamic>> loadNotifications() async {
    final prefs = await SharedPreferences.getInstance();
    final notificationsJson = prefs.getString('notifications');
    List<Map<String, dynamic>> notifications = [];
    Set<int> readNotifications = {};

    if (notificationsJson != null) {
      notifications = List<Map<String, dynamic>>.from(jsonDecode(notificationsJson));
      notifications.sort((a, b) => b['timestamp']?.compareTo(a['timestamp'] ?? '') ?? 0);

      for (var i = 0; i < notifications.length; i++) {
        if (notifications[i]['read'] == true) {
          readNotifications.add(i);
        }
      }
    }
    return {'notifications': notifications, 'readNotifications': readNotifications};
  }

  Future<void> saveNotifications(List<Map<String, dynamic>> notifications) async {
    final prefs = await SharedPreferences.getInstance();
    final notificationsJson = jsonEncode(notifications);
    await prefs.setString('notifications', notificationsJson);
  }

  Future<void> clearNotifications() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('notifications');
  }
}