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

    print('${response.statusCode} terima konsul');

    if (response.statusCode == 202) {
      var data = jsonDecode(response.body);
      print(data);
      late ConsultModels accept = ConsultModels.fromJson(data);

      return accept;
    } else {
      throw Exception('Gagal Aktivasi');
    }
  }

  Future<void> followUpConsult(
    int? id,
  ) async {
    sharedPreferences = await SharedPreferences.getInstance();
    var finalToken = sharedPreferences.getString("token");

    var url = Uri.parse(baseUrl + 'buat-pasien-menunggu-instruksi');
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
    print('${response.statusCode} lanjut follow up');

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
    } else {
      throw Exception('Gagal Follow Up Consult');
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
    print('${response.statusCode} konsul selesai');

    if (response.statusCode == 202) {
      var data = jsonDecode(response.body);
      print(data);

      return data;
    } else {
      throw Exception('Gagal End Consult');
    }
  }

  Future<ConsultModels> skipQueue(int id) async {
    sharedPreferences = await SharedPreferences.getInstance();
    var finalToken = sharedPreferences.getString("token");

    var url = Uri.parse(baseUrl + 'skip-pasien');
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

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      late ConsultModels skip = ConsultModels.fromJson(data);

      return skip;
    } else {
      throw Exception('Gagal Skip Queue');
    }
  }

  Future<ConsultModels> makeWaitIntructions(int id) async {
    sharedPreferences = await SharedPreferences.getInstance();
    var finalToken = sharedPreferences.getString("token");

    var url = Uri.parse(baseUrl + 'buat-pasien-menunggu-instruksi');
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

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      print(data);

      return data;
    } else {
      throw Exception('Gagal Make Wait Consult');
    }
  }

  Future<ConsultModels> makeInstructions(
    int? id,
    String? instructions,
    List? diseases,
    bool? resepObat,
    bool? rujukanBpjs,
    bool? suratKeterangan,
    bool? butuhTesLab,
    String? date,
  ) async {
    sharedPreferences = await SharedPreferences.getInstance();
    var finalToken = sharedPreferences.getString("token");

    var url = Uri.parse(baseUrl + 'check-list-dokter');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $finalToken',
    };
    var body = jsonEncode({
      'consult_log_id': id,
      'diseases': diseases,
      'instruction': instructions,
      'resep_obat': resepObat == true ? 1 : 0,
      'rujukan_bpjs': rujukanBpjs == true ? 1 : 0,
      'surat_keterangan': suratKeterangan == true ? 1 : 0,
      'butuh_tes_lab': butuhTesLab == true ? 1 : 0,
      'date': butuhTesLab == true ? date : null,
    });

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print("status buat intruksi: $resepObat");
    print("status buat intruksi: $body");

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);

      return data;
    } else {
      throw Exception('Gagal Kirim Data');
    }
  }
}
