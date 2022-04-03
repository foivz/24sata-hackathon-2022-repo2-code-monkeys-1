import 'package:decimal/decimal.dart';
import 'package:monkey/util/utility.dart';

import 'group.dart';

class User {
  String id;
  String name;
  String email;
  String photoUrl;
  double balance;

  User(
      [this.id = '',
      this.name = '',
      this.email = '',
      this.photoUrl = '',
      this.balance = 0]);

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'photoUrl': photoUrl,
        'balance': balance,
      };

  static User fromJson(Map<String, dynamic> json) => User(
        json['id'],
        json['name'],
        json['email'],
        json['photoUrl'],
        json['groupId'],
      );
}
