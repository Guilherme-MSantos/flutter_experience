import 'package:cinebox/data/services/google_sign_in/google_signin_service_impl.dart';
import 'package:cinebox/data/services/local_storage/local_storage_service.dart';
import 'package:cinebox/data/services/local_storage/local_storage_service_impl.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'google_sign_in/google_signin_service.dart';

part 'services_providers.g.dart';

@riverpod
GoogleSignInService googleSigninService(Ref ref){
  return GoogleSigninServiceImpl() ;
}

@Riverpod(keepAlive: true)
LocalStorageService localStorageService(Ref ref){
  return LocalStorageServiceImpl(flutterSecureStorage: FlutterSecureStorage()) ;
}