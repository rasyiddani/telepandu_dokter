part of 'models.dart';

class ListPatientModel {
  int? id;
  String? name;
  int? queueNumber;
  int? age;
  String? phone;
  String? gender;
  int? queueTotal;
  int? queuNow;
  int? queu;

  ListPatientModel({
    required this.id,
    required this.name,
    required this.queueNumber,
    required this.age,
    required this.phone,
    required this.gender,
    required this.queueTotal,
    required this.queuNow,
    required this.queu,
  });

  ListPatientModel.fromJson(Map<String, dynamic> json) {
    id = json['consult_log_id'];
    name = json['name'];
    queueNumber = json['queue_number'];
    age = json['age'];
    phone = json['phone'];
    gender = json['sex'];
    queueTotal = json['kuota'];
    queuNow = json['antrian_saat_ini'];
    queu = json['jumlah_antrian'];
  }

  Map<String, dynamic> toJson() {
    return {
      'consult_log_id': id,
      'name': name,
      'queue_number': queueNumber,
      'age': age,
      'phone' : phone,
      'sex': gender,
      'kuota': queueTotal,
      'antrian_saat_ini': queuNow,
      'jumlah_antrian' : queu,
    };
  }
}
