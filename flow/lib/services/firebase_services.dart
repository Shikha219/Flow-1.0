// ignore_for_file: unrelated_type_equality_checks

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flow/models/user-model.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';

class FirebaseServices {
  final _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();

  signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken);

        await _auth.signInWithCredential(authCredential);
        // addUserDetails(UserModel user)
        addUserDetails(googleSignInAccount);
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }

  Future<void> addUserDetails(GoogleSignInAccount account) async {
    bool docExists = await checkIfDocExists(account.email);
    if (!docExists) {
      print(checkIfDocExists(account.email));
      FirebaseFirestore.instance.collection('users').doc(account.email).set({
        "email": account.email,
        "name": account.displayName,
        "profilepic": account.photoUrl
      });
      print("......saved user data.....");
      await FirebaseFirestore.instance
          .collection('users')
          .doc(account.email)
          .collection('personal-info')
          .doc(account.displayName)
          .set({
        'dob': '',
        'regular': '',
        'discomfort': '',
        'health-disorder': '',
        'anything-want-to-improve': [],
        'fitness-goal': []
      }).then((onValue) {
        print('Created it in sub collection');
      }).catchError((e) {
        print('======Error======== ' + e);
      });
      await FirebaseFirestore.instance
          .collection('users')
          .doc(account.email)
          .collection('personal-info')
          .doc(account.displayName)
          .collection('cycle-info')
          .doc(DateFormat.yMMMM().format(DateTime.now()))
          .set({'DateFormat.MMMM().format(DateTime.now())': ''});

      await FirebaseFirestore.instance
          .collection('users')
          .doc(account.email)
          .collection('personal-info')
          .doc(account.displayName)
          .collection('symptoms')
          .doc(DateFormat.yMMMMd().format(DateTime.now()))
          .set({
        'weight': '',
        'sleep': '',
        'water': '',
        'mood': '',
        'symptoms': '',
        'vaginal-discharge': '',
        'others': ''
      });
    }
  }

  signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }

  Future<bool> checkIfDocExists(String docId) async {
    try {
      // Get reference to Firestore collection
      var collectionRef = FirebaseFirestore.instance.collection('users');

      var doc = await collectionRef.doc(docId).get();
      if (doc.exists)
        return Future<bool>.value(true);
      else
        return Future<bool>.value(false);
      // return doc.exists;
    } catch (e) {
      throw e;
    }
  }
}


/*
dob
regular
discomfort
health-disorder
anything-want-to-improve
fitness-goal

*/ 

/*
February,2023 = 
[
  {}
]



 * 'EstimatedDayofOvulation', 
 * 'LengthofLutealPhase', 
 * 'LengthofMenses', 
 * 'LengthofCycle',
 * 'StartDate',
 * 'LastDate'
 */