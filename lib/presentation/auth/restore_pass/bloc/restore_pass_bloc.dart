import 'package:bloc/bloc.dart';
import 'package:lyrics_app/domain/models/api/generic_response.dart';
import 'package:lyrics_app/domain/repositories/auth_repository.dart';
import 'package:meta/meta.dart';

part 'restore_pass_event.dart';
part 'restore_pass_state.dart';

class RestorePassBloc extends Bloc<RestorePassEvent, RestorePassState> {

  final AbstarctAuthRepository authRepository;


  RestorePassBloc({required this.authRepository}) : super(RestorePassInitial()) {
    on<RestorePassEvent>((event, emit) async{

      if(event is SaveNewPassword){
        emit(TryingToSaveNewPass());
        GenericResponse response = await authRepository.changePassword(
          password: event.password, code: event.code
        );

        if(response.success){

          emit(PasswordSaved(
            message: response.message
          ));
          await Future.delayed(const Duration(seconds: 2),(){
            emit(RestorePassInitial());
          });

        }else{
          emit(PasswordNotSaved(message: response.message));
          await Future.delayed(const Duration(seconds: 2),(){
            emit(RestorePassInitial());
          });
        }
      }


     
    });
  }
}
