import 'user.dart';

class Auth {
  /// private constructor
  Auth._();
  /// the one and only instance of this singleton
  static final instance = Auth._();
  //ChatBloc chatBloc = ChatBloc(DatabaseApi.db);
  
  // Create a User instance. Actually it would be better if this is empty so I can notice if a user is valid or not and can react by checking if the user has values and
  // if not log the user out later on
  User currentUser = User.empty;

  // updateCurrentUserInstance(User user) async {
  //   currentUser = user;
  //   print('updateCurrentUserInstance $currentUser');

  //     //print('auth.currentUser after currentuserinstance ${instance.currentUser}');
  //   //return currentUser;
  // }
}
