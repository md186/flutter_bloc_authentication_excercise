import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fl_auth/repositories/user_repository.dart';

import '../../models/user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  UserRepository userRepository;
  AuthBloc({required this.userRepository}) : super(AuthInitial()) {
    on<AppLoaded>((event, emit) async {
      try {
        var isSignedIn = await userRepository.isSignedIn();
        print(isSignedIn);
        if (isSignedIn) {
          var user = await userRepository.getCurrentUser();
          emit(AuthenticatedState(user: user));
          print('block says user is authenticated');
        } else {
          emit(UnauthenticatedState());
          print('block says user is NOT authenticated');
        }
      } catch (e) {
        emit(UnauthenticatedState());
      }
    });
  }
}
