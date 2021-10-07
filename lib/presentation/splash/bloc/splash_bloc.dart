import 'package:bloc/bloc.dart';
import 'package:lyrics_app/domain/repositories/config_repository.dart';
import 'package:meta/meta.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {

  final AbstarctConfigRepository configRepository;


  SplashBloc({required this.configRepository}) : super(SplashInitial()) {
    on<SplashEvent>((event, emit) async{

      await Future.delayed(const Duration(seconds: 2));
      if(event is LoadedSplashEvent ){

        if (await configRepository.itsTheFirstTime()) {
          emit(ItsTheFirtsTime());
        }else {
          emit(ItsNotTheFirtsTime());
        }
        
      }

    });
  }
}
