import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lyrics_app/login/login_page.dart';
import 'package:lyrics_app/registration/registration_Page.dart';
import 'package:lyrics_app/restorePass/restore_page.dart';
import 'package:lyrics_app/splash/bloc/splash_bloc.dart';
import 'package:lyrics_app/splash/splash_page.dart';
import 'package:lyrics_app/verification/verification_page.dart';
import 'package:lyrics_app/welcome/welcome_page.dart';
import 'package:lyrics_app/wrapper/wrapper_page.dart';

import 'forgotPass/forgotPass_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lyrics App',
      theme: ThemeData(
        textTheme: GoogleFonts.nunitoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: BlocProvider(
        create: (_) => SplashBloc(),
        child: const WelcomePage(),
      ),
    );
  }
}
