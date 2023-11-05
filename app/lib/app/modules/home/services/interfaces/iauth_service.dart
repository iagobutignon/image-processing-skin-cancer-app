import '../../models/user_model.dart';

abstract class IAuthService {
  Future<UserModel> signIn({
    required String email,
    required String password,
  });
  
  Future<UserModel> signInWithGoogle();

  Future<UserModel> signUp({
    required String email,
    required String password,
  });

  Future<void> signOut();

  Future<void> resetPassword({
    required String email,
  });

  Future<void> changePassword({
    required String email,
    required String currentPassword,
    required String newPassword,
  });
}