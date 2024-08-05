import 'dart:convert';
import 'package:http/http.dart' as http;

class PagepersonnelleContriller {
  Future<Map<String, dynamic>> GetUser(String userID) async {
    var url = "http://192.168.1.21:8000/users/getUser/$userID";
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as Map<String, dynamic>;
      return data;
    } else {
      throw Exception('Failed to load user data');
    }
  }

  Future<bool> UpdateUser(String userID, Map<String, String> userData) async {
    var url = "http://192.168.1.21:8000/users/updateUser/$userID";
    var response = await http.put(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(userData),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
