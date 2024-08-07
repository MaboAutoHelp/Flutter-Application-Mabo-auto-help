import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Notificationscontroller {
  static Future<List> getNotifications(String userID) async {
    var url = "http://192.168.1.21:8000/Service/getAllService/$userID";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load notifications');
    }
  }
}
