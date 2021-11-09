import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lyrics_app/data/repositories/dio_auth_repositry.dart';
import 'package:lyrics_app/presentation/auth/login/login_page.dart';
import 'package:lyrics_app/presentation/auth/restore_pass/bloc/restore_pass_bloc.dart';
import 'package:lyrics_app/presentation/shared/custom_curves.dart';
import 'package:lyrics_app/utils/custom_alert.dart';
import 'package:lyrics_app/utils/navigator.dart';

import '../../../styles.dart';

class RestorePassPage extends StatelessWidget {

  final String code;
  const RestorePassPage({ Key? key, required this.code }) : super(key: key);

 @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RestorePassBloc(
        authRepository: DioAuthRepository()
      ),
      child: RestorePassPageUI(
        code: code,
      ),
    );
  }
}

class RestorePassPageUI extends StatefulWidget {

  final String code;


  const RestorePassPageUI({ Key? key,required this.code }) : super(key: key);

  @override
  _RestorePassPageUIState createState() => _RestorePassPageUIState();

  
}

class _RestorePassPageUIState extends State<RestorePassPageUI> {

  final passController = TextEditingController();
  final passController2 = TextEditingController();
  
  
  @override
  void dispose() {
    passController.dispose();
    passController2.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final btnWidth = 120.0;
    final btnHeigth = 60.0;

    final _bloc = BlocProvider.of<RestorePassBloc>(context);

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
          Padding(
            padding: EdgeInsets.only(
                left: size.width / 9,
                right: size.width / 9,
                top: size.height / 2.9),
            child: Text(
              'Restablecer Contraseña',
              style: TextStyle(color: Colors.blue, fontSize: 34),
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
                obscureText: true,
                controller: passController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                labelText: 'Escribir su nueva contraseña'),
              )
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: size.width / 9,
                right: size.width / 9,
                top: size.height / 1.6),
            child: Container(
              width: 320,
              height: 300,
              child: TextFormField(
                obscureText: true,
                controller: passController2,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                labelText: 'Escribe otra ves su contraseña'),
              )
            ),
          ),
          BlocBuilder<RestorePassBloc,RestorePassState>(
            builder: (context,state){

              WidgetsBinding.instance?.addPostFrameCallback((_){

                if(state is PasswordSaved){

                  CustomAlert.showSuccesCustomText(
                    context: context,
                    desc: '',
                    title: state.message
                  );
                  navigateToPage(context,LoginPage());

                }else if(state is PasswordNotSaved){

                  CustomAlert.showErrorCustomText(
                    context: context,
                    desc: 'Inténtalo de nuevo',
                    title: state.message
                  );
                }
              });

              if(state is TryingToSaveNewPass){

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
                return  Padding(
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

                        if(passController.text != passController2.text){

                          CustomAlert.showErrorCustomText(
                            context: context,
                            desc: 'Inténtalo de nuevo',
                            title: 'Las contraseñas no coinciden'
                          );
                        }else{
                          _bloc.add(
                            SaveNewPassword(
                              code: widget.code,
                              password: passController2.text
                            )
                          );
                        }
                        
                      },
                      child: Text(
                        'Guardar',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}


