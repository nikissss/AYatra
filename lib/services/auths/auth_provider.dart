
import 'package:yatra1/services/auths/auth_user.dart';

abstract class AuthProvider{
Future<void> initializeApp();
 AuthUser? get currentUser;
  Future<AuthUser> login({
required String email,
required String passsword,
});
Future<AuthUser> createUser({
required String email,
required String password,
});
Future<void> logOut();
Future <void> sendEmailverification();
}