import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> users = [];

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
            final email = user['email'];
            final firstname = user['name']['first'];
            final lastname = user['name']['last'];
            final name = '$firstname $lastname';
            final picture = user['picture']['large'];
            final gender = user['gender'];
            final int ind = index +1;
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(picture),

                radius: 25.0,
              ),
              // tileColor: Colors.black,
              title: Text('$ind. $name - $gender'),
              subtitle: Text(email),
            );
          },
        ),
      ),
      /*bottomNavigationBar: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('TO 1st page'),
              ),
            ),
          ),
        ],
      ),*/
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fetchUsers();
        },
        child: const Icon(Icons.refresh),
      ),

    );
  }


  void fetchUsers() async {
    print('called');
    const url = 'https://randomuser.me/api/?results=100';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      users = json['results'];
    });
    print('fetchUsers completed');
  }
}

