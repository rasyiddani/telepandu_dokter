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

    print("Hasil cek user: ${response.statusCode}");
    print("Hasil cek user: ${response.body}");


    if (response.statusCode == 200) {
      print("password berhasil diupdate");
      return true;
    } else {
      print("password gagal diupdate");
      return false;
    }
  }
}
