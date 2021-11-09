import 'package:bloc/bloc.dart';
import 'package:lyrics_app/domain/models/api/auth.dart';
import 'package:lyrics_app/domain/models/api/generic_response.dart';
import 'package:lyrics_app/domain/repositories/auth_repository.dart';
import 'package:lyrics_app/globals.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final AbstarctAuthRepository authRepository;



  LoginBloc({required this.authRepository}) : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async{
      

      if( event is DoLogin) {

        emit(TryingToLogin());

        GenericResponse response = await authRepository.doLogin(
          email: event.email,
           password: event.password
        );

        if(response.success){
          emit(LoginSuccess(
            data: response
          ));
          Auth auth = response.data;
          Globals.token = auth.accessToken;
          print(Globals.token);
          await Future.delayed(const Duration(seconds: 2),(){
            emit(AuthInitial());
          });
          
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
