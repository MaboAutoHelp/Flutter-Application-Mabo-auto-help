import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  final String userID;
  const Notifications({super.key,required this.userID});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: Text('User ID: ${widget.userID}'),
    );
  }
}