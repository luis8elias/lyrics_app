import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:lyrics_app/domain/models/api/generic_response.dart';
import 'package:lyrics_app/domain/repositories/auth_repository.dart';
import 'package:meta/meta.dart';

part 'forgot_pass_event.dart';
part 'forgot_pass_state.dart';

class ForgotPassBloc extends Bloc<ForgotPassEvent, ForgotPassState> {

  final AbstarctAuthRepository authRepository;




  ForgotPassBloc({required this.authRepository}) : super(ForgotPassInitial()) {
    on<ForgotPassEvent>((event, emit) async{
      
      if(event is ForgotPassword){

        emit(TryingToRestorePass());

        GenericResponse response = await authRepository.sendEmail(
          email: event.email
        );
        if(response.success){

          emit(MailSended(
            message: response.message
          ));
          await Future.delayed(const Duration(seconds: 2),(){
            emit(ForgotPassInitial());
          });



        }else{
          emit(MailNotSended(message: response.message));
          await Future.delayed(const Duration(seconds: 2),(){
            emit(ForgotPassInitial());
          });
        }

      }
      
    });
  }
}
