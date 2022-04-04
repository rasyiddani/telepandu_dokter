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

  /////////////////////////////////////////////////////////////////////

  ConsultModels? _skip;

  ConsultModels? get skip => _skip;

  set skip(ConsultModels? skip) {
    _skip = skip;
    notifyListeners();
  }

  Future<bool> skipQueue(id) async {
    try {
      ConsultModels skip = await ConsultServices().skipQueue(id);

      _skip = skip;
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> makeWaitIntructions(id) async {
    try {
      ConsultModels accept = await ConsultServices().makeWaitIntructions(id);

      _accept = accept;
      return true;
    } catch (e) {
      return false;
    }
  }

  //////////////////////////////////////////////////////////////////////////////


  Future<bool> followUpConsult(id) async {
    try {
      await ConsultServices().followUpConsult(id);

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
      ConsultModels end = await ConsultServices().endConsult(id);

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

  Future<bool> makeInstructions(
      int? id,
      String? instructions,
      List? diseases,
      bool? resepObat,
      bool? rujukanBpjs,
      bool? suratKeterangan,
      bool? butuhTesLab,
      String? date) async {
    try {
      print(id);
      print(resepObat);
      ConsultModels instruction = await ConsultServices().makeInstructions(
          id,
          instructions,
          diseases,
          resepObat,
          rujukanBpjs,
          suratKeterangan,
          butuhTesLab,
          date);

      _instruction = instruction;
      return true;
    } catch (e) {
      return false;
    }
  }
}
