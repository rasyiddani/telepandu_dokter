part of 'providers.dart';

class MessagesProvider with ChangeNotifier{

  List<MessagesModels> _quickMessages = [];
  List<MessagesModels> get quickMessages => _quickMessages;

  set quickMessages(List<MessagesModels> quickMessages) {
    _quickMessages = quickMessages;
    notifyListeners();
  }

  Future<void> getQuickMessages() async {
    try {
      List<MessagesModels> quickMessages =
          await MessagesServices().getQuickMessages();

      _quickMessages = quickMessages;
    } catch (e) {
      print(e);
    }
  }
}