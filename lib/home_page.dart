
import 'package:flutter/material.dart';
import 'package:kumarsinghapi/model.dart';
import 'package:kumarsinghapi/service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Model> users = [];
Future fetchUsers()async{
  final response=await ApiService.fetchUsers();
  setState(() {
    users=response;
  });
}
@override
  void initState() {
    super.initState();
    fetchUsers();
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
                user.fullName,
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


    );
  }
}
