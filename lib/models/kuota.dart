part of 'models.dart';

class KuotaModel {
  int? queuNow;
  int? queue;
  int? queueTotal;

  KuotaModel({
    required this.queuNow,
    required this.queue,
    required this.queueTotal,
  });

  KuotaModel.fromJson(Map<String, dynamic> json) {
    queuNow = json['antrian_saat_ini'] ?? 0;
    queue = json['jumlah_antrian'] ?? 0;
    queueTotal = json['kuota'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    return {
      'antrian_saat_ini': queuNow,
      'jumlah_antrian': queue,
      'kuota': queueTotal,
    };
  }
}
