import 'package:lyrics_app/domain/models/api/generic_response.dart';

abstract class AbstarctAuthRepository{

  Future<GenericResponse> doLogin({ required String email,required String password});

  Future<GenericResponse> logout({token});

  Future<GenericResponse> sendEmail({email});

  Future<GenericResponse> verificateCode({required String code});

  Future<GenericResponse> changePassword({
    required String password,
    required String code
  });

  Future<GenericResponse> registration({
    required String name,
    required String email,
    required String password
  });
  
}