part of 'services.dart';

class AuthServices {
  Future<UserModel> login({
    String? email,
    String? password,
    String? role,
  }) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var url = Uri.parse(baseUrl + 'auth/login');
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      UserModel user = UserModel.fromJson(data);
      user.token = 'Bearer ' + data['access_token'];

      sharedPreferences.setString("token", data['access_token']);

      return user;
    } else {
      throw Exception('Gagal Login');
    }
  }

  Future<UserModel> refreshToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var finalToken = sharedPreferences.getString("token");

    var url = Uri.parse(baseUrl + 'auth/refresh');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $finalToken',
    };

    var response = await http.post(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      UserModel user = UserModel.fromJson(data);
      user.token = 'Bearer ' + data['access_token'];

      sharedPreferences.setString("token", data['access_token']);

      return user;
    } else {
      throw Exception('Gagal Login');
    }
  }

   Future<UserModel> logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var finalToken = sharedPreferences.getString("token");

    var url = Uri.parse(baseUrl + 'auth/logout');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $finalToken',
    };

    var response = await http.post(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      UserModel user = UserModel.fromJson(data);

      //delete token
      sharedPreferences.clear();

      return user;
    } else {
      throw Exception('Gagal Logout');
    }
  }
}
