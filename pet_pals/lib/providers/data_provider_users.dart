import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pet_pals/models/user.dart';

class UsersDataProvider {
  final _firestoreInstance = FirebaseFirestore.instance;

  // Obtener usuario por ID
  Future<User> getUserById(String id) async {
    DocumentSnapshot document = await _firestoreInstance.collection('users').doc(id).get();

    if (document.exists) {
      return User.fromDocument(document); 
    } else {
      throw Exception('User not found');
    }
  }

  // Editar usuario
  Future<void> updateUser(User user) async {
    await _firestoreInstance.collection('users').doc(user.id).update(user.toMap());
  }
}
