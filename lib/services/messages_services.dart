part of 'services.dart';

class MessagesServices {
  late SharedPreferences sharedPreferences;

  Future<List<MessagesModels>> getQuickMessages() async {
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
      List data = jsonDecode(response.body)['quick_messages'];
      List<MessagesModels> quickMessages = [];
      for (var item in data) {
        quickMessages.add(MessagesModels.fromJson(item));
      }

      return quickMessages;
    } else {
      throw Exception('Gagal Dapatkan Data');
    }
  }
}
