part of 'services.dart';

class MessagesServices {
  late SharedPreferences sharedPreferences;

  Future<List<ListPatientModel>> getQuickMessages(context) async {
    sharedPreferences = await SharedPreferences.getInstance();
    var finalToken = sharedPreferences.getString("token");

    var url = Uri.parse(baseUrl + 'quick-messages');
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
      List<ListPatientModel> listQuickMessages = [];
      for (var item in data) {
        listQuickMessages.add(ListPatientModel.fromJson(item));
      }

      return listQuickMessages;
    } else {
      throw Exception('Gagal Dapatkan Data');
    }
  }
}
