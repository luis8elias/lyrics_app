import 'package:bloc/bloc.dart';
import 'package:lyrics_app/domain/repositories/config_repository.dart';
import 'package:meta/meta.dart';

part 'welcome_event.dart';
part 'welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {

  final AbstarctConfigRepository configRepository;
  
  WelcomeBloc({required this.configRepository}) : super(WelcomeInitial()) {
    on<WelcomeEvent>((event, emit) {
      if(event is OnPressStartButton){
        configRepository.setFirtsTime();
        emit(StartButtonPressed());
      }
    });
  }
}
