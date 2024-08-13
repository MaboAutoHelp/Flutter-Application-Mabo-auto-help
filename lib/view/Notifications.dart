import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart'; // استيراد مكتبة intl
import 'package:mabo_auto_help/controller/NotificationsController.dart';
class Notifications extends StatefulWidget {
  final String userID;
  const Notifications({super.key, required this.userID});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  late Future<List> notifications;

  @override
  void initState() {
    super.initState();
    notifications = Notificationscontroller.getNotifications(widget.userID);
    
    // تأكيد بدء تنفيذ الـ Future
    /*print('Fetching notifications...');
    
    notifications.then((data) {
      // طباعة البيانات إذا نجح الجلب
      print('Notifications fetched: $data');
    }).catchError((error) {
      // طباعة الخطأ إذا حدث
      print('Error fetching notifications: $error');
    }).whenComplete(() {
      // تأكيد اكتمال العملية
      print('Fetch operation completed');
    });*/
  }

  String formatDate(String dateStr) {
    DateTime dateTime = DateTime.parse(dateStr);
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List>(
        future: notifications,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print('Error: ${snapshot.error}');
            return Center(child: Text('Failed to load notifications'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            print('No notifications found');
            return Center(child: Text('No notifications found'));
          } else {
            print('Notifications Data: ${snapshot.data}');
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var notification = snapshot.data![index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(notification['serviceName'] ?? 'No service name'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Date: ${formatDate(notification['date'])}'),
                        Text('Time: ${notification['time'] ?? 'No time'}'),
                        Text('Car Type: ${notification['carType'] ?? 'No car type'}'),
                        Text('Ita Type: ${notification['ita'] ?? 'No ita type'}'),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

/*class Notifications extends StatefulWidget {
  final String userID;
  const Notifications({super.key, required this.userID});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  late Future<List> notifications;

  @override
void initState() {
  super.initState();

  // ابدأ بجلب الإشعارات
  notifications = Notificationscontroller.getNotifications(widget.userID);

  // تأكيد بدء تنفيذ الـ Future
  print('Fetching notifications...');

  notifications.then((data) {
    // طباعة البيانات إذا نجح الجلب
    print('Notifications fetched: $data');
  }).catchError((error) {
    // طباعة الخطأ إذا حدث
    print('Error fetching notifications: $error');
  }).whenComplete(() {
    // تأكيد اكتمال العملية
    print('Fetch operation completed');
  });
}


  String formatDate(String dateStr) {
    DateTime dateTime = DateTime.parse(dateStr);
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List>(
        future: notifications,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print('Error: ${snapshot.error}'); // طباعة الخطأ إن وجد
            return Center(child: Text('Failed to load notifications'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            print('No notifications found'); // تأكيد عدم وجود بيانات
            return Center(child: Text('No notifications found'));
          } else {
            print('Notifications Data: ${snapshot.data}'); // طباعة البيانات المستلمة
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var notification = snapshot.data![index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(notification['serviceName'] ?? 'No service name'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Date: ${formatDate(notification['date'])}'),
                        Text('Time: ${notification['time'] ?? 'No time'}'),
                        Text('Car Type: ${notification['carType'] ?? 'No car type'}'),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}*/
