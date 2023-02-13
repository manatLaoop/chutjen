part of 'autentication_bloc.dart';

class Autenticationstate extends Equatable {
  const Autenticationstate();

  @override
  List<Object> get props => [];
}

class AuthenticationUninitialized extends Autenticationstate {
  @override
  String toString() => 'AuthenticationUninitialized';
}

class AuthenticationAuthenticated extends Autenticationstate {}

class AuthenticationUnauthenticated extends Autenticationstate {}

class AuthenticationLoading extends Autenticationstate {}
