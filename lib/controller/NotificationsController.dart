import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Notificationscontroller {
  static var por = "18";
  static Future<List> getNotifications(String userID) async {
    var url = "http://192.168.1.$por:8000/Service/getAllService/$userID";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      //print("Response Data: ${response.body}");
      return json.decode(response.body);
    } else {
      // print("Error: ${response.statusCode}");
      throw Exception('Failed to load notifications');
    }
  }

  static Future<void> updateService(String id, String ita) async {
    var url = "http://192.168.1.$por:8000/Service/updateService/$id";
    var response = await http.put(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'ita': ita}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update service');
    }
  }
  static Future<void> getServiceID(String id) async {
    var url = "http://192.168.1.$por:8000/Service/getServiceID/$id";
    var response = await http.get(
      Uri.parse(url),
      
      
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update service');
    }
  }
  //getAllServicesReparation
  static Future<List> getAllServicesReparation(String userID) async {
    var url = "http://192.168.1.$por:8000/Service/getAllServicesReparation/$userID";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      //print("Response Data: ${response.body}");
      return json.decode(response.body);
    } else {
      // print("Error: ${response.statusCode}");
      throw Exception('Failed to load notifications');
    }
  }

}

/*class Notificationscontroller {
  static Future<List> getNotifications(String userID) async {
    var url = "http://192.168.1.17:8000/Service/getAllService/$userID";
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        print("Response Data: ${response.body}");
        return json.decode(response.body);
      } else {
        print("Error: ${response.statusCode}");
        throw Exception('Failed to load notifications');
      }
    } catch (e) {
      print("Exception: $e");
      throw Exception('Failed to load notifications');
    }
  }*/
