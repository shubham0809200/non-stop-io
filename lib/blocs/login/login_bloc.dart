import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:non_stop_io/models/auth.model.dart';
import 'package:non_stop_io/services/auth_repo.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
    final AuthenticationRepository _authenticationRepository;

    LoginBloc({required AuthenticationRepository authenticationRepository})
        : _authenticationRepository = authenticationRepository,
          super(LoginInitial());

    StreamSubscription<AuthenticationDetail>? authStreamSub;

     @override
  Future<void> close() {
    authStreamSub?.cancel();
    return super.close();
  }

  Stream<LoginState> mapEventToState(
      LoginEvent event,
    ) async* {
      if( event is LoginStarted) {
        try {
         yield LoginLoading();
          authStreamSub = _authenticationRepository.getAuthDetailStream().listen((authDetail) {
           add(LoginStateChange(authDetail: authDetail));
          });
        } catch (e) {
          yield LoginError(message: e.toString());
        }
      }
      else if (event is LoginStateChange) {
        if(event.authDetail.isValid!) {
          yield LoginLoaded(authDetail: event.authDetail);
        } else {
          yield const LoginError(message: 'Invalid Authentication');
        }
      }
      else if (event is LoginWithGoogleEvent) {
        try {
          yield LoginLoading();
          AuthenticationDetail authDetail = await _authenticationRepository.authenticateWithGoogle();

          if(authDetail.isValid!) {
            yield LoginLoaded(authDetail: authDetail);
          } else {
            yield const LoginError(message: 'Invalid Authentication');
          }
        } catch (e) {
          yield LoginError(message: e.toString());
        }
        
      } else if( event is LoginExitedEvent) {
       try {
         yield LoginLoading();
        await _authenticationRepository.unAuthenticate();
       } catch (e) {
         yield LoginError(message: e.toString());
       }
      }

    }

}
