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
  
  MessagesModels? _editQuick;

  MessagesModels? get editQuick => _editQuick;

  set editQuick(MessagesModels? editQuick) {
    _editQuick = editQuick;
    notifyListeners();
  }

   Future<bool> editQuickMessage({
    String? title,
    String? desc,
    int? id,
  }) async {
    try {
      MessagesModels editQuick = await MessagesServices().editQuickMessage(
        title: title,
        desc: desc,
        id: id,
      );

      _editQuick = editQuick;

      return true;
    } catch (e) {
      return false;
    }
  }

  ///////////////////////////////////////////////////////////////////
  
  MessagesModels? _deleteQuick;

  MessagesModels? get deleteQuick => _deleteQuick;

  set deleteQuick(MessagesModels? deleteQuick) {
    _deleteQuick = deleteQuick;
    notifyListeners();
  }

   Future<bool> deleteQuickMessage({
    String? title,
    String? desc,
    int? id,
  }) async {
    try {
      MessagesModels deleteQuick = await MessagesServices().deleteQuickMessage(
        id: id,
      );

      _deleteQuick = deleteQuick;

      return true;
    } catch (e) {
      return false;
    }
  }

  /////////////////////////////////////////////////////////////////////
  
   List<MessagesModels> _diseases = [];
  List<MessagesModels> get diseases => _diseases;

  set diseases(List<MessagesModels> diseases) {
    _diseases = diseases;
    notifyListeners();
  }

  Future<void> getDiseases() async {
    try {
      List<MessagesModels> diseases =
          await MessagesServices().getDiseases();

      _diseases = diseases;
    } catch (e) {
      throw Exception(e);
    }
  }
}
