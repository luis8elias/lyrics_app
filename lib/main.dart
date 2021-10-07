import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lyrics_app/splash/bloc/splash_bloc.dart';
import 'package:lyrics_app/splash/splash_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light
  ));
  
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lyrics App',
      home: BlocProvider(
        create: (_) =>  SplashBloc(),
        child: const SplashPage(),
      ),
    )
  );
}





