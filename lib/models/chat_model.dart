part of 'models.dart';

class ChatModel {
  String? message;
  int? userId;
  String? userName;
  String? rules;
  String? room;
  DateTime? createdAt;
  DateTime? updatedAt;

  ChatModel({
    required this.message,
    required this.userId,
    required this.userName,
    required this.rules,
    required this.room,
    required this.createdAt,
    required this.updatedAt,
  });

  ChatModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    userId = json['id'];
    userName = json['name'];
    rules = json['rules'];
    room = json['room'];
    createdAt = DateTime.parse(json['createdAt']);
    updatedAt = DateTime.parse(json['updatedAt']);
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'id': userId,
      'userName': userName,
      'rules': rules,
      'room': room,
      'createdAt': createdAt.toString(),
      'updatedAt': updatedAt.toString()
    };
  }
}
