import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/user_model.dart';
import 'interfaces/iauth_service.dart';

class AuthService implements IAuthService {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    final userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);

    if (userCredential.user == null) {
      throw Exception("Erro ao conectar");
    }

    final user = UserModel(
      id: userCredential.user!.uid,
      email: email,
    );

    return user;
  }

  @override
  Future<UserModel> signInWithGoogle() async {
    if (await GoogleSignIn().isSignedIn()) {
      await GoogleSignIn().disconnect();
    }
    final GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();

    if (googleSignInAccount == null) {
      throw Exception("Erro ao cadastrar");
    }

    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

    final AuthCredential authCredential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final userCredential = await auth.signInWithCredential(authCredential);

    if (userCredential.user == null) {
      throw Exception("Erro ao conectar");
    }

    final user = UserModel(
      id: userCredential.user!.uid,
      email: userCredential.user!.email!,
    );

    return user;
  }

  @override
  Future<UserModel> signUp({
    required String email,
    required String password,
  }) async {
    final userCredential = await auth.createUserWithEmailAndPassword(email: email, password: password);

    if (userCredential.user == null) {
      throw Exception("Erro ao cadastrar");
    }

    final user = UserModel(
      id: userCredential.user!.uid,
      email: email,
    );

    return user;
  }

  @override
  Future<void> signOut() async {
    await auth.signOut();
  }

  @override
  Future<void> resetPassword({
    required String email,
  }) async {
    await auth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> changePassword({
    required String email,
    required String currentPassword,
    required String newPassword,
  }) async {
    await auth.signInWithEmailAndPassword(
      email: email,
      password: currentPassword,
    );

    await auth.currentUser!.updatePassword(newPassword);
  }
}
