part of 'providers.dart';

class MessagesProvider with ChangeNotifier {
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

  //////////////////////////////////////////////////////////////////////

  MessagesModels? _addQuick;

  MessagesModels? get addQuick => _addQuick;

  set addQuick(MessagesModels? addQuick) {
    _addQuick = addQuick;
    notifyListeners();
  }

  Future<bool> addQuickMessage({
    String? title,
    String? desc,
  }) async {
    try {
      MessagesModels addQuick = await MessagesServices().addQuickMessage(
        title: title,
        desc: desc,
      );

      _addQuick = addQuick;
      return true;
    } catch (e) {
      return false;
    }
  }
}
