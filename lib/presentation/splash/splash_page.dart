import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lyrics_app/presentation/splash/bloc/splash_bloc.dart';
import 'package:lyrics_app/presentation/shared/custom_curves.dart';
import 'package:lyrics_app/presentation/welcome/welcome_page.dart';
import 'package:lyrics_app/presentation/wrapper/wrapper_page.dart';


import '../../styles.dart';


class SplashPage extends StatelessWidget {
  const SplashPage({ Key? key }) : super(key: key);

  void _navigateOtherPage(context,page){
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => page
    ));
  }

   @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    BlocProvider.of<SplashBloc>(context).add(
          LoadedSplashEvent()
    );
    
    return BlocListener<SplashBloc,SplashState>(
      listener: (context ,state){
        if(state is ItsTheFirtsTime) {
          _navigateOtherPage(context,const WelcomePage());
        }else if(state is ItsNotTheFirtsTime){
          _navigateOtherPage(context, WrapperPage());
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
              alignment: Alignment(0,160.4),
              child: ClipPath(
                clipper: BottomCurve(),
                child: Container(
                  height: size.height * 0.99,
                  color: blueDark,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text('Lyrics App',style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                      color: blueDark
                    )),
                  ),
                  SizedBox(height: 25.0,),
                  Center(
                    child: CircularProgressIndicator(
                      backgroundColor: ligthBlue,
                      strokeWidth: 5.0,
                      valueColor: AlwaysStoppedAnimation<Color>(blueDark),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}