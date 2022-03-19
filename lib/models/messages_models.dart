part of 'models.dart';

class MessagesModels {
  late int id;
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
    desc = json['detail'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'detail': desc,
    };
  }
}
