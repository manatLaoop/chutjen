import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_update_state_event.dart';
part 'product_update_state_state.dart';

class ProductUpdateStateBloc extends Bloc<ProductUpdateStateEvent, ProductUpdateStateState> {
  ProductUpdateStateBloc() : super(ProductUpdateStateInitial()) {
    on<ProductUpdateStateEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
