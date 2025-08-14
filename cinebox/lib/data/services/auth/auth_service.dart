import 'package:retrofit/retrofit.dart' ;
import 'package:dio/dio.dart';

part 'auth_service.g.dart';

@RestApi()
abstract class AuthService {

   factory AuthService(Dio dio, {String? baseUrl}) = _AuthService ;

@POST('/auth')
Future<void> auth() ;
}