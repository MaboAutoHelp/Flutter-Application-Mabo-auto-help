/*import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:mabo_auto_help/controller/NotificationsController.dart';

class Prix extends StatefulWidget {
  final String userID;
  const Prix({super.key, required this.userID});

  @override
  State<Prix> createState() => _PrixState();
}

class _PrixState extends State<Prix> {
  late Future<List> notifications;

  @override
  void initState() {
    super.initState();
    notifications = Notificationscontroller.getAllServicesReparation(widget.userID);
  }

  String formatDate(String dateStr) {
    DateTime dateTime = DateTime.parse(dateStr);
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  void handleAction(String id, String action) async {
    String itaValue = (action == 'accept') ? 'yes' : 'no';

    try {
      await Notificationscontroller.updateService(id, itaValue);
      setState(() {
        ///notifications = Notificationscontroller.getNotifications();
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Service $itaValue successfully')),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update service: $error')),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List>(
        future: notifications,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Failed to load notifications'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No notifications found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var notification = snapshot.data![index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(notification['serviceName'] ?? 'No service name'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name: ${(notification['name'])}'),
                        Text('Tel: ${(notification['teluser'])}'),
                        Text('Date: ${formatDate(notification['date'])}'),
                        Text('Time: ${notification['time'] ?? 'No time'}'),
                        Text('Car Type: ${notification['carType'] ?? 'No car type'}'),
                        Text('prix: ${notification['prix'] ?? 'prix'}'),
                        Text('Ita Type: ${notification['ita'] ?? 'No ita type'}'),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.check, color: Colors.green),
                          onPressed: () => handleAction(notification['_id'], 'accept'),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close, color: Colors.red),
                          onPressed: () => handleAction(notification['_id'], 'reject'),
                        ),
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
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mabo_auto_help/controller/NotificationsController.dart';

class Prix extends StatefulWidget {
  final String userID;
  const Prix({super.key, required this.userID});

  @override
  State<Prix> createState() => _PrixState();
}

class _PrixState extends State<Prix> {
  late Future<List> notifications;

  @override
  void initState() {
    super.initState();
    notifications = Notificationscontroller.getAllServicesReparation(widget.userID);
  }

  String formatDate(String dateStr) {
    DateTime dateTime = DateTime.parse(dateStr);
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  /*void handleAction(String id, String action) async {
    String itaValue = (action == 'accept') ? 'yes' : 'no';

    try {
      await Notificationscontroller.updateService(id, itaValue);
      setState(() {
        notifications = Notificationscontroller.getAllServicesReparation(widget.userID);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Service $itaValue successfully')),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update service: $error')),
      );
    }
  }*/
  void handleAction(String id, String action) async {
  String itaValue = (action == 'accept') ? 'yes' : 'no';

  try {
    
    await Notificationscontroller.updateService(id, itaValue);

    
    if (itaValue == 'yes') {
       await Notificationscontroller.getServiceID(id);

      
    }

    
    setState(() {
      notifications = Notificationscontroller.getAllServicesReparation(widget.userID);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Service $itaValue successfully')),
    );
  } catch (error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Failed to update service: $error')),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: FutureBuilder<List>(
        future: notifications,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('فشل في تحميل الإشعارات'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('لا توجد إشعارات'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var notification = snapshot.data![index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(
                      notification['serviceName'] ?? 'لا يوجد اسم للخدمة',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF003366), // الأزرق الداكن
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('الاسم: ${notification['name']}'),
                        Text('الهاتف: ${notification['teluser']}'),
                        Text('التاريخ: ${formatDate(notification['date'])}'),
                        Text('الوقت: ${notification['time'] ?? 'لا يوجد وقت'}'),
                        Text('نوع السيارة: ${notification['carType'] ?? 'لا يوجد نوع سيارة'}'),
                        Text('السعر: ${notification['prix'] ?? 'لا يوجد سعر'}'),
                        Text('نوع الإتا: ${notification['ita'] ?? 'لا يوجد نوع إتا'}'),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.check, color: Colors.green),
                          onPressed: () => handleAction(notification['_id'], 'accept'),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close, color: Colors.red),
                          onPressed: () => handleAction(notification['_id'], 'reject'),
                        ),
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
