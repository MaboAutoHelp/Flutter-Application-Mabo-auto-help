import 'package:flutter/material.dart';
import 'package:mabo_auto_help/controller/ListServiceController.dart';
import 'package:mabo_auto_help/view/Services/ServiceDetailPage.dart';

class Remplacement extends StatefulWidget {
  final String userID;
  const Remplacement({super.key, required this.userID});

  @override
  State<Remplacement> createState() => _RemplacementState();
}

class _RemplacementState extends State<Remplacement> {
  final ListServiceController serviceController = ListServiceController();

  // هنا نجيب البيانات من API
  Future<List<dynamic>> fetchServices() async {
    return await serviceController.ListService('v6');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الخدمات', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF003366), // الأزرق الداكن
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder(
          future: fetchServices(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('صار مشكل في جلب البيانات'));
            } else {
              List<dynamic> services = snapshot.data!;
              return ListView.builder(
                itemCount: services.length,
                itemBuilder: (context, index) {
                  var service = services[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ServiceDetailPage(
                              userID: widget.userID,
                              serviceName: service['serviceName'],
                              prix: int.parse(service['prix']),
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFD700), // لون الزر أصفر
                      ),
                      child: Text(
                        '${service['serviceName']} - ${service['prix']} د.م',
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}