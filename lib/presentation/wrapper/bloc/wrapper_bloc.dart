import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'wrapper_event.dart';
part 'wrapper_state.dart';

class WrapperBloc extends Bloc<WrapperEvent, IndexChangedState> {
  int index = 0;

  WrapperBloc() : super(IndexChangedState(
    currentIndex: 0
  )) {
    on<WrapperEvent>((event, emit) {
      if (event is IndexChangedEvent){
      index = event.index;
      emit(IndexChangedState(currentIndex: index));
     
    }
    });
  }
}
