import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'wrapper_event.dart';
part 'wrapper_state.dart';

class WrapperBloc extends Bloc<WrapperEvent, IndexChangedState> {
  int index;

  WrapperBloc({required this.index}) : super(IndexChangedState(
    currentIndex: index
  )) {
    on<WrapperEvent>((event, emit) {
      if (event is IndexChangedEvent){
      index = event.index;
      emit(IndexChangedState(currentIndex: index));
     
    }
    });
  }
}
