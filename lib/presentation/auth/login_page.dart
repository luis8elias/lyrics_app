import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lyrics_app/data/repositories/dio_auth_repositry.dart';
import 'package:lyrics_app/presentation/auth/bloc/auth_bloc.dart';
import 'package:lyrics_app/presentation/auth/forgot_pass_page.dart';
import 'package:lyrics_app/presentation/auth/registration_page.dart';

import 'package:lyrics_app/presentation/shared/custom_curves.dart';
import 'package:lyrics_app/presentation/wrapper/wrapper_page.dart';
import 'package:lyrics_app/utils/custom_alert.dart';

import '../../styles.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthBloc(
        authRepository: DioAuthRepository()
      ),
      child: LoginPageUI(),
    );
  }
}

class LoginPageUI extends StatefulWidget {
  const LoginPageUI({ Key? key }) : super(key: key);

  @override
  _LoginPageUIState createState() => _LoginPageUIState();
}

class _LoginPageUIState extends State<LoginPageUI> {

  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }




@override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final btnWidth = 120.0;
    final btnHeigth = 60.0;

    final _bloc = BlocProvider.of<AuthBloc>(context);


    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              'Iniciar Sesión',
              style: TextStyle(color: blueDark, fontSize: 34),
            ),
          ),

//TextFiles
          Padding(
            padding: EdgeInsets.only(
                left: size.width / 9,
                right: size.width / 9,
                top: size.height / 2.3),
            child: Container(
              width: 320,
              height: 300,
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    labelText: 'Correo'),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(
                left: size.width / 9,
                right: size.width / 9,
                top: size.height / 1.8),
            child: Container(
              width: 320,
              height: 300,
              child: TextFormField(
                controller: passController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  labelText: 'Contraseña',
                ),
              ),
            ),
          ),
          //TextFile
          Padding(
            padding: EdgeInsets.only(
                left: size.width / 9,
                right: size.width / 9,
                top: size.height / 1.4),
            child: Text(
              'No tienes una cuenta?',
              style: TextStyle(color: blueDark, fontSize: 15),
            ),
          ),

          //boton
          Padding(
            padding: EdgeInsets.only(
                left: size.width / 15,
                right: size.width / 9,
                top: size.height / 1.35),
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ForgotPassPage()));
                },
                child: Text(
                  '¿Olvidaste tu contraseña?',
                  style: TextStyle(color: blueDark, fontSize: 14),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: size.width / 2,
                right: size.width / 9,
                top: size.height / 1.355),
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
                  style: TextStyle(color: blueDark, fontSize: 14),
                ),
              ),
            ),
          ),
          BlocBuilder<AuthBloc,AuthState>(
            builder: (context,state){

              WidgetsBinding.instance?.addPostFrameCallback((_){

                if(state is LoginFailed){

                  CustomAlert.showErrorCustomText(
                    context: context,
                    desc: 'Inténtalo de nuevo',
                    title: state.message
                  );

                }else if(state is LoginSuccess){
                  CustomAlert.showSuccesCustomText(
                    context: context,
                    desc: '',
                    title: state.data.message
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WrapperPage()),
                  );

                }
              });


              if(state is TryingToLogin){
                return Padding(
                  padding: EdgeInsets.only(
                    left: size.width - 80,
                    top: size.height - (btnHeigth + 25),
                  ),
                  child: CircularProgressIndicator(
                    backgroundColor: ligthBlue,
                    strokeWidth: 5.0,
                    valueColor: AlwaysStoppedAnimation<Color>(blueDark),
                  ),
                );
              }else{
                return Padding(
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
                      _bloc.add(
                        DoLogin(
                          email: emailController.text,
                            password: passController.text
                          )
                        );
                        
                      },
                      child: Text(
                        'Comenzar',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                );
              }

            }
          )
        ],
      ),
    );
  }
}