import 'package:bloc/bloc.dart';
import 'package:lyrics_app/domain/models/api/generic_response.dart';
import 'package:lyrics_app/domain/repositories/auth_repository.dart';
import 'package:meta/meta.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {

  final AbstarctAuthRepository authRepository;
  
  RegistrationBloc({required this.authRepository}) : super(RegistrationInitial()) {
    on<RegistrationEvent>((event, emit) async{

        if(event is SaveNewUser){

        emit(TryingToSaveUser());

        GenericResponse response = await authRepository.registration(
          name: event.name,
          email: event.email,
          password: event.password
        );
        if(response.success){

          emit(UserSaved(
            message: response.message
          ));
          await Future.delayed(const Duration(seconds: 2),(){
            emit(RegistrationInitial());
          });



        }else{
          emit(UserNotSaved(message: response.message));
          await Future.delayed(const Duration(seconds: 2),(){
            emit(RegistrationInitial());
          });
        }

      }
      
    });
  }
}
