import 'package:flutter/material.dart';
import 'package:lyrics_app/presentation/forgotPass/forgot_pass_page.dart';
import 'package:lyrics_app/presentation/registration/registration_page.dart';

import 'package:lyrics_app/presentation/shared/custom_curves.dart';
import 'package:lyrics_app/presentation/wrapper/wrapper_page.dart';

import '../../styles.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
            alignment: Alignment(0, 160.4),
            child: ClipPath(
              clipper: BottomCurve(),
              child: Container(
                height: size.height * 0.99,
                color: blueDark,
              ),
            ),
          ),

//Titulo
          Padding(
            padding: EdgeInsets.only(
                left: size.width / 9,
                right: size.width / 9,
                top: size.height / 2.9),
            child: Text(
              'Iniciar Sesion',
              style: TextStyle(color: Colors.blue, fontSize: 34),
            ),
          ),

//TextFiles
          Padding(
            padding: EdgeInsets.only(
                left: size.width / 9,
                right: size.width / 9,
                top: size.height / 2.4),
            child: Container(
              width: 320,
              height: 300,
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Correo'),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(
                left: size.width / 9,
                right: size.width / 9,
                top: size.height / 2.0),
            child: Container(
              width: 320,
              height: 300,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Contaseña',
                ),
              ),
            ),
          ),
//TextFile
          Padding(
            padding: EdgeInsets.only(
                left: size.width / 9,
                right: size.width / 9,
                top: size.height / 1.64),
            child: Text(
              'No tienes una cuenta?',
              style: TextStyle(color: Colors.blue, fontSize: 15),
            ),
          ),

//boton
          Padding(
            padding: EdgeInsets.only(
                left: size.width / 15,
                right: size.width / 9,
                top: size.height / 1.7),
            child: Container(
              width: 300,
              height: 25,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  alignment: Alignment.topLeft,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadiusDirectional.all(Radius.circular(10.0))),
                  side: BorderSide(width: 0, color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          //Pendiente redireccion
                          builder: (BuildContext context) => ForgotPassPage()));
                },
                child: Text(
                  '¿Olvidaste tu contraseña?',
                  style: TextStyle(color: Colors.blue, fontSize: 14),
                ),
              ),
            ),
          ),

//boton
          Padding(
            padding: EdgeInsets.only(
                left: size.width / 2,
                right: size.width / 9,
                top: size.height / 1.64),
            child: Container(
              width: 100,
              height: 25,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  alignment: Alignment.center,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadiusDirectional.all(Radius.circular(10.0))),
                  side: BorderSide(width: 0, color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          //Pendiente redireccion
                          builder: (BuildContext context) =>
                              RegistrationPage()));
                },
                child: Text(
                  'Registrar',
                  style: TextStyle(color: Colors.blue, fontSize: 14),
                ),
              ),
            ),
          ),
//Boton
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
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => WrapperPage()));
                },
                child: Text(
                  'Comenzar',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
