/*import 'package:flutter/material.dart';
import 'package:mabo_auto_help/controller/PagepersonnelleContriller.dart';
import 'package:mabo_auto_help/controller/ServiceContriller.dart';

class ServiceDetailPage extends StatefulWidget {
  final String userID;
  final String serviceName;
  final int prix;

  const ServiceDetailPage({
    Key? key,
    required this.userID,
    required this.serviceName,
    required this.prix,
  }) : super(key: key);

  @override
  _ServiceDetailPageState createState() => _ServiceDetailPageState();
}

class _ServiceDetailPageState extends State<ServiceDetailPage> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String? selectedCarType;
  String? selectedlieu;

  final ServiceController serviceController = ServiceController();
  final PagepersonnelleContriller pagepersonnelleController = PagepersonnelleContriller();

  final List<String> lieu = [
    'Sans livraison',
    'livraison',
  ];

  final List<String> carTypes = [
    'Ferrari', 'Porsche', 'Audi', 'Lamborghini', 'Volkswagen', 
  'Mercedes-Benz', 'Renault', 'Chevrolet', 'Jaguar', 'Lexus', 
  'BMW', 'Toyota', 'Honda', 'Ford', 'Nissan', 
  'Bugatti', 'Opel', 'Mitsubishi', 'Alfa Romeo', 'Hyundai', 
  'Peugeot', 'Volvo', 'Subaru', 'Kia', 'Fiat', 
  'Infiniti', 'Škoda', 'MINI', 'Saab', 'Acura', 
  'Dodge', 'Jeep', 'Land Rover', 'Lincoln', 'Isuzu', 
  'Pontiac', 'Lancia', 'MG', 'Maybach', 'Lotus', 
  'Rolls-Royce', 'Maserati', 'Austin', 'Holden', 'Smart', 
  'Morgan', 'Koenigsegg', 'Tesla', 'Scion', 'BYD', 
  'Daewoo', 'Rambler', 'Abarth', 'Willys'
  ];

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  void _submitRequest(BuildContext context) async {
    if (selectedDate != null &&
        selectedTime != null &&
        selectedCarType != null &&
        selectedlieu != null) {
      try {
        var resultNameTel =
            await pagepersonnelleController.GetUser(widget.userID);
        var name = resultNameTel['name'];
        var tel = resultNameTel['tel'];

        var result = await serviceController.SubmitServiceRequest(
          context,
          widget.userID,
          name,
          tel,
          widget.serviceName,
          selectedDate!,
          selectedTime!,
          selectedCarType!,
          selectedlieu!,
          widget.prix,
        );

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('تم إرسال الطلب بنجاح!'),
            backgroundColor: Colors.green,  // أخضر للتأكيد
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('فشل إرسال الطلب'),
            backgroundColor: Colors.red,  // أحمر للفشل
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('يرجى ملء جميع الحقول'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.serviceName, style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF003366),  // الأزرق الداكن
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'تفاصيل الخدمة: ${widget.serviceName}',
              style: TextStyle(fontSize: 18, color: Color(0xFF003366)),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFFD700),
              ),
              child: Text(
                selectedDate == null
                    ? 'اختر يوم'
                    : '${selectedDate!.toLocal()}'.split(' ')[0],
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _selectTime(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFFD700),
              ),
              child: Text(
                selectedTime == null
                    ? 'اختر توقيت'
                    : '${selectedTime!.format(context)}',
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              hint: Text('اختر نوع السيارة'),
              value: selectedCarType,
              onChanged: (newValue) {
                setState(() {
                  selectedCarType = newValue;
                });
              },
              items: carTypes.map((carType) {
                return DropdownMenuItem(
                  value: carType,
                  child: Text(carType),
                );
              }).toList(),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),  // الرمادي الفاتح
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF003366)),  // الأزرق الداكن
                ),
              ),
            ),
            DropdownButtonFormField<String>(
              hint: Text('اختر نوع الخدمة'),
              value: selectedlieu,
              onChanged: (newValue) {
                setState(() {
                  selectedlieu = newValue;
                });
              },
              items: lieu.map((lieu) {
                return DropdownMenuItem(
                  value: lieu,
                  child: Text(lieu),
                );
              }).toList(),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF003366)),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () => _submitRequest(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFFD700),
                ),
                child: Text('إرسال الطلب', style: TextStyle(color: Colors.black)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/

import 'package:flutter/material.dart';
import 'package:mabo_auto_help/controller/PagepersonnelleContriller.dart';
import 'package:mabo_auto_help/controller/ServiceContriller.dart';
import 'package:url_launcher/url_launcher.dart';

class ServiceDetailPage extends StatefulWidget {
  final String userID;
  final String serviceName;
  final int prix;

  const ServiceDetailPage({
    Key? key,
    required this.userID,
    required this.serviceName,
    required this.prix,
  }) : super(key: key);

  @override
  _ServiceDetailPageState createState() => _ServiceDetailPageState();
}

class _ServiceDetailPageState extends State<ServiceDetailPage> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String? selectedCarType;
  String? selectedlieu;
  String? userLocation; // متغير لحفظ إحداثيات الموقع

  final ServiceController serviceController = ServiceController();
  final PagepersonnelleContriller pagepersonnelleController = PagepersonnelleContriller();

  final List<String> lieu = [
    'Sans livraison',
    'livraison',
  ];

  final List<String> carTypes = [
    'Ferrari', 'Porsche', 'Audi', 'Lamborghini', 'Volkswagen', 
  'Mercedes-Benz', 'Renault', 'Chevrolet', 'Jaguar', 'Lexus', 
  'BMW', 'Toyota', 'Honda', 'Ford', 'Nissan', 
  'Bugatti', 'Opel', 'Mitsubishi', 'Alfa Romeo', 'Hyundai', 
  'Peugeot', 'Volvo', 'Subaru', 'Kia', 'Fiat', 
  'Infiniti', 'Škoda', 'MINI', 'Saab', 'Acura', 
  'Dodge', 'Jeep', 'Land Rover', 'Lincoln', 'Isuzu', 
  'Pontiac', 'Lancia', 'MG', 'Maybach', 'Lotus', 
  'Rolls-Royce', 'Maserati', 'Austin', 'Holden', 'Smart', 
  'Morgan', 'Koenigsegg', 'Tesla', 'Scion', 'BYD', 
  'Daewoo', 'Rambler', 'Abarth', 'Willys'
  ];

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  // فتح Google Maps لتحديد الموقع
  void _openGoogleMaps() async {
    const String googleMapsUrl = 'https://www.google.com/maps/search/?api=1&query=';
    final Uri mapsUri = Uri.parse(googleMapsUrl);
    if (await canLaunchUrl(mapsUri)) {
      await launchUrl(mapsUri);
      setState(() {
        userLocation = 'latitude,longitude'; // يمكن تعيين الإحداثيات عند الحصول عليها
      });
    } else {
      throw 'Could not launch $googleMapsUrl';
    }
  }

  void _submitRequest(BuildContext context) async {
    if (selectedDate != null &&
        selectedTime != null &&
        selectedCarType != null &&
        selectedlieu != null &&
        (selectedlieu != 'livraison' || userLocation != null)) { // التأكد من إدخال الموقع في حالة "livraison"
      try {
        var resultNameTel =
            await pagepersonnelleController.GetUser(widget.userID);
        var name = resultNameTel['name'];
        var tel = resultNameTel['tel'];

        var result = await serviceController.SubmitServiceRequest(
          context,
          widget.userID,
          name,
          tel,
          widget.serviceName,
          selectedDate!,
          selectedTime!,
          selectedCarType!,
          selectedlieu!,
          widget.prix,
          userLocation!, // تمرير إحداثيات الموقع
        );

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('تم إرسال الطلب بنجاح!'),
            backgroundColor: Colors.green,
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('فشل إرسال الطلب'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('يرجى ملء جميع الحقول'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.serviceName, style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF003366),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'تفاصيل الخدمة: ${widget.serviceName}',
              style: TextStyle(fontSize: 18, color: Color(0xFF003366)),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFFD700),
              ),
              child: Text(
                selectedDate == null
                    ? 'اختر يوم'
                    : '${selectedDate!.toLocal()}'.split(' ')[0],
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _selectTime(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFFD700),
              ),
              child: Text(
                selectedTime == null
                    ? 'اختر توقيت'
                    : '${selectedTime!.format(context)}',
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              hint: Text('اختر نوع السيارة'),
              value: selectedCarType,
              onChanged: (newValue) {
                setState(() {
                  selectedCarType = newValue;
                });
              },
              items: carTypes.map((carType) {
                return DropdownMenuItem(
                  value: carType,
                  child: Text(carType),
                );
              }).toList(),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF003366)),
                ),
              ),
            ),
            DropdownButtonFormField<String>(
              hint: Text('اختر نوع الخدمة'),
              value: selectedlieu,
              onChanged: (newValue) {
                setState(() {
                  selectedlieu = newValue;
                  if (newValue == 'livraison') {
                    _openGoogleMaps(); // فتح Google Maps عند اختيار "livraison"
                  }
                });
              },
              items: lieu.map((lieu) {
                return DropdownMenuItem(
                  value: lieu,
                  child: Text(lieu),
                );
              }).toList(),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF003366)),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () => _submitRequest(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFFD700),
                ),
                child: Text('إرسال الطلب', style: TextStyle(color: Colors.black)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
