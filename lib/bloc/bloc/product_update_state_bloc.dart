import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_update_state_event.dart';
part 'product_update_state_state.dart';

class ProductUpdateStateBloc
    extends Bloc<ProductUpdateStateEvent, ProductUpdateStateInitial> {
  ProductUpdateStateBloc()
      : super(ProductUpdateStateInitial(Updatestate: false)) {
    on<ProductUpdateStateEventconfirm>((event, emit) async* {
          
      emit(state.copywith(status: true));
    });
    on<ProductUpdateStateEventCancel>((event, emit) async* {
      emit(state.copywith(status: false));
    });
  }
}
