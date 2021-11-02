import 'package:bloc/bloc.dart';
import 'package:lyrics_app/domain/apiModels/auth.dart';
import 'package:lyrics_app/domain/apiModels/generic_response.dart';
import 'package:lyrics_app/domain/repositories/auth_repository.dart';
import 'package:lyrics_app/globals.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  final AbstarctAuthRepository authRepository;



  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async{
      

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
          
        }else{
          emit(LoginFailed(
            message: response.message
          ));
        }

       
      }
    });
  }
}
