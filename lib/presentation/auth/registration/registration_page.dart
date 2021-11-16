import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lyrics_app/data/repositories/dio_auth_repository.dart';
import 'package:lyrics_app/presentation/auth/login/login_page.dart';
import 'package:lyrics_app/presentation/shared/custom_curves.dart';
import 'package:lyrics_app/utils/custom_alert.dart';
import 'package:lyrics_app/utils/navigator.dart';
import 'package:lyrics_app/utils/svg_icons.dart';

import '../../../styles.dart';
import 'bloc/registration_bloc.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegistrationBloc(authRepository: DioAuthRepository()),
      child: RegistrationPageUI(),
    );
  }
}

class RegistrationPageUI extends StatefulWidget {
  const RegistrationPageUI({Key? key}) : super(key: key);

  @override
  _RegistrationPageUIState createState() => _RegistrationPageUIState();
}

class _RegistrationPageUIState extends State<RegistrationPageUI> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final btnWidth = 120.0;
    final btnHeigth = 60.0;

    final _bloc = BlocProvider.of<RegistrationBloc>(context);

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
          Padding(
            padding: EdgeInsets.only(
                left: size.width / 9,
                right: size.width / 9,
                top: size.height / 2.9),
            child: Text(
              'Registrarse',
              style: TextStyle(color: Colors.blue, fontSize: 34),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: size.width / 9,
                right: size.width / 9,
                top: size.height / 2.3),
            child: Container(
              width: 320,
              height: 300,
              child: TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    labelText: 'Nombre'),
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
                controller: emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    labelText: 'Ingresa tu correo'),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: size.width / 9,
                right: size.width / 9,
                top: size.height / 1.45),
            child: Container(
              width: 320,
              height: 300,
              child: TextFormField(
                obscureText: true,
                controller: passController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    labelText: 'Ingresa tu contraseña'),
              ),
            ),
          ),
          BlocBuilder<RegistrationBloc, RegistrationState>(
            builder: (context, state) {
              WidgetsBinding.instance?.addPostFrameCallback((_) {
                if (state is UserNotSaved) {
                  CustomAlert.showErrorCustomText(
                      context: context,
                      desc: 'Inténtalo de nuevo',
                      title: state.message);
                } else if (state is UserSaved) {
                  CustomAlert.showSuccesCustomText(
                      context: context, desc: '', title: state.message);
                  navigateTo(context, LoginPage());
                }
              });

              if (state is TryingToSaveUser) {
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
              } else {
                return Padding(
                  padding: EdgeInsets.only(
                    left: size.width - (btnWidth + 25),
                    top: size.height - (btnHeigth + 25),
                  ),
                  child: Container(
                      decoration: BoxDecoration(
                          color: blueDark,
                          borderRadius: BorderRadius.circular(10)),
                      width: btnWidth,
                      height: btnHeigth,
                      child: TextButton(
                        onPressed: () {
                          _bloc.add(SaveNewUser(
                              name: nameController.text,
                              email: emailController.text,
                              password: passController.text));
                        },
                        child: Text(
                          'Guardar',
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                );
              }
            },
          ),
          Padding(
            padding: EdgeInsets.only(
                left: size.width / 25,
                right: size.width / 9,
                top: size.height / 13),
            child: Container(
              width: 25,
              height: 25,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(
                  SvgIcons.arrowLeft,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
