part of 'product_update_state_bloc.dart';

abstract class ProductUpdateStateEvent extends Equatable {
  const ProductUpdateStateEvent();

  @override
  List<Object> get props => [];
}

class ProductUpdateStateEventconfirm extends ProductUpdateStateEvent {}

class ProductUpdateStateEventCancel extends ProductUpdateStateEvent {}
