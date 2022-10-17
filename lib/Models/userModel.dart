import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String name;
  String email;
  String userId;
  String status;
  String employeImage;

  UserModel({
    required this.name,
    required this.email,
    required this.status,
    required this.userId,
    required this.employeImage,
  });
  factory UserModel.fromJson(DocumentSnapshot doc) => UserModel(
    name: (doc.data() as dynamic)["name"] ?? "",
    email: (doc.data() as dynamic)["email"] ?? "",
    status: (doc.data() as dynamic)["status"] ?? "",
    userId: (doc.data() as dynamic)["userId"] ?? "",
    employeImage: (doc.data() as dynamic)["employeImage"] ?? "",
  );
  static List<UserModel> jsonToListView(List<DocumentSnapshot> snapshot){

    return snapshot.map((e) => UserModel.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'status': status,
      'userId': userId,
      'employeImage': employeImage,

    };
  }
}

