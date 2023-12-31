import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as f;
import 'package:flutter/material.dart';
import 'package:twitter/models/user.dart';

enum Errors {
  none,
  matchError,
  weakError,
  existsError,
  error,
  wrongError,
  noUserError
}

class Auth extends ChangeNotifier {
  late f.FirebaseAuth auth = f.FirebaseAuth.instance;
  f.User? get currentUser => auth.currentUser;
  Stream<f.User?> get authStateChanges => auth.authStateChanges();

  final usersRef =
      FirebaseFirestore.instance.collection('users').withConverter<User>(
            fromFirestore: (snapshot, _) {
              return User.fromJson(
                snapshot.data() ?? {},
              );
            },
            toFirestore: (user, _) => user.toJson(),
          );

  Future attemptSignUp(email, name, password, passwordConfirmation) async {
    if (password != passwordConfirmation) {
      return Errors.matchError;
    }

    try {
      f.UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return usersRef
          .add(User(
            userID: userCredential.user!.uid,
            email: email,
            userName: '@${name}Holberton',
            displayName: name,
          ))
          .then((value) {
            print('value $value');
            return Errors.none;
          })
          .catchError((error) {
            print('Error $error');
            return Errors.error;
          });
    } on f.FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Errors.weakError;
      } else if (e.code == 'email-already-in-use') {
        return Errors.existsError;
      } else {
        return Errors.error;
      }
    }
  }

  Future attemptLogin(
    String email,
    String password,
  ) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Errors.none;
    } on f.FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Errors.noUserError;
      } else if (e.code == 'wrong-password') {
        return Errors.wrongError;
      } else {
        return Errors.error;
      }
    }
  }

  Future logout() async {
    await auth.signOut();
  }

  Future<User> getCurrentUserModel() async {
    QuerySnapshot querySnapshot = await usersRef.get();
    List<User>? allUsers =
        querySnapshot.docs.map((doc) => doc.data()).cast<User>().toList();

    for (var user in allUsers) {
      if (user.userID == currentUser?.uid) {
        return user;
      }
    }

    return {} as User;
  }
}
