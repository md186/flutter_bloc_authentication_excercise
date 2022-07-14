import 'package:fl_auth/models/user.dart';

import '../models/auth.dart';

class UserRepository {
  Auth auth = Auth.instance;

  UserRepository({required this.auth});

  // sign in with username
  //TODO: change hardcoded username to email and passwort later on
  Future<User> signIn() async {
    try{
      await Future.delayed(Duration(seconds: 1));
      var credentials = User(id: 1, socketId: '123', userName: 'Logged in User');
      auth.currentUser = credentials;
      print('signed id with credentials: ${auth.currentUser}');
      return auth.currentUser;
    }catch(e){
      print(e.toString());
      throw e;
    }
  }

  // check signed in status
  Future<bool> isSignedIn() async {
    try{
      await Future.delayed(const Duration(seconds: 1));
      var currentUser = auth.currentUser;
      if(currentUser.isNotEmpty){
        print('user is signed in');
        return true;
      } else {
        print('user is NOT signed in');
        return false;
      }
    }catch(e){
      print(e.toString());
      throw e;
    }
  }

  // get user
  Future<User> getCurrentUser() async {
    try{
      await Future.delayed(const Duration(seconds: 1));
      var currentUser = auth.currentUser;
      if(currentUser.isNotEmpty){
        print('currentuser is not empty: $currentUser');
        return currentUser;
      } else {
        var message = 'User is empty';
        print('currentuser IS empty: $currentUser');
        throw message;
      }
    }catch(e){
      print(e.toString());
      throw e;
    }
  }
}