import 'package:bloc/bloc.dart';
import 'package:lyrics_app/domain/models/api/generic_response.dart';
import 'package:lyrics_app/domain/models/api/token_details.dart';
import 'package:lyrics_app/domain/models/config.dart';
import 'package:lyrics_app/domain/repositories/auth_repository.dart';
import 'package:lyrics_app/domain/repositories/config_repository.dart';
import 'package:meta/meta.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {

  final AbstarctConfigRepository configRepository;
  final AbstarctAuthRepository authRepository;


  SplashBloc({required this.configRepository, required this.authRepository}) : super(SplashInitial()) {
    on<SplashEvent>((event, emit) async{

     
      if(event is LoadedSplashEvent ){
        if (await configRepository.itsTheFirstTime()) {
          emit(ItsTheFirtsTime());
        }else {

          
          Config? config = await configRepository.getConfig();
          GenericResponse response = await authRepository.refreshToken(
            token: config!.token
          );
          if(response.success){
            TokenDetiails tokenDetiails = response.data;
            configRepository.setToken(token: tokenDetiails.accessToken);

            if(config.slectedGroup == -1){

              emit(UserWithoutGroup());

            }else{
              emit(IsAuthenticated());
            }
           
          }else{
            emit(IsNotAuthenticated());
          }

          
        }
        
      }

    });
  }
}
