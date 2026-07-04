import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationService {
  // Membuat instance (objek) plugin notifikasi
  static final FlutterLocalNotificationsPlugin _notificationsPlugin = FlutterLocalNotificationsPlugin();

  // Fungsi untuk inisialisasi pengaturan notifikasi
  static Future<void> initialize() async {
    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings initializationSettingsIOS = DarwinInitializationSettings();

    const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await _notificationsPlugin.initialize(initializationSettings);

    if (kIsWeb) return;

    final bool isAndroid = defaultTargetPlatform == TargetPlatform.android;
    if (isAndroid) {
      await Permission.notification.request();
    }
  }

  // Fungsi untuk memunculkan notifikasi
  static Future<void> showNotification({required int id, required String title, required String body}) async {
    if (kIsWeb) return;

    final bool isAndroid = defaultTargetPlatform == TargetPlatform.android;
    if (isAndroid) {
      final status = await Permission.notification.status;
      if (!status.isGranted && !status.isProvisional) {
        await Permission.notification.request();
      }
    }

    const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
      'catersync_channel_1', // ID Channel
      'CaterSync Notifications', // Nama Channel
      channelDescription: 'Notifikasi utama aplikasi CaterSync',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );
    
    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );
    
    // Menampilkan notifikasi ke layar HP
    await _notificationsPlugin.show(id, title, body, notificationDetails);
  }
}