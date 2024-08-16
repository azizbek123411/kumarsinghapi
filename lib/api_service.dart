import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:kumarsinghapi/model.dart';

class ApiService {
  static Future getData() async {
    List userList = [];
    final url = Uri.parse('https://randomuser.me/api/?results=1');
    final response = await get(url);
    log(userList.length.toString());
    if (response.statusCode == 200 && response.statusCode == 201) {
      userList.add(response.body);
    }
    final users = jsonDecode(response.body);
    for (final item in users) {
      try {
        userList.add(Model.fromJson(item));
      } catch (e, st) {
        log('error:', error: e, stackTrace: st);
      }
    }
  }
}
