import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? cnic;
  String? email;
  String? name;
  DateTime? createdAt;
  String? token;

  UserModel({this.cnic, this.email, this.name, this.createdAt, this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    cnic = json['cnic'];
    email = json['email'];
    name = json['name'];
    createdAt = (json['createdAt'] as Timestamp).toDate();
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cnic'] = cnic;
    data['email'] = email;
    data['name'] = name;
    data['createdAt'] =
        createdAt != null ? Timestamp.fromDate(createdAt!) : null;
    data['token'] = token;
    return data;
  }
}
