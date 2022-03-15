part of 'services.dart';

class AuthServices {
  late SharedPreferences sharedPreferences;

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

  Future<UserModel> getUserProfile() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var finalToken = sharedPreferences.getString("token");

    var url = Uri.parse(baseUrl + 'auth/user-profile');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $finalToken',
    };

    var response = await http.get(
      url,
      headers: headers,
    );

     if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['user'];
      late UserModel user = UserModel.fromJson(data);
      user.name = data['name'];
      user.email = data['email'];

      return user;
    } else {
      throw Exception('Gagal Get Data User Profile');
    }
  }

  Future<ListPatientModel> getDataUser() async {
    sharedPreferences = await SharedPreferences.getInstance();
    var finalToken = sharedPreferences.getString("token");

    var url = Uri.parse(baseUrl + 'auth/user-profile');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $finalToken',
    };

    var response = await http.get(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['user'];
      late ListPatientModel profile = ListPatientModel.fromJson(data);

      return profile;
    }
    throw Exception('Gagal Dapatkan Data');
  }
}
