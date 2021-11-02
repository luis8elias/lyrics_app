import 'package:dio/dio.dart';
import 'package:lyrics_app/domain/apiModels/auth.dart';
import 'package:lyrics_app/domain/apiModels/generic_response.dart';
import 'package:lyrics_app/domain/repositories/auth_repository.dart';

import '../../globals.dart';

class DioAuthRepository extends AbstarctAuthRepository{

  Dio dio = new Dio(
    BaseOptions(
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      validateStatus: (_)=>true,
    )
  );



  @override
  Future<GenericResponse> doLogin({required String email,required String password}) async {

    final String url  = '${Globals.baseUrl}/api/auth/login/';

    var formData = FormData.fromMap({
      'email': email,
      'password': password,
    });
    Response response = await dio.post(url, data: formData);
    GenericResponse genericResponse = GenericResponse.fromJson(response.data);

    if(genericResponse.success){
      Auth auth = Auth.fromJson(response.data["data"]);
      genericResponse.data = auth;
    }

    return genericResponse;
    
    
  }

  @override
  Future<GenericResponse> logout({token}) {
    // TODO: implement logout
    throw UnimplementedError();
  }
  
}