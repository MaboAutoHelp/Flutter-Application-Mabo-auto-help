import 'dart:convert';
import 'package:http/http.dart' as http;

class ListServiceController {
  static var por = "18";
  Future ListService(String v) async {
    var url = "http://192.168.1.$por:8000/ListService/getVservice/$v";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    }
  }
}