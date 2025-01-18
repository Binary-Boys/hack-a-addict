import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

String getUserEmail() {
  final User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    return user.email!;
  } else {
    return 'vipindas@gmail.com';
  }
}

String getCurrentUserID() {
  final User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    String uid = user.uid;
    return uid;
  } else {
    return '';
  }
}

Future<bool> isCurrentUserAdmin() async {
  final db = FirebaseFirestore.instance;
  bool isAdmin = false;
  String userID = getCurrentUserID();
  final docRef = await db.collection("users").doc(userID);
  await docRef.get().then(
    (DocumentSnapshot doc) {
      final data = doc.data() as Map<String, dynamic>;
      isAdmin = data["isAdmin"];
    },
    onError: (e) {
      print(e);
    },
  );

  return isAdmin;
}

Future<String> getUserName() async {
  final db = FirebaseFirestore.instance;

  String userID = await getCurrentUserID();

  String username = 'Ashwin Wilson';

  final data = await db.collection("users").where("userID", isEqualTo: userID)
      as Map<String, dynamic>;
  return data["username"];
}
