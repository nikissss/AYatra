

import 'package:yatra1/services/auths/auth_provider.dart';
import 'package:yatra1/services/auths/auth_user.dart';
import 'package:yatra1/services/auths/firebase_auth_provider.dart';

class AuthService implements AuthProvider{
  final AuthProvider provider;
  const AuthService(this.provider);
  factory AuthService.firebase()=> AuthService(FireBaseAuthProvider());

  @override
  Future<AuthUser> createUser({
    required String email, 
    required String password,
    }) =>
    provider.createUser(
      email: email, 
      password: password,
      );
  
  @override

  AuthUser? get currentUser => provider.currentUser;
  
  @override
  Future<void> logOut() =>provider.logOut();
  
  @override
  Future<AuthUser> login({
    required String email,
     required String passsword,
     }) =>
     provider.login(email: email, 
     passsword: passsword,
     );
  @override
  Future<void> sendEmailverification() => provider.sendEmailverification();
  
  @override
  Future<void> initializeApp()=>
  provider.initializeApp();

  logIn({required String email, required String password}) {}
}