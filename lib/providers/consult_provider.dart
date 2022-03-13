part of 'providers.dart';

class ConsultProviders with ChangeNotifier {
  ConsultModels? _accept;

  ConsultModels? get accept => _accept;

  set accept(ConsultModels? accept) {
    _accept = accept;
    notifyListeners();
  }

  Future<bool> acceptConsult(id) async {
    try {
      ConsultModels accept = await ConsultServices().acceptConsult(id);

      _accept = accept;
      return true;
    } catch (e) {
      return false;
    }
  }

  //////////////////////////////////////////////////////////////////////////////

  ConsultModels? _end;

  ConsultModels? get end => _end;

  set end(ConsultModels? end) {
    _end = end;
    notifyListeners();
  }

  Future<bool> endConsult(id) async {
    try {
      ConsultModels end = await ConsultServices().acceptConsult(id);

      _end = end;
      return true;
    } catch (e) {
      return false;
    }
  }

  //////////////////////////////////////////////////////////////////////////////

  ConsultModels? _instruction;

  ConsultModels? get instruction => _instruction;

  set instruction(ConsultModels? instruction) {
    _instruction = instruction;
    notifyListeners();
  }

  Future<bool> makeInstructions(id, instructions, diseases,
      needMedicalCertificate, needReferralLetter) async {
    try {
      ConsultModels instruction = await ConsultServices().makeInstructions(id,
          instructions, diseases, needMedicalCertificate, needReferralLetter);

      _instruction = instruction;
      return true;
    } catch (e) {
      return false;
    }
  }
}
