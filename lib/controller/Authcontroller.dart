import 'dart:convert';

import 'package:http/http.dart' as http;

class Authcontroller {
  Future LoginAuth(email, pwd) async {
    var url = "http://192.168.1.21:8000/admin/login";
    var response = await http.post(Uri.parse(url),
        body: jsonEncode(<String, String>{'username': email, 'password': pwd}),
        headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    }
  }
  Future SignupAuth(name ,email, pwd,tel) async {
    var url = "http://192.168.1.21:8000/users/register";
    var response = await http.post(Uri.parse(url),
        body: jsonEncode(<String, String>{
          'name': name,
          'email': email,
        
          'pwd': pwd,
          'tel':tel
           }), headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    }
}
}