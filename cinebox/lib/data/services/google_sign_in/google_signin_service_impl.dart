import 'dart:nativewrappers/_internal/vm/lib/developer.dart';

import 'package:cinebox/core/result/result.dart';
import 'package:cinebox/data/services/google_sign_in/google_signin_service.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSigninServiceImpl implements GoogleSignInService {
  @override
  Future<Result<String>> isSignedIn() async {
    try {
      final logged = await GoogleSignIn.instance
          .attemptLightweightAuthentication();

      if (logged case GoogleSignInAccount(
        authentication: GoogleSignInAuthentication(idToken: final idToken?),
      )) {
        return Success(idToken);
      } else {
        return Failure(
          Exception('User is not signed in Google'),
        );
      }
    }  catch (e,s) {
      log(
        'User is not signed in Google',
        name: 'GoogleSignInService',
        error: e,
        stackTrace: s,
      );
      return Failure(
        Exception('User is not signed in Google'),
      );
    }
  }

  @override
  Future<Result<String>> signIn() async {
    try {
      final auth = await GoogleSignIn.instance.authenticate(
        scopeHint: ['email', 'profile', 'openid'],
      );

      if (auth.authentication case GoogleSignInAuthentication(
        idToken: final idToken?,
      )) {
        return Success(idToken);
      }
      return Failure(
        Exception('Failed to retrive Id Token from google sign in'),
      );
    } catch (e, s) {
      log(
        'Failed to retrive Id Token from google sign in',
        name: 'GoogleSignInService',
        error: e,
        stackTrace: s,
      );
      return Failure(
        Exception('Failed to retrive Id Token from google sign in'),
      );
    }
  }

  @override
  Future<Result<Unit>> signOut() async {
    try {
      await GoogleSignIn.instance.signOut();
      return successOfUnit();
    } catch (e, s) {
      log(
        'Google sign out error',
        name: 'GoogleSignInService',
        error: e,
        stackTrace: s,
      );
      return Failure(
        Exception('Google sign out error'),
      );
    }
  }
}
