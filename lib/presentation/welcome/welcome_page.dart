import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lyrics_app/data/repositories/hive_config_repository.dart';
import 'package:lyrics_app/presentation/auth/login_page.dart';
import 'package:lyrics_app/presentation/shared/custom_curves.dart';
import 'package:lyrics_app/presentation/welcome/bloc/welcome_bloc.dart';
import 'package:lyrics_app/styles.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WelcomeBloc(configRepository: HiveConfigRepository()),
      child: const WelcomePageUI(),
    );
  }
}

class WelcomePageUI extends StatelessWidget {
  const WelcomePageUI({Key? key}) : super(key: key);

  void _navigateOtherPage(context, page) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => page));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final btnWidth = 120.0;
    final btnHeigth = 60.0;
    return BlocListener<WelcomeBloc, WelcomeState>(
        listener: (context, state) {
          if (state is StartButtonPressed) {
            _navigateOtherPage(context, const LoginPage());
          }
        },
        child: Scaffold(
            body: Stack(
          children: [
            Align(
              alignment: Alignment(0, -15),
              child: ClipPath(
                clipper: MiddleCurve(),
                child: Container(
                  height: size.height * 0.99,
                  color: ligthBlue,
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, -15),
              child: ClipPath(
                clipper: TopCurve(),
                child: Container(
                  height: size.height * 0.99,
                  color: blueDark,
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, 160.4),
              child: ClipPath(
                clipper: BottomCurve(),
                child: Container(
                  height: size.height * 0.99,
                  color: blueDark,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width / 9,
                  right: size.width / 9,
                  top: size.height / 2.7),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.music_note,
                    size: 60.0,
                    color: ligthBlue,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text('Lyrics App',
                      style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w700,
                          color: blueDark)),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                      'Las letras de tus canciones pesonalizadas a la palma de tu mano.',
                      style: TextStyle(
                          fontSize: 25,
                          color: ligthBlue,
                          fontWeight: FontWeight.normal)),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: size.width - (btnWidth + 25),
                top: size.height - (btnHeigth + 25),
              ),
              child: Container(
                width: btnWidth,
                height: btnHeigth,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    alignment: Alignment.center,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadiusDirectional.all(Radius.circular(10.0))),
                    side: BorderSide(width: 2, color: Colors.white),
                  ),
                  onPressed: () {
                    BlocProvider.of<WelcomeBloc>(context)
                        .add(OnPressStartButton());
                  },
                  child: Text(
                    'Comenzar',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
            ),
          ],
        )));
  }
}
