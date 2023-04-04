import 'package:untitled1/model/username.dart';

class User{
  late final String gender;
  late final String email;
  late final String phone;
  late final String cell;
  late final String nat;
  late final UserName name;

  User({
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.nat,
    required this.name,
});
  String get fullname{
    return '${name.title} ${name.first} ${name.last}';
  }
}