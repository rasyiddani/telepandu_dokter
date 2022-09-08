// ignore_for_file: avoid_print

part of 'providers.dart';

class ListPatientProvider with ChangeNotifier {
  ListPatientProvider(BuildContext context);
  /////////////////////////////////////////////////////////
  ListPatientModel? _queue;

  ListPatientModel? get queue => _queue;

  set queue(ListPatientModel? queue) {
    _queue = queue;
    notifyListeners();
  }

  Future<void> getDataQueue() async {
    try {
      ListPatientModel queue =
          await ListPatientServices().getDataQueue();

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

  List<ListPatientModel> _listMonth = [];
  List<ListPatientModel> get listMonth => _listMonth;

  set listMonth(List<ListPatientModel> listMonth) {
    _listMonth = listMonth;
    notifyListeners();
  }

  Future<void> getListMonth(date) async {
    try {
      List<ListPatientModel> listMonth =
          await ListPatientServices().getDataListMonth(date);

      _listMonth = listMonth;
    } catch (e) {
      print(e);
    }
  }

  /////////////////////////////////////////////////////////////
  KuotaModel? _kuota;
  KuotaModel? get kuota => _kuota; 

  Future<void> ambilDataKuota() async {
    try {
      KuotaModel kuota = await ListPatientServices().getDataKuota();
      _kuota = kuota;
    } catch (e) {
      print("pesan error");
      print(e);
    }
    notifyListeners();
  }
}
