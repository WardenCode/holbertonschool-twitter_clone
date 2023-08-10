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

  final usersRef =
      FirebaseFirestore.instance.collection('users').withConverter<User>(
            fromFirestore: (snapshot, _) {
              return User.fromJson(
                snapshot.data() ?? {},
              );
            },
            toFirestore: (user, _) => user.toJson(),
          );

  attemptSignUp(email, name, password, passwordConfirmation) async {
    if (password != passwordConfirmation) {
      return Errors.matchError;
    }

    try {
      f.UserCredential userCredential =
          await auth.createUserWithEmailAndPassword(
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
          .then((value) => Errors.none)
          .catchError((error) => Errors.error);
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
}
