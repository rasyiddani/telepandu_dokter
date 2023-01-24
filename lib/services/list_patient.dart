part of 'services.dart';

class ListPatientServices {
  late SharedPreferences sharedPreferences;

  Future<ListPatientModel> getDataQueue() async {
    sharedPreferences = await SharedPreferences.getInstance();
    var finalToken = sharedPreferences.getString("token");

    var url = Uri.parse(baseUrl + 'ambil-list-pasien-konsul');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $finalToken',
    };

    var response = await http.get(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      ListPatientModel queue = ListPatientModel.fromJson(data);
      queue.queu = data['jumlah_antrian'];
      queue.queueTotal = data['kuota'];

      return queue;
    }
    throw Exception('Gagal Dapatkan Data');
  }

  Future<KuotaModel> getDataKuota() async {
    sharedPreferences = await SharedPreferences.getInstance();
    var finalToken = sharedPreferences.getString("token");

    var url = Uri.parse(baseUrl + 'ambil-list-pasien-konsul');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $finalToken',
    };

    var response = await http.get(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      KuotaModel queue = KuotaModel.fromJson(data);

      return queue;
    }
    throw Exception('Gagal Dapatkan Data');
  }

  Future<List<ListPatientModel>> getDataListToday(context) async {
    sharedPreferences = await SharedPreferences.getInstance();
    var finalToken = sharedPreferences.getString("token");

    var url = Uri.parse(baseUrl + 'ambil-list-pasien-konsul');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $finalToken',
    };

    var response = await http.get(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['antrian'];
      List<ListPatientModel> listToday = [];
      for (var item in data) {
        listToday.add(ListPatientModel.fromJson(item));
      }

      return listToday;
    }if (response.statusCode == 204) {
      throw Exception('Belum Ada Antrian Pasien');
    }
    if (response.statusCode == 400) {
      await Provider.of<AuthProvider>(context, listen: false).refreshToken();
      await Provider.of<ListPatientServices>(context, listen: false)
          .getDataListToday(context);
      throw Exception('Token Refresh');
    } else {
      throw Exception('Gagal Dapatkan Data');
    }
  }

  Future<List<ListPatientModel>> getDataListMonth(date) async {
    sharedPreferences = await SharedPreferences.getInstance();
    var finalToken = sharedPreferences.getString("token");

    var url = Uri.parse(baseUrl + 'jadwal-saya-tanggal');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $finalToken',
    };
    var body = jsonEncode({
      'date': date,
    });

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['jadwal'];
      List<ListPatientModel> listMonth = [];
      for (var item in data) {
        listMonth.add(ListPatientModel.fromJson(item));
      }

      return listMonth;
    } else if (response.statusCode == 204) {
      List<ListPatientModel> listMonth = [];

      return listMonth;
    } else {
      throw Exception('Gagal Dapatkan Data');
    }
  }
}
