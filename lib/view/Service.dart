import 'package:flutter/material.dart';
import 'package:mabo_auto_help/controller/PagepersonnelleContriller.dart';
import 'package:mabo_auto_help/controller/ServiceContriller.dart';
import 'package:mabo_auto_help/view/Home.dart';

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

//ServiceDetailPage
class ServiceDetailPage extends StatefulWidget {
  final String userID;
  final String serviceName;

  const ServiceDetailPage({
    Key? key,
    required this.userID,
    required this.serviceName,
  }) : super(key: key);

  @override
  _ServiceDetailPageState createState() => _ServiceDetailPageState();
}

class _ServiceDetailPageState extends State<ServiceDetailPage> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String? selectedCarType;

  final ServiceController serviceController = ServiceController();
  final PagepersonnelleContriller pagepersonnelleContriller =
      PagepersonnelleContriller();

  final List<String> carTypes = [
    'سيدان',
    'دفع رباعي',
    'هاتشباك',
    'شاحنة',
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
        selectedCarType != null) {
      try {
        var resultNameTel =
            await pagepersonnelleContriller.GetUser(widget.userID);
        var name = resultNameTel['name'];
        var tel = resultNameTel['tel'];
        print(name);
        print(tel);

        var result = await serviceController.SubmitServiceRequest(
          context,
          widget.userID,
          name,
          tel,
          widget.serviceName,
          selectedDate!,
          selectedTime!,
          selectedCarType!,
        );
        

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('تم إرسال الطلب بنجاح!'),
          ),
        );
        // Navigator.push(context, MaterialPageRoute(builder: (context)=>Home(adminID: widget.adminID)));
        // يمكنك هنا التعامل مع النتيجة
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('فشل إرسال الطلب'),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('يرجى ملء جميع الحقول'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.serviceName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'تفاصيل الخدمة: ${widget.serviceName}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: Text(selectedDate == null
                  ? 'اختر يوم'
                  : '${selectedDate!.toLocal()}'.split(' ')[0]),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _selectTime(context),
              child: Text(selectedTime == null
                  ? 'اختر توقيت'
                  : '${selectedTime!.format(context)}'),
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
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () => _submitRequest(context),
                child: Text('إرسال الطلب'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
