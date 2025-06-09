import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<dynamic> fetchData() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection("novels").get();
      return snapshot.docs;
    } catch (e) {
      print('Error fetching data: $e');
      throw e;
    }
  }
}
