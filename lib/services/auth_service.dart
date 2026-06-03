import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  bool isLoggedIn() {

    return FirebaseAuth
        .instance.currentUser !=
        null;
  }

  User? currentUser() {

    return FirebaseAuth
        .instance.currentUser;
  }

  Future logout() async {

    await FirebaseAuth.instance
        .signOut();
  }
}