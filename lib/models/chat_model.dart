part of 'models.dart';

class ChatModel {
  String? message;
  int? userId;
  String? userName;
  bool? isDoctor;
  DateTime? createdAt;
  DateTime? updatedAt;

  ChatModel({
    required this.message,
    required this.userId,
    required this.userName,
    required this.isDoctor,
    required this.createdAt,
    required this.updatedAt,
  });

  ChatModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    userId = json['id'];
    userName = json['name'];
    isDoctor = json['isDoctor'];
    createdAt = DateTime.parse(json['createdAt']);
    updatedAt = DateTime.parse(json['updatedAt']);
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'id': userId,
      'userName': userName,
      'isDoctor': isDoctor,
      'createdAt': createdAt.toString(),
      'updatedAt': updatedAt.toString()
    };
  }
}
