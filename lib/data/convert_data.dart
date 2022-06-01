import 'dart:convert';


class User {
  final String name;
  final String email;

  User(this.name, this.email);

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
      };
}


Map<String, dynamic> userMap = jsonDecode('user.json');
var user = User.fromJson(userMap);

