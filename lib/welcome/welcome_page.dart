import 'package:flutter/material.dart';
import 'package:lyrics_app/shared/custom_curves.dart';
import 'package:lyrics_app/styles.dart';
import 'package:lyrics_app/wrapper/wrapper_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final btnWidth = 120.0;
    final btnHeigth = 60.0;
    return Scaffold(
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
          Padding(
            padding: EdgeInsets.only(
              left: size.width / 9,
              right: size.width /9,
              top: size.height /2.7
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.music_note ,
                  size: 60.0,
                  color: ligthBlue,
                ),
                SizedBox(height: 10.0,),
                Text('Lyrics App',style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  color: blueDark
                )),
                SizedBox(height: 10.0,),
                Text('Las letras de tus canciones pesonalizadas a la palma de tu mano.',
                  style: TextStyle(
                  fontSize: 25,
                  color: ligthBlue,
                  fontWeight: FontWeight.normal
                )),
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
                    borderRadius: BorderRadiusDirectional.all(
                      Radius.circular(10.0)
                    )
                  ),
                  side: BorderSide(
                    width: 2,
                    color: Colors.white
                  ),
                ),
                onPressed: () { 
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => WrapperPage()
                    )
                  );

                },
                child: Text('Comenzar', style: TextStyle(
                    color: Colors.white,
                    fontSize: 15
                  ),),
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}