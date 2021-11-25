import 'package:dio/dio.dart';
import 'package:lyrics_app/domain/models/api/auth.dart';
import 'package:lyrics_app/domain/models/api/generic_response.dart';
import 'package:lyrics_app/domain/models/api/token_details.dart';
import 'package:lyrics_app/domain/models/api/user.dart';
import 'package:lyrics_app/domain/repositories/auth_repository.dart';

import '../../globals.dart';

class DioAuthRepository extends AbstarctAuthRepository{

  Dio dio = new Dio(
    BaseOptions(
      followRedirects: false,
      validateStatus: (status) { return status! < 500; },
      headers: {
        "Accept":"application/json",
        "Access-Control-Allow-Origin" : "*"
      },
    )
  );

  



  @override
  Future<GenericResponse> doLogin({required String email,required String password}) async {

    final String url  = '${Globals.baseUrl}/api/auth/login';
   

    var formData = FormData.fromMap({
      'email': email,
      'password': password,
    });

    try {

      Response response = await dio.post(url, data: formData);
      GenericResponse genericResponse = GenericResponse.fromJson(response.data);

      if(genericResponse.success){
        Auth auth = Auth.fromJson(response.data["data"]);
        genericResponse.data = auth;
      }

      return genericResponse;
    
    } catch (e) {
      return GenericResponse(success: false, message: e.toString());
    }
   
    
    
  }

  @override
  Future<GenericResponse> logout({token}) async{
    final String url  = '${Globals.baseUrl}/api/auth/logout';
    try {

      Response response = await dio.post(url);
      GenericResponse genericResponse = GenericResponse.fromJson(response.data);
      return genericResponse;
    
    } catch (e) {
      return GenericResponse(success: false, message: e.toString());
    }
  }

  @override
  Future<GenericResponse> sendEmail({email}) async{
    final String url  = '${Globals.baseUrl}/api/auth/send-email';

    var formData = FormData.fromMap({
      'email': email
    });
    try{
      Response response = await dio.post(url, data: formData);
      GenericResponse genericResponse = GenericResponse.fromJson(response.data);
      return genericResponse;

    }catch(e){
      return GenericResponse(success: false, message: e.toString());
    }
   
    
  }

  @override
  Future<GenericResponse> verificateCode({required String code}) async{

    final String url  = '${Globals.baseUrl}/api/auth/verify-code';
    var formData = FormData.fromMap({
      'code': code
    });

    try{
      Response response = await dio.post(url, data: formData);
      GenericResponse genericResponse = GenericResponse.fromJson(response.data);
      return genericResponse;
    }catch(e){
      return GenericResponse(success: false, message: e.toString());
    }
    
    
  }

  @override
  Future<GenericResponse> changePassword({required String password , required String code}) async{
    final String url  = '${Globals.baseUrl}/api/auth/change-password';
    var formData = FormData.fromMap({
      'code': code,
      'password': password
    });

    try{
      Response response = await dio.post(url, data: formData);
      GenericResponse genericResponse = GenericResponse.fromJson(response.data);
      return genericResponse;

    }catch(e){
      return GenericResponse(success: false, message: e.toString());
    }
   
  }

  @override
  Future<GenericResponse> registration({
    required String name, required String email, required String password}) async{

    final String url  = '${Globals.baseUrl}/api/auth/registration';
    var formData = FormData.fromMap({
      'name': name,
      'email': email,
      'password': password
    });
    try{
      Response response = await dio.post(url, data: formData);
      GenericResponse genericResponse = GenericResponse.fromJson(response.data);
      return genericResponse;

    }catch(e){
      return GenericResponse(success: false, message: e.toString());
    }
    
  }

  @override
  Future<GenericResponse> getAutherticatedUser() async{
    final String url  = '${Globals.baseUrl}/api/auth/get-user';
    dio.options.headers["authorization"] = "bearer ${Globals.token}";
    try{
      Response response = await dio.get(url);
      GenericResponse genericResponse = GenericResponse.fromJson(response.data);
      if(genericResponse.success){
        User user = User.fromJson(response.data["data"]);
        genericResponse.data = user;
      }
      return genericResponse;
    }catch(e){
      return GenericResponse(success: false, message: e.toString());
    }
    
  }

  @override
  Future<GenericResponse> refreshToken({required String token}) async{

    final String url  = '${Globals.baseUrl}/api/auth/refresh-token';
    dio.options.headers["authorization"] = "bearer $token";
    try{
      Response response = await dio.post(url);
      GenericResponse genericResponse = GenericResponse.fromJson(response.data);
      if(genericResponse.success){
        TokenDetiails token = TokenDetiails.fromJson(response.data["data"]);
        genericResponse.data = token;

      }
      return genericResponse;

    }catch(e){
      return GenericResponse(success: false, message: e.toString());
    }
    
  }
   
  
  
}