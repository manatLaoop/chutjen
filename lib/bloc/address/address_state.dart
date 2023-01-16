// ignore_for_file: prefer_const_constructors_in_immutables, type_init_formals, non_constant_identifier_names

part of 'address_bloc.dart';

class AddressInitial extends Equatable {
  AddressInitial({
    List<Address>? this.aumphers,
    List<Address>? this.tumsbons,
  });

  List<Address>? aumphers;
  List<Address>? tumsbons;

  // ....................
  AddressInitial copyWith({List<Address>? aumphers, List<Address>? tumsbons}) {
    return AddressInitial(
      aumphers: aumphers ?? this.aumphers,
      tumsbons: tumsbons ?? this.tumsbons,
    );
  }

  @override
  List<Object> get props => [aumphers!, tumsbons!];
}
