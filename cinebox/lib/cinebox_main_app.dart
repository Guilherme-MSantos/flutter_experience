import 'package:cinebox/ui/Home/home_screen.dart';
import 'package:cinebox/ui/Login/login_screen.dart';
import 'package:cinebox/ui/Movie_Details/movie_details_screen.dart';
import 'package:cinebox/ui/core/themes/theme.dart';
import 'package:cinebox/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';


final navKey = GlobalKey<NavigatorState>() ;
class CineboxMainApp extends StatelessWidget {
  const CineboxMainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cinebox',
     theme: AppTheme.theme,
     navigatorKey: navKey,
     routes: {
        '/': (_)=> LoginScreen() ,
       '/login': (_)=> LoginScreen(),
       '/home':(_)=> HomeScreen(),
        '/movie_details' : (_)=>  MovieDetailsScreen(),
     },
    );
  }
}
