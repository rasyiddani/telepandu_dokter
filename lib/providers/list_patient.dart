// ignore_for_file: avoid_print

part of 'providers.dart';

class ListPatientProvider with ChangeNotifier {
  /////////////////////////////////////////////////////////
  ListPatientModel? _queue;

  ListPatientModel? get queue => _queue;

  set queue(ListPatientModel? queue) {
    _queue = queue;
    notifyListeners();
  }

  Future<void> getDataQueue(context) async {
    try {
      ListPatientModel queue = await ListPatientServices().getDataQueue(context);

      _queue = queue;
      
    } catch (e) {
      print(e);
    }
  }

  ////////////////////////////////////////////////////////////////

  List<ListPatientModel> _listToday = [];
  List<ListPatientModel> get listToday => _listToday;

  set listToday(List<ListPatientModel> listToday) {
    _listToday = listToday;
    notifyListeners();
  }

  Future<void> getListToday(context) async {
    try {
      List<ListPatientModel> listToday =
          await ListPatientServices().getDataListToday(context);

      _listToday = listToday;
    } catch (e) {
      print(e);
    }
  }

  ////////////////////////////////////////////////////////////
}
