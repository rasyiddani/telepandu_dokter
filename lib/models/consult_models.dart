part of 'models.dart';

class ConsultModels {
  int? id;
  String? name;
  int? queueNumber;
  int? age;
  String? phone;
  String? gender;
  String? tokenRtc;
  String? agoraAppId;
  String? chanelName;

  ConsultModels({
    required this.id,
    required this.name,
    required this.queueNumber,
    required this.age,
    required this.phone,
    required this.gender,
    required this.tokenRtc,
    required this.agoraAppId,
    required this.chanelName,
  });

  ConsultModels.fromJson(Map<String, dynamic> json) {
    id = json['consult_log_id'];
    name = json['name'];
    queueNumber = json['queue_number'];
    age = json['age'];
    phone = json['phone'];
    gender = json['sex'];
    tokenRtc = json['token'];
    agoraAppId = json['agora_app_id'];
    chanelName = json['channel_name'];
  }

  Map<String, dynamic> toJson() {
    return {
      'consult_log_id': id,
      'name': name,
      'queue_number': queueNumber,
      'age': age,
      'phone': phone,
      'sex': gender,
      'token': tokenRtc,
      'agora_app_id': agoraAppId,
      'channel_name': chanelName,
    };
  }
}
