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

  /////////////////////////////////////////////////////////////////////////////////
  
  MessagesModels? _dataQuickMessage;

  MessagesModels? get dataQuickMessage => _dataQuickMessage;

  set dataQuickMessage(MessagesModels? dataQuickMessage) {
    _dataQuickMessage = dataQuickMessage;
    notifyListeners();
  }

  Future<void> getDataQuickMessage(id) async {
    try {
      MessagesModels dataQuickMessage =
          await MessagesServices().getDataQuickMessage(id);

      _dataQuickMessage = dataQuickMessage;
    } catch (e) {
      throw Exception(e);
    }
  }

  //////////////////////////////////////////////////////////////////////////////////
  
   Future<bool> editQuickMessage({
    String? title,
    String? desc,
    int? id,
  }) async {
    try {
      await MessagesServices().editQuickMessage(
        title: title,
        desc: desc,
        id: id,
      );

      return true;
    } catch (e) {
      return false;
    }
  }
}
