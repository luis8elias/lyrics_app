import 'package:bloc/bloc.dart';
import 'package:lyrics_app/domain/models/api/generic_response.dart';
import 'package:lyrics_app/domain/repositories/auth_repository.dart';
import 'package:meta/meta.dart';

part 'verification_event.dart';
part 'verification_state.dart';

class VerificationBloc extends Bloc<VerificationEvent, VerificationState> {

  final AbstarctAuthRepository authRepository;


  VerificationBloc({required this.authRepository}) : super(VerificationInitial()) {
    on<VerificationEvent>((event, emit) async{


      if(event is VerificateCode ){
        emit(VerificationInProcess());
         GenericResponse response = await authRepository.verificateCode(
          code: event.code
        );

        if(response.success){

          emit(SuccessfulCode(
            message: response.message,
            code: event.code
          ));
          await Future.delayed(const Duration(seconds: 2),(){
            emit(VerificationInitial());
          });

        }else{
          emit(WrongCode(message: response.message));
          await Future.delayed(const Duration(seconds: 2),(){
            emit(VerificationInitial());
          });
        }
      }
      
    });
  }
}
