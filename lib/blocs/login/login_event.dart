part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginStarted extends LoginEvent {}

class LoginStateChange extends LoginEvent {
  final AuthenticationDetail authDetail;

  const LoginStateChange({required this.authDetail});

  @override
  List<Object> get props => [authDetail];
}

class LoginWithGoogleEvent extends LoginEvent {}

class LoginWithFacebookEvent extends LoginEvent {}

class LoginExitedEvent extends LoginEvent {}