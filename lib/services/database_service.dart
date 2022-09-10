import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");

  Future saveUserDataAbout(String fullName, String email) async {
    userCollection
        .doc(uid)
        .set({"fullName": fullName, "email": email, "uid": uid});
  }

  Future getingUserData(String email) async {
    QuerySnapshot querySnapshot =
        await userCollection.where("email", isEqualTo: email).get();
    return querySnapshot;
  }
}
