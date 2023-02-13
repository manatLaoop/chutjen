part of 'autentication_bloc.dart';

abstract class AutenticationEvent extends Equatable {
  const AutenticationEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AutenticationEvent {
  @override
  String toString() {
    // TODO: implement toString
    return 'AppStarted';
  }
}

class NothaveToken extends AutenticationEvent {
  @override
  String toString() {
    // TODO: implement toString
    return ' not have totken';
  }
}

class Loginsucess extends AutenticationEvent {}

class Logout extends AutenticationEvent {
  @override
  String toString() {
    // TODO: implement toString
    return 'logout';
  }
}
