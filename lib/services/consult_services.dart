part of 'services.dart';

class ConsultServices {
  late SharedPreferences sharedPreferences;

  Future<ConsultModels> acceptConsult(
    int? id,
  ) async {
    sharedPreferences = await SharedPreferences.getInstance();
    var finalToken = sharedPreferences.getString("token");

    var url = Uri.parse(baseUrl + 'terima-pasien-konsul');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $finalToken',
    };
    var body = jsonEncode({
      'consult_log_id': id,
    });

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.statusCode);

    if (response.statusCode == 202) {
      var data = jsonDecode(response.body);
      print(data);

      return data;
    } else {
      throw Exception('Gagal Aktivasi');
    }
  }

  Future<ConsultModels> endConsult(
    int? id,
  ) async {
    sharedPreferences = await SharedPreferences.getInstance();
    var finalToken = sharedPreferences.getString("token");

    var url = Uri.parse(baseUrl + 'konsul-selesai');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $finalToken',
    };
    var body = jsonEncode({
      'consult_log_id': id,
    });

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.statusCode);

    if (response.statusCode == 202) {
      var data = jsonDecode(response.body);
      print(data);

      return data;
    } else {
      throw Exception('Gagal End Consult');
    }
  }

   Future<ConsultModels> makeInstructions(
    int? id,
    String? instructions,
    Array? diseases,
    bool? needMedicalCertificate,
    bool? needReferralLetter,
  ) async {
    sharedPreferences = await SharedPreferences.getInstance();
    var finalToken = sharedPreferences.getString("token");

    var url = Uri.parse(baseUrl + 'buat-instruksi-dokter');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $finalToken',
    };
    var body = jsonEncode({
      'consult_log_id': id,
      'instruction': instructions,
      'diseases': [diseases],
      'need_medical_certificate ': needMedicalCertificate,
      'need_referral_letter ': needReferralLetter 
    });

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.statusCode);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);

      return data;
    } else {
      throw Exception('Gagal Kirim Data');
    }
  }
}