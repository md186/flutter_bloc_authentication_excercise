import 'package:fl_auth/bloc/auth/auth_bloc.dart';
import 'package:fl_auth/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc_observer.dart';
import 'home.dart';
import 'models/auth.dart';

void main() {
  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: SimpleBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Auth _auth = Auth.instance;
    UserRepository _userRepository = UserRepository(auth: _auth);
    print('building main.dart');

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) =>
            AuthBloc(userRepository: _userRepository)..add(AppLoaded()),
        child: Home(_auth, _userRepository),
      ),
    );
  }
}
