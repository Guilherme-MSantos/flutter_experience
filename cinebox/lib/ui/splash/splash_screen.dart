import 'package:cinebox/ui/core/widgets/loader_messages.dart';
import 'package:cinebox/ui/splash/comands/check_user_logged_command.dart';
import 'package:cinebox/ui/splash/splash_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/themes/resource.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with LoaderAndMessage {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(splashViewModelProvider).checkLoginAndRedirect();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(checkUserLoggedCommandProvider, (_, next) {
      next.whenOrNull(
        loading: () => showLoader(),
        data: (data) {
          final path = switch (data) {
            false => '/',
            true => '/login',
            _ => '',
          };

          if (path.isNotEmpty && context.mounted) {
            hideLoader();
               Navigator.pushNamedAndRemoveUntil(context, path, (route)=> false ) ;
          }
        },
        error: (error, stackTrace) {

          if (context.mounted) {
            hideLoader();
            showErrorSnackBar('Erro ao verificar login');
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/login',
              (route) => false,
            );
          }
        },
      );
    });

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            R.ASSETS_IMAGES_BG_LOGIN_PNG,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            constraints: BoxConstraints.expand(),
            color: Colors.black.withAlpha(170),
          ),
          Center(
            child: Image.asset(R.ASSETS_IMAGES_LOGO_PNG),
          ),
        ],
      ),
    );
  }
}
