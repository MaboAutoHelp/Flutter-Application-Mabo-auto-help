/*import 'package:flutter/material.dart';
import 'package:mabo_auto_help/view/PagePersonnelle.dart';
import 'package:mabo_auto_help/view/Service.dart';
import 'package:mabo_auto_help/view/notifications.dart';
import 'package:mabo_auto_help/view/prix.dart';

class Home extends StatefulWidget {
  final String userID;

  const Home({super.key, required this.userID});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sign out'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.assignment_ind_rounded),
              ),
              Tab(
                icon: Icon(Icons.car_crash_sharp),
              ),
              Tab(
                icon: Icon(Icons.circle_notifications),
              ),
              Tab(
                icon: Icon(Icons.pix),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(
              child: Pagepersonnelle(userID: widget.userID),
            ),
             Center(
              child: Service(userID: widget.userID),
            ),
             Center(
             child: Notifications(userID: widget.userID),
            ),
            Center(
              child: Prix(userID: widget.userID),
            )
          ],
        ),
      ),
    );
  }
}*/
/*
import 'package:flutter/material.dart';
import 'package:mabo_auto_help/view/PagePersonnelle.dart';
import 'package:mabo_auto_help/view/Service.dart';
import 'package:mabo_auto_help/view/notifications.dart';
import 'package:mabo_auto_help/view/prix.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  final String userID;

  const Home({Key? key, required this.userID}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String phoneNumber = '92372783';

  void _makePhoneCall() async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Sign out',
            style: TextStyle(
              color: Colors.white,  // لون النص في شريط التطبيق
            ),
          ),
          backgroundColor: Color(0xFF003366),  // الأزرق الداكن لشريط التطبيق
          bottom: const TabBar(
            indicatorColor: Color(0xFFFFD700),  // لون مؤشر التبويب أصفر
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.assignment_ind_rounded, color: Colors.white),  // الأيقونات باللون الأبيض
              ),
              Tab(
                icon: Icon(Icons.car_crash_sharp, color: Colors.white),
              ),
              Tab(
                icon: Icon(Icons.circle_notifications, color: Colors.white),
              ),
              Tab(
                icon: Icon(Icons.pix, color: Colors.white),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(
              child: Pagepersonnelle(userID: widget.userID),
            ),
            Center(
              child: Service(userID: widget.userID),
            ),
            Center(
              child: Notifications(userID: widget.userID),
            ),
            Center(
              child: Prix(userID: widget.userID),
            ),
          ],
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: _makePhoneCall,
              tooltip: 'اتصل',
              child: const Icon(Icons.phone),
            ),
            const SizedBox(height: 8), // مسافة بين الزر والنص
            Text(
              "Contactez-nous en cas d'urgence",
              style: TextStyle(
                fontSize: 16, // حجم النص
                color: Colors.black, // لون النص
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
      
    );
  }
}
*/

/*
import 'package:flutter/material.dart';
import 'package:mabo_auto_help/view/PagePersonnelle.dart';
import 'package:mabo_auto_help/view/Service.dart';
import 'package:mabo_auto_help/view/notifications.dart';
import 'package:mabo_auto_help/view/prix.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  final String userID;

  const Home({Key? key, required this.userID}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String phoneNumber = '92372783';

  void _makePhoneCall() async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Sign out',
            style: TextStyle(
              color: Colors.white, // لون النص في شريط التطبيق
            ),
          ),
          backgroundColor: const Color(0xFF003366), // الأزرق الداكن لشريط التطبيق
          bottom: const TabBar(
            indicatorColor: Color(0xFFFFD700), // لون مؤشر التبويب أصفر
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.assignment_ind_rounded, color: Colors.white), // الأيقونات باللون الأبيض
              ),
              Tab(
                icon: Icon(Icons.car_crash_sharp, color: Colors.white),
              ),
              Tab(
                icon: Icon(Icons.circle_notifications, color: Colors.white),
              ),
              Tab(
                icon: Icon(Icons.pix, color: Colors.white),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(
              child: Pagepersonnelle(userID: widget.userID),
            ),
            // عرض صفحة Service مع الزر والنص التوضيحي
            Scaffold(
              body: Center(
                child: Service(userID: widget.userID),
              ),
              floatingActionButton: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: _makePhoneCall,
                    tooltip: 'اتصل',
                    child: const Icon(Icons.phone),
                  ),
                  const SizedBox(width: 10), // مسافة أفقية بين الزر والنص
                  Text(
                    "Contactez-nous en cas d'urgence",
                    style: const TextStyle(
                      fontSize: 16, // حجم النص
                      color: Colors.black, // لون النص
                    ),
                  ),
                ],
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            ),
            Center(
              child: Notifications(userID: widget.userID),
            ),
            Center(
              child: Prix(userID: widget.userID),
            ),
          ],
        ),
      ),
    );
  }
}

*/
import 'package:flutter/material.dart';
import 'package:mabo_auto_help/view/PagePersonnelle.dart';
import 'package:mabo_auto_help/view/Service.dart';
import 'package:mabo_auto_help/view/notifications.dart';
import 'package:mabo_auto_help/view/prix.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  final String userID;

  const Home({Key? key, required this.userID}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String phoneNumber = '92372783';

  void _makePhoneCall() async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  void _signOut() {
    // منطق تسجيل الخروج هنا، يمكنك إضافة التنقل لصفحة تسجيل الدخول
    Navigator.pop(context); // على سبيل المثال، العودة إلى صفحة تسجيل الدخول
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, // إزالة السهم التلقائي
          title: const Text(
            'Home',
            style: TextStyle(
              color: Colors.white, // لون النص في شريط التطبيق
            ),
          ),
          backgroundColor: const Color(0xFF003366), // الأزرق الداكن لشريط التطبيق
          actions: [
            IconButton(
              icon: const Icon(Icons.logout), // أيقونة تسجيل الخروج
              onPressed: _signOut,
              tooltip: 'تسجيل خروج',
            ),
          ],
          bottom: const TabBar(
            indicatorColor: Color(0xFFFFD700), // لون مؤشر التبويب أصفر
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.assignment_ind_rounded, color: Colors.white), // الأيقونات باللون الأبيض
              ),
              Tab(
                icon: Icon(Icons.car_crash_sharp, color: Colors.white),
              ),
              Tab(
                icon: Icon(Icons.circle_notifications, color: Colors.white),
              ),
              Tab(
                icon: Icon(Icons.pix, color: Colors.white),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(
              child: Pagepersonnelle(userID: widget.userID),
            ),
            Scaffold(
              body: Center(
                child: Service(userID: widget.userID),
              ),
              floatingActionButton: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: _makePhoneCall,
                    tooltip: 'اتصل',
                    child: const Icon(Icons.phone),
                  ),
                  const SizedBox(width: 10), // مسافة أفقية بين الزر والنص
                  Text(
                    "Contactez-nous en cas d'urgence",
                    style: const TextStyle(
                      fontSize: 16, // حجم النص
                      color: Colors.black, // لون النص
                    ),
                  ),
                ],
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            ),
            Center(
              child: Notifications(userID: widget.userID),
            ),
            Center(
              child: Prix(userID: widget.userID),
            ),
          ],
        ),
      ),
    );
  }
}
