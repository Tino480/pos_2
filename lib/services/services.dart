import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class services {

  getLatestOrder() async{
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseUser user = await _auth.currentUser();
    final String uid = user.uid;
    Firestore.instance.collection('Orders')
        .where('User', isEqualTo: uid)
        .getDocuments();
  }

}