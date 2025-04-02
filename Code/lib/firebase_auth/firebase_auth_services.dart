import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServices {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> signUpWithEmailAndPassword(

      {required int grade,
      required String email,
      required String password,
      required String name,
      required String surname}) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = credential.user;

      if (user != null) {
        await _firestore
            .collection('users')
            .doc(user.uid)
            .set({'name': name, 'surname': surname, 'grade': grade,'email': email,'password':
        password,'isStartedPrograming': false , 'isStartedChess': false,
         'isStartedDesign': false,'isStartedArduino': false,'programing': 0,'arduino': 0,'design': 0,'chess':0,
          'checkPrograming':[false,false,false,false,false,false,false,false,false,false,false],
          'checkArduino':[false,false,false,false,false,false,false,false,false,false],
          'checkChess':[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
          'checkDesign':[false,false,false,false,false,false,false,false,false,false],
          'progressPrograming':0,'progressChess':0,'progressDesign':0,'progressArduino':0,
          'chessCompleted':false,'arduinoCompleted': false,'programingCompleted': false,'designCompleted':false





        },);
      }
      return user;
    } catch (e) {
      print("some problem occured");
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user_ = credential.user;
      return user_;
    } catch (e) {
      print("some error occured while login");
      return null;
    }

    return null;
  }




  Future<Map<String, dynamic>?> getUserData() async {
    try {
      User? user = _auth.currentUser;

      if (user != null) {
        DocumentSnapshot userDoc = await _firestore
            .collection('users')
            .doc(user.uid)
            .get();

        if (userDoc.exists) {
          return userDoc.data() as Map<String, dynamic>;
        }
      }
    } catch (e) {
      print("Error getting user data: $e");
    }
    return null;
  }




  Future<void> signOut() async {
    try {
      await _auth.signOut();
      print("User signed out successfully");
    } catch (e) {
      print("Error signing out: $e");
    }
  }


  
}




  



