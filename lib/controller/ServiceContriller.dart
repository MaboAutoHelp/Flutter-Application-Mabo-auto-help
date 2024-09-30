import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ServiceController {
  static var por = "19";
  Future SubmitServiceRequest(BuildContext context, String userID, String name ,String tel, String serviceName, DateTime date, TimeOfDay time, String carType,String lieu, int prix) async {
    var url = "http://192.168.1.$por:8000/Service/registerService";
    var response = await http.post(
      Uri.parse(url),
      body: jsonEncode(<String, String>{
        'userID': userID,
        'name':name,
        'teluser':tel,
        'serviceName': serviceName,
        'date': date.toIso8601String(),
        'time': time.format(context),
        'carType': carType,
        'lieu': lieu,
        'prix': prix.toString(),
      }),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Failed to submit service request');
    }
  }
}
