part of 'models.dart';

class MessagesModels {
  late int id;
  String? title;
  String? desc;
  String? name;

  MessagesModels({
    required this.id,
    required this.title,
    required this.desc,
    required this.name,
  });

  MessagesModels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    desc = json['detail'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'detail': desc,
      'name' : name,
    };
  }
}
