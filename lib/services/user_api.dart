import 'dart:convert';
import 'package:untitled1/model/username.dart';
import 'package:http/http.dart' as http;

import '../model/user.dart';

class UserApi{
  static Future<List<User>> fetchUsers() async {
    print('called');
    const url = 'https://randomuser.me/api/?results=100';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final users = results.map((e) {
      final name = UserName(
        title: e['name']['title'],
        first: e['name']['first'],
        last: e['name']['last'],
      );
      return User(
        cell: e['cell'],
        email: e['email'],
        gender: e['nat'],
        phone: e['phone'],
        nat: e['nat'],
        name: name,
      );
    }).toList();
    return users;
    print('fetchUsers completed');
  }
}