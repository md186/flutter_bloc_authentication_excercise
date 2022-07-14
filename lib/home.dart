import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/auth/auth_bloc.dart';
import 'models/auth.dart';
import 'repositories/user_repository.dart';

class Home extends StatelessWidget {
  late UserRepository userRepository;
  late Auth auth;
  Home(Auth auth, userRepository, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Auth _auth = Auth.instance;
    // UserRepository _userRepository = UserRepository(auth: _auth);
   final authBloc = AuthBloc(userRepository: userRepository);
    return Scaffold(
        body: SizedBox(
            height: 500,
            child: Column(
              children: [
                Container(
                  height: 200,
                  child: BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                    if (state is UnauthenticatedState) {
                      return Center(child: Text('User is unauthenticated'));
                    } else if (state is AuthenticatedState) {
                      return Center(child: Text('YEAH logged in!'));
                    } else {
                      return Center(child: Text('something went wrong'));
                    }
                  }),
                ),
                TextButton(
                    onPressed: () => {
                          authBloc.userRepository.signIn(),
                          authBloc.add(AppLoaded())
                        },
                    child: Text('Login')),
              ],
            )));
  }
}
