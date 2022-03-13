part of 'models.dart';

class MessagesModels {
  int? id;
  String? title;
  String? desc;

  MessagesModels({
    required this.id,
    required this.title,
    required this.desc,
  });

  MessagesModels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    desc = json['desc'];
  }
}