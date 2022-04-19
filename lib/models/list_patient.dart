part of 'models.dart';

class ListPatientModel {
  int? id;
  int? userId;
  String? name;
  String? email;
  String? sip;
  String? branch;
  String? status;
  String? photo;
  int? queueNumber;
  int? age;
  String? phone;
  String? gender;
  int? queueTotal;
  int? queuNow;
  int? queu;
  String? statusCode;

  ListPatientModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.email,
    required this.sip,
    required this.branch,
    required this.status,
    required this.photo,
    required this.queueNumber,
    required this.age,
    required this.phone,
    required this.gender,
    required this.queueTotal,
    required this.queuNow,
    required this.queu,
    required this.statusCode,
  });

  ListPatientModel.fromJson(Map<String, dynamic> json) {
    id = json['consult_log_id'];
    userId = json['doctor_type_id'];
    name = json['name'];
    email = json['email'];
    sip = json['sip'];
    photo = json['image'];
    status = json['status'];
    branch = json['occupation'];
    queueNumber = json['queue_number'];
    age = json['age'];
    phone = json['phone'];
    gender = json['sex'];
    queueTotal = json['kuota'];
    queuNow = json['antrian_saat_ini'];
    queu = json['jumlah_antrian'];
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    return {
      'consult_log_id': id,
      'doctor_type_id': userId,
      'name': name,
      'email': email,
      'sip': sip,
      'image' : photo,
      'occupation': branch,
      'queue_number': queueNumber,
      'status': status,
      'age': age,
      'phone': phone,
      'sex': gender,
      'kuota': queueTotal,
      'antrian_saat_ini': queuNow,
      'jumlah_antrian': queu,
    };
  }
}
