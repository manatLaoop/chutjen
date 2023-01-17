// ignore_for_file: prefer_const_constructors_in_immutables, non_constant_identifier_names, unnecessary_this

part of 'product_update_state_bloc.dart';

class ProductUpdateStateInitial extends Equatable {
  final bool Updatestate;
  const ProductUpdateStateInitial({required this.Updatestate});

  ProductUpdateStateInitial copywith({bool? status}) {
    return ProductUpdateStateInitial(Updatestate: status ?? this.Updatestate);
  }

  @override
  List<Object> get props => [];
}
