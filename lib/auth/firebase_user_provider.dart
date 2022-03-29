import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class PrimusFreshFirebaseUser {
  PrimusFreshFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

PrimusFreshFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<PrimusFreshFirebaseUser> primusFreshFirebaseUserStream() => FirebaseAuth
    .instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<PrimusFreshFirebaseUser>(
        (user) => currentUser = PrimusFreshFirebaseUser(user));
