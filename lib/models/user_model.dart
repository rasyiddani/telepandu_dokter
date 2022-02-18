part of 'models.dart';

class UserModel {
  int? id;
  String? name;
  String? userName;
  String? email;
  String? password;
  String? phone;
  String? otp;
  late String token;

  UserModel({
    required this.id,
    required this.name,
    required this.userName,
    required this.email,
    required this.password,
    required this.phone,
    required this.otp,
    required this.token,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    otp = json['otp'];
    token = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'userName': userName,
      'email': email,
      'password': password,
      'phone': phone,
      'otp': otp,
      'access_token': token,
    };
  }
}