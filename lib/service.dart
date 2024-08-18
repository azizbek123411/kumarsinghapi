import 'dart:convert';
import 'package:http/http.dart'as http;

import 'model.dart';

class ApiService{

 static Future<List<Model>> fetchUsers() async {
    const url = 'https://randomuser.me/api/?results=100';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final result = json['results'] as List<dynamic>;
    final users = result.map((e) {
      return Model(
        email: e['email']??"hello",
        country: e['phone']??"hello",
        image: e['picture']['medium']??"hello",
        nameTitle: e['name']['title']??"John Wick",
        firstName: e['name']['first']??"John Wick",
        lastName: e['name']['last']??"John Wick",
      );
    }).toList();
  return users;
  }
}