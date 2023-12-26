import 'dart:convert';

class UserBase {
  int id;
  final String name;

  final int? age;

  UserBase({required this.id, required this.name, this.age});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'age': age,
    };
  }

  factory UserBase.fromMap(Map<String, dynamic> map) {
    return UserBase(
      id: map['id'],
      name: map['name'] as String,
      age: map['age'] != null ? map['age'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserBase.fromJson(String source) =>
      UserBase.fromMap(json.decode(source) as Map<String, dynamic>);
}
