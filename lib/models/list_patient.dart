part of 'models.dart';

class ListPatientModel {
  int? id;
  String? name;
  int? queueNumber;
  String? age;
  String? gender;
  int? queueTotal;
  int? queuNow;

  ListPatientModel({
    required this.id,
    required this.name,
    required this.queueNumber,
    required this.age,
    required this.gender,
    required this.queueTotal,
    required this.queuNow,
  });

  ListPatientModel.fromJson(Map<String, dynamic> json) {
    id = json['consult_log_id'];
    name = json['name'];
    queueNumber = json['queue_number'];
    age = json['age'];
    gender = json['sex'];
    queueTotal = json['kuota'];
    queuNow = json['antrian_saat_ini'];
  }

  Map<String, dynamic> toJson() {
    return {
      'consult_log_id': id,
      'name': name,
      'queue_number': queueNumber,
      'age': age,
      'sex': gender,
      'kuota': queueTotal,
      'antrian_saat_ini': queuNow,
    };
  }
}
