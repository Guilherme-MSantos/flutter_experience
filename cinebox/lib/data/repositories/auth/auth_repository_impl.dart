//import 'dart:nativewrappers/_internal/vm/lib/developer.dart';

import 'dart:developer';
import 'package:cinebox/core/result/result.dart';
import 'package:cinebox/data/exception/data_exception.dart';
import 'package:cinebox/data/repositories/auth/auth_repository.dart';
import 'package:cinebox/data/services/google_sign_in/google_signin_service.dart';
import 'package:cinebox/data/services/local_storage/local_storage_service.dart';

class AuthRepositoryImpl implements AuthRepository {
  final LocalStorageService _localStorageService;

  final GoogleSignInService _googleSignInService;

  AuthRepositoryImpl({
    required LocalStorageService localStorageService,
    required GoogleSignInService googleSignInService,
  }) : _localStorageService = localStorageService,
       _googleSignInService = googleSignInService;

  @override
  Future<Result<bool>> isLogged() async {
    final resultToken = await _localStorageService.getIdToken() ;

    return switch(resultToken){
      Success<String>() => Success(true),
    Failure<String>() => Success(false)
    } ;
  }

  @override
  Future<Result<Unit>> signIn() async {
    final result = await _googleSignInService.signIn();

    switch (result) {
      case Success<String>(:final value):
        await _localStorageService.saveIdToken(value);
        return successOfUnit();
      case Failure<String>(:final error):
        log(
          'Erro ao fazer login com o google',
          name: "AuthRepository",
          error: error,
        );
        return Failure(
          DataException(message: 'Erro ao realizar login com o Google'),
        );
    }
  }

  @override
  Future<Result<Unit>> signOut() async {
    final result = await _googleSignInService.signOut();

    switch (result) {
      case Success<Unit>():
        final removeResult = await _localStorageService.removeIdToken();
        switch (removeResult) {
          case Success<Unit>():
            return successOfUnit();
          case Failure<Unit>(:final error):
            log('Erro ao fazer log out ID token');
            return Failure(error);
        }
      case Failure<Unit>(:final error):
        return Failure(error);
    }
  }
}
