
import 'package:flutter/material.dart';
import 'package:untitled1/model/user.dart';
import 'package:untitled1/services/user_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];

  @override
  void initState(){
    super.initState();
    fetchUsers();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Calling'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            return ListTile(
              title: Text('${index + 1}.${user.fullname}'),
              subtitle: Text(user.phone),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fetchUsers();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
  Future<void> fetchUsers()async{
    final response = await UserApi.fetchUsers();
    setState(() {
      users = response;
    });
  }
}
