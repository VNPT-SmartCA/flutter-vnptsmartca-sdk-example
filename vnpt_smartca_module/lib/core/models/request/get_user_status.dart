import 'dart:convert';

class UserStatusRequest {
  final String uid;
  UserStatusRequest({required this.uid});

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
    };
  }

  String toJson() => json.encode(toMap());
}
