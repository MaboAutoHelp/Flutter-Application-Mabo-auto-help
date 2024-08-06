import 'package:flutter/material.dart';

class Service extends StatefulWidget {
  final String userID;
  const Service({super.key, required this.userID});

  @override
  State<Service> createState() => _ServiceState();
}

class _ServiceState extends State<Service> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ServiceDetailPage(
                      userID: widget.userID,
                      serviceName: 'تغيير زيت المحرك',
                    ),
                  ),
                );
              },
              child: const Text('تغيير زيت المحرك'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ServiceDetailPage(
                      userID: widget.userID,
                      serviceName: 'كشف على الأعطال',
                    ),
                  ),
                );
              },
              child: const Text('كشف على الأعطال'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ServiceDetailPage(
                      userID: widget.userID,
                      serviceName: 'نقل',
                    ),
                  ),
                );
              },
              child: const Text('نقل'),
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceDetailPage extends StatelessWidget {
  final String userID;
  final String serviceName;

  const ServiceDetailPage({
    Key? key,
    required this.userID,
    required this.serviceName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(serviceName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'User ID: $userID',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'تفاصيل الخدمة: $serviceName',
              style: TextStyle(fontSize: 18),
            ),
            // يمكنك هنا إضافة تفاصيل أخرى للخدمة مثل نموذج تعبئة أو معلومات إضافية
          ],
        ),
      ),
    );
  }
}
