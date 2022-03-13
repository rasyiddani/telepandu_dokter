// ignore_for_file: avoid_print

part of 'providers.dart';

class AuthProvider with ChangeNotifier {
  UserModel? _user;

  UserModel? get user => _user;

  set user(UserModel? user) {
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

  /////////////////////////////////////////////////////////////

  ListPatientModel? _profile;

  ListPatientModel? get profile => _profile;

  set profile(ListPatientModel? profile) {
    _profile = profile;
    notifyListeners();
  }

  Future<void> getUserProfile() async {
    try {
      ListPatientModel profile = await AuthServices().getDataUser();

      _profile = profile;
      
    } catch (e) {
      print(e);
    }
  }
}
