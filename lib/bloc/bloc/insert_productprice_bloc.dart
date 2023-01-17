import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'insert_productprice_event.dart';
part 'insert_productprice_state.dart';

class InsertProductpriceBloc extends Bloc<InsertProductpriceEvent, InsertProductpriceState> {
  InsertProductpriceBloc() : super(InsertProductpriceInitial()) {
    on<InsertProductpriceEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
