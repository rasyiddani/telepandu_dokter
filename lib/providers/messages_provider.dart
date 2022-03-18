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
      throw Exception(e);
    }
  }

  //////////////////////////////////////////////////////////////////////

  Future<bool> addQuickMessage({
    String? title,
    String? desc,
  }) async {
    try {
      await MessagesServices().addQuickMessage(
        title: title,
        desc: desc,
      );

      return true;
    } catch (e) {
      return false;
    }
  }

  MessagesModels? _dataQuickMessage;

  MessagesModels? get dataQuickMessage => _dataQuickMessage;

  set dataQuickMessage(MessagesModels? dataQuickMessage) {
    _dataQuickMessage = dataQuickMessage;
    notifyListeners();
  }

  Future<void> getUserProfile(id) async {
    try {
      MessagesModels dataQuickMessage =
          await MessagesServices().getDataQuickMessage(id);

      _dataQuickMessage = dataQuickMessage;
    } catch (e) {
      throw Exception(e);
    }
  }
}
