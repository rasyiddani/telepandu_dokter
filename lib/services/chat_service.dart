part of 'services.dart';

class ChatService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<List<ChatModel>> getMessagesByDoctorId(
      {String? room}) {
    try {
      return firestore
          .collection('chat')
          .where('room', isEqualTo: room)
          .snapshots()
          .map((QuerySnapshot list) {
        var result = list.docs.map<ChatModel>((DocumentSnapshot message) {
          return ChatModel.fromJson(message.data() as Map<String, dynamic>);
        }).toList();

        result.sort(
          (ChatModel a, ChatModel b) => a.createdAt!.compareTo(b.createdAt!),
        );

        return result;
      });
    } catch (e) {
      throw Exception('gagal');
    }
  }

  Future<void> addMessages({
    ListPatientModel? user,
    String? message,
    String? rules,
    String? room,
  }) async {
    try {
      firestore.collection('chat').add({
        'userId': user?.userId,
        'userName': user?.name,
        'rules': rules,
        'message': message,
        'room': room,
        'createdAt': DateTime.now().toString(),
      }).then((value) => print("Chat berhasil disimpan!!"));
    } catch (e) {
      throw Exception(e);
    }
  }
}
