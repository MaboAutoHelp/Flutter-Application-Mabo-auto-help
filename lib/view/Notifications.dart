/*import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // استيراد مكتبة intl
import 'package:mabo_auto_help/controller/NotificationsController.dart';
import 'package:qr_flutter/qr_flutter.dart';

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
            return Center(child: Text('Failed to load notifications'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No notifications found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var notification = snapshot.data![index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    title:
                        Text(notification['serviceName'] ?? 'No service name'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Date: ${formatDate(notification['date'])}'),
                        Text('Time: ${notification['time'] ?? 'No time'}'),
                        Text(
                            'Car Type: ${notification['carType'] ?? 'No car type'}'),
                        Text(
                            'lieu: ${notification['lieu'] ?? 'No car type'}'),
                        Text(
                            'Ita Type: ${notification['ita'] ?? 'No ita type'}'),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.qr_code),
                      onPressed: () {
                        if (notification['_id'] != null) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('QR Code'),
                              content: SizedBox(
                                width: 200.0, // عرض محدد
                                height: 200.0, // ارتفاع محدد
                                child: QrImageView(
                                  data: notification['_id'], // البيانات المستلمة من الخادم
                                  version: QrVersions.auto,
                                  size: 200.0,
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text('Close'),
                                ),
                              ],
                            ),
                          );
                        }
                      },
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
//----------------------------------------------------------------------------------------------------
/*import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // استيراد مكتبة intl
import 'package:mabo_auto_help/controller/NotificationsController.dart';
import 'package:qr_flutter/qr_flutter.dart';

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
  }

  String formatDate(String dateStr) {
    DateTime dateTime = DateTime.parse(dateStr);
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }
  Color getItaTypeColor(String itaType) {
    switch (itaType) {
      case 'attente':
        return Colors.orange;
      case 'accepted':
        return Colors.green;
      case 'rejected':
        return Colors.red;
      case 'La réparation est terminée':
        return Colors.blue;
      case 'Puis un problème':
        return Colors.purple;
      case 'yes':
        return Colors.teal;
      default:
        return Colors.black;
    }
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
            return Center(child: Text('فشل في تحميل الإشعارات'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('لا توجد إشعارات'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var notification = snapshot.data![index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(
                      notification['serviceName'] ?? 'No service name',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF003366), // الأزرق الداكن
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Date ${formatDate(notification['date'])}',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        Text(
                          'Time : ${notification['time'] ?? 'لا يوجد وقت'}',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        Text(
                          'Car Type ${notification['carType'] ?? 'لا يوجد نوع سيارة'}',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        Text(
                          'Lendroit ${notification['lieu'] ?? 'لا يوجد مكان'}',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        Text(
                          'prix ${notification['prix'] ?? 'لا يوجد مكان'}',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        Text(
                        'Ita Type: ${notification['ita'] ?? 'No ita type'}',
                        style: TextStyle(
                          color: getItaTypeColor(notification['ita'] ?? 'No ita type'),
                        ),
                      ),
                      Text(
                        'lieuMicanicien: ${notification['lieuMicanicien'] ?? 'No lieuMicanicien '}',
                        
                      ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.qr_code, color: Color(0xFFFFD700)), // لون أيقونة QR code أصفر
                      onPressed: () {
                        if (notification['_id'] != null) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('QR Code'),
                              content: SizedBox(
                                width: 200.0, // عرض محدد
                                height: 200.0, // ارتفاع محدد
                                child: QrImageView(
                                  data: notification['_id'], // البيانات المستلمة من الخادم
                                  version: QrVersions.auto,
                                  size: 200.0,
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text('إغلاق'),
                                ),
                              ],
                            ),
                          );
                        }
                      },
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
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mabo_auto_help/controller/NotificationsController.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

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
  }

  String formatDate(String dateStr) {
    DateTime dateTime = DateTime.parse(dateStr);
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  Color getItaTypeColor(String itaType) {
    switch (itaType) {
      case 'attente':
        return Colors.orange;
      case 'accepted':
        return Colors.green;
      case 'rejected':
        return Colors.red;
      case 'La réparation est terminée':
        return Colors.blue;
      case 'Puis un problème':
        return Colors.purple;
      case 'yes':
        return Colors.teal;
      default:
        return Colors.black;
    }
  }

  Future<void> _openGoogleMaps(String locationUrl) async {
    if (await canLaunch(locationUrl)) {
      await launch(locationUrl);
    } else {
      throw 'تعذر فتح الرابط $locationUrl';
    }
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
            return Center(child: Text('فشل في تحميل الإشعارات'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('لا توجد إشعارات'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var notification = snapshot.data![index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(
                      notification['serviceName'] ?? 'No service name',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF003366),
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Date ${formatDate(notification['date'])}', style: TextStyle(color: Colors.grey[600])),
                        Text('Time : ${notification['time'] ?? 'لا يوجد وقت'}', style: TextStyle(color: Colors.grey[600])),
                        Text('Car Type ${notification['carType'] ?? 'لا يوجد نوع سيارة'}', style: TextStyle(color: Colors.grey[600])),
                        Text('Lendroit ${notification['lieu'] ?? 'لا يوجد مكان'}', style: TextStyle(color: Colors.grey[600])),
                        Text('prix ${notification['prix'] ?? 'لا يوجد مكان'}', style: TextStyle(color: Colors.grey[600])),
                        Text('Ita Type: ${notification['ita'] ?? 'No ita type'}', style: TextStyle(color: getItaTypeColor(notification['ita'] ?? 'No ita type'))),
                        Text('Tel micanicien: ${notification['tel'] ?? 'No tel'}', style: TextStyle(color: Colors.grey[600])),
                        Row(
                          children: [
                            Text(
                              'lieuMicanicien: ',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            IconButton(
                              icon: Icon(Icons.map, color: Colors.blue),
                              onPressed: () {
                                if (notification['lieuMicanicien'] != null) {
                                  _openGoogleMaps(notification['lieuMicanicien']);
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.qr_code, color: Color(0xFFFFD700)),
                      onPressed: () {
                        if (notification['_id'] != null) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('QR Code'),
                              content: SizedBox(
                                width: 200.0,
                                height: 200.0,
                                child: QrImageView(
                                  data: notification['_id'],
                                  version: QrVersions.auto,
                                  size: 200.0,
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text('إغلاق'),
                                ),
                              ],
                            ),
                          );
                        }
                      },
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



//---------------------------------------------------------------------------------------------------
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
