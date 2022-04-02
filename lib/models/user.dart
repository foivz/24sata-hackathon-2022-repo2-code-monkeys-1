import 'package:decimal/decimal.dart';
import 'package:monkey/util/utility.dart';

import 'group.dart';

class User {
  String id;
  String name;
  String email;
  String photoUrl;
  String groupId;
  Group group = Group('', Decimal.zero, List.empty(), List.empty(),
  List.empty(), false);

  User(
      [this.id = '',
      this.name = '',
      this.email = '',
      this.photoUrl = '',
      this.groupId = '']) {
    try {
      if (Utility.groupList.where((element) => element.uid == groupId).isNotEmpty)
        group = Utility.groupList.where((element) => element.uid == groupId).first;
    } catch (e) {}
    
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'photoUrl': photoUrl,
        'groupId': groupId,
      };

  static User fromJson(Map<String, dynamic> json) => User(
        json['id'],
        json['name'],
        json['email'],
        json['photoUrl'],
        json['groupId'],
      );
}
