part of 'models.dart';

class UserModel {
  int? id;
  String? name;
  String? userName;
  String? password;
  String? phone;
  String? otp;
  String? email;
  String? sip;
  String? branch;
  late String token;

  UserModel({
    required this.id,
    required this.name,
    required this.userName,
    required this.password,
    required this.phone,
    required this.otp,
    required this.email,
    required this.sip,
    required this.branch,
    required this.token,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    userName = json['userName'];
    password = json['password'];
    phone = json['phone'];
    otp = json['otp'];
    email = json['email'];
    sip = json['sip'];
    branch = json['occupation'];
    token = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'userName': userName,
      'password': password,
      'phone': phone,
      'otp': otp,
      'email': email,
      'sip' : sip,
      'occupation' : branch,
      'access_token': token,
    };
  }
}