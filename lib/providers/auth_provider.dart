part of 'providers.dart';

class AuthProvider with ChangeNotifier {
  late UserModel _user;

  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> login({
    String? email,
    String? password,
  }) async {
    try {
      UserModel user = await AuthServices().login(
        email: email,
        password: password,
      );

      _user = user;
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> refreshToken() async {
    try {
      UserModel user = await AuthServices().refreshToken();

      _user = user;
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> logout() async {
    try {
      UserModel user = await AuthServices().logout();

      _user = user;
      return true;
    } catch (e) {
      return false;
    }
  }
}
