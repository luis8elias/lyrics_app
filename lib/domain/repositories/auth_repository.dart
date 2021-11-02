import 'package:lyrics_app/domain/apiModels/generic_response.dart';

abstract class AbstarctAuthRepository{

  Future<GenericResponse> doLogin({ required String email,required String password});

  Future<GenericResponse> logout({token});
  
}