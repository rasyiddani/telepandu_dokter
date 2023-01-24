part of 'services.dart';

class ResetPasswordService {
  static Future<bool> resetPassword(String email, String newPassword) async {
    var headerObject = {
      'Content-type': 'application/json',
    };
    var bodyObject = jsonEncode({'email': email, 'new_password': newPassword});

    String resetPassword = baseUrl + 'auth/reset-password';

    var response = await http.post(Uri.parse(resetPassword),
        headers: headerObject, body: bodyObject);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
