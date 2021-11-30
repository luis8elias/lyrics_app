import 'package:bloc/bloc.dart';
import 'package:lyrics_app/data/repositories/hive_config_repository.dart';
import 'package:lyrics_app/domain/models/api/auth.dart';
import 'package:lyrics_app/domain/models/api/generic_response.dart';
import 'package:lyrics_app/domain/models/config.dart';
import 'package:lyrics_app/domain/repositories/auth_repository.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final AbstarctAuthRepository authRepository;
  final HiveConfigRepository configRepository;



  LoginBloc({required this.configRepository,required this.authRepository}) : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async{
      

      if( event is DoLogin) {

        emit(TryingToLogin());

        GenericResponse response = await authRepository.doLogin(
          email: event.email,
          password: event.password
        );

        if(response.success){

          Auth auth = response.data;
          configRepository.setToken(token: auth.accessToken);
          Config? config = await configRepository.getConfig();

          if(config!.slectedGroup == -1){
            emit(UserWithoutGroup());

          }else{
            
            emit(
              LoginSuccess(
                data: response
              )
            );

          }



          
        }else{
          emit(LoginFailed(
            message: response.message
          ));

          await Future.delayed(const Duration(seconds: 2),(){
            emit(AuthInitial());
          });
          
        }

       
      }
      
    });
  }
}
