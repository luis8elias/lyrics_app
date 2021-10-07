import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';


import 'data/repositories/hive_config_repository.dart';
import 'domain/models/config.dart';
import 'presentation/splash/bloc/splash_bloc.dart';
import 'presentation/splash/splash_page.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light
  ));
  await Hive.initFlutter();
  Hive.registerAdapter(ConfigAdapter());
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
        create: (_) =>  SplashBloc(
          configRepository: HiveConfigRepository()
        ),
        child: const SplashPage(),
      ),
    );
  }
}



