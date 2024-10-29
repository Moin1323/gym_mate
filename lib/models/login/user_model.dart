import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? uid;
  String? cnic;
  String? email;
  String? name;
  DateTime? createdAt;
  String? token;
  String? role; // New role field

  UserModel(
      {this.uid,
      this.cnic,
      this.email,
      this.name,
      this.createdAt,
      this.token,
      this.role});

  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    cnic = json['cnic'];
    email = json['email'];
    name = json['name'];
    createdAt = (json['createdAt'] as Timestamp).toDate();
    token = json['token'];
    role = json['role']; // Parse role from JSON
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['cnic'] = cnic;
    data['email'] = email;
    data['name'] = name;
    data['createdAt'] =
        createdAt != null ? Timestamp.fromDate(createdAt!) : null;
    data['token'] = token;
    data['role'] = role; // Add role to JSON
    return data;
  }
}
