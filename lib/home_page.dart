import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kumarsinghapi/model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Model> users = [];

  void fetchUsers() async {
    const url = 'https://randomuser.me/api/?results=100';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final result = json['results'] as List<dynamic>;
    final transformed = result.map((e) {
      return Model(
        email: e['email']??"hello",
        country: e['country']??"hello",
        image: e['picture']['medium']??"hello",
      );
    }).toList();
    setState(() {
      users=transformed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random users'),
      ),
      body:  ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            return ListTile(
              subtitle: Text(user.country??""),
              title: Text(
                user.email,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
              leading: CircleAvatar(
                child: Image.network(
                  user.image,
                  fit: BoxFit.cover,
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: fetchUsers,
      ),

    );
  }
}
