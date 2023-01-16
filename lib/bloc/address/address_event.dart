part of 'address_bloc.dart';

abstract class AddressEvent extends Equatable {
  const AddressEvent();

  @override
  List<Object> get props => [];
}

class Getrovinces extends AddressEvent {}

class Feeddamphures extends AddressEvent {
  final String params;
  const Feeddamphures({required String this.params});
}

class Feeddtumbons extends AddressEvent {
  final String paramsT;
  Feeddtumbons({required String this.paramsT});

  // final String params;
  // Feeddtambons({required String this.params});
}

class Resetadress extends AddressEvent {
  // final String params;
  // Feeddtambons({required String this.params});
}
