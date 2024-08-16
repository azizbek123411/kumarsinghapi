import 'package:flutter/material.dart';
import 'package:kumarsinghapi/api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random users'),
      ),
      body: FutureBuilder(
        future: ApiService.getData(),
        builder: (BuildContext context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          }else if(snapshot.hasError){
            return Center(child: Text(snapshot.error.toString()));
          }else{
            return ListView.builder(
                itemCount: 6,
                itemBuilder: (context,index){
              return ListTile(
                title: Text(snapshot.stackTrace.toString()),
              );
            });
          }
        },
      ),
    );
  }
}
