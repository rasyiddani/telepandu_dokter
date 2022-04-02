part of 'services.dart';

class ChatService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

   Stream<List<ChatModel>> getMessagesByDoctorId({int? userId}) {
    try {
      return firestore
          .collection('chat')
          .where('userId', isEqualTo: userId)
          .snapshots()
          .map((QuerySnapshot list) {
        var result = list.docs.map<ChatModel>((DocumentSnapshot message) {
          print(message.data());
          return ChatModel.fromJson(message.data() as Map<String, dynamic>);
        }).toList();

        result.sort(
          (ChatModel a, ChatModel b) =>
              a.createdAt!.compareTo(b.createdAt!),
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
    bool? isDoctor,
  }) async {
    try {
      firestore.collection('chat').add({
        'userId': user?.userId,
        'userName': user?.name,
        'isDoctor': isDoctor,
        'message': message,
        'createdAt': DateTime.now().toString(),
        'updatedAt': DateTime.now().toString(),
      }).then((value) => print("Chat berhasil disimpan!!"));
    } catch (e) {
      throw Exception(e);
    }
  }
}
