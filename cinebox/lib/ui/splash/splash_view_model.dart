import 'package:cinebox/ui/splash/comands/check_user_logged_command.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'splash_view_model.g.dart';

class SplashViewModel {

  final CheckUserLoggedCommand _checkUserLoggedCommand ;

  SplashViewModel({required CheckUserLoggedCommand checkUserLoggedCommand}) : _checkUserLoggedCommand = checkUserLoggedCommand ;

  void checkLoginAndRedirect(){
    _checkUserLoggedCommand.execute() ;
  } 
}

@riverpod
SplashViewModel splashViewModel(Ref ref) {
  return SplashViewModel(
    checkUserLoggedCommand: ref.read(checkUserLoggedCommandProvider.notifier)
  );
}
