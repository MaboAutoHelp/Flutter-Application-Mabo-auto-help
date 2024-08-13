import 'package:flutter/material.dart';
import 'package:mabo_auto_help/view/PagePersonnelle.dart';
import 'package:mabo_auto_help/view/Service.dart';
import 'package:mabo_auto_help/view/notifications.dart';

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
      length: 3,
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
          ],
        ),
      ),
    );
  }
}
