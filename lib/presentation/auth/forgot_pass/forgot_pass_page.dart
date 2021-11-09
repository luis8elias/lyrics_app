import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lyrics_app/data/repositories/dio_auth_repositry.dart';
import 'package:lyrics_app/presentation/auth/forgot_pass/bloc/forgot_pass_bloc.dart';
import 'package:lyrics_app/presentation/auth/verification/verification_page.dart';
import 'package:lyrics_app/presentation/shared/custom_curves.dart';
import 'package:lyrics_app/utils/custom_alert.dart';
import 'package:lyrics_app/utils/navigator.dart';
import '../../../styles.dart';


class ForgotPassPage extends StatelessWidget {
  const ForgotPassPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ForgotPassBloc(
        authRepository: DioAuthRepository()
      ),
      child: ForgotPassPageUI(),
    );
  }
}

class ForgotPassPageUI extends StatefulWidget {
  const ForgotPassPageUI({ Key? key }) : super(key: key);

  @override
  _ForgotPassPageUIState createState() => _ForgotPassPageUIState();
}

class _ForgotPassPageUIState extends State<ForgotPassPageUI> {

  final emailController = TextEditingController();
  
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
  

  @override
  Widget build(BuildContext context) {

  
    final size = MediaQuery.of(context).size;
    final btnWidth = 120.0;
    final btnHeigth = 60.0;

    final _bloc = BlocProvider.of<ForgotPassBloc>(context);

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
              '¿Olvidaste tu contraseña?',
              style: TextStyle(color: Colors.blue, fontSize: 34),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: size.width / 9,
                right: size.width / 9,
                top: size.height / 2),
            child: Container(
              width: 320,
              height: 300,
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                labelText: 'Ingresar tu correo electrónico'),
              ),
            ),
          ),
          BlocBuilder<ForgotPassBloc,ForgotPassState>(
            builder: (context,state){

              WidgetsBinding.instance?.addPostFrameCallback((_){

                if(state is MailNotSended){

                  CustomAlert.showErrorCustomText(
                    context: context,
                    desc: 'Inténtalo de nuevo',
                    title: state.message
                  );

                  if(state.message == 
                    'Ya tienes una solicitud enviada, revisa tu bandeja en el correo electrónico'){
                    navigateToPage(context,VerificationPage());
                  }

                }else if(state is MailSended){
                  CustomAlert.showSuccesCustomText(
                    context: context,
                    desc: '',
                    title: state.message
                  );
                  navigateToPage(context,VerificationPage()); 

                }
              });
              if(state is TryingToRestorePass){

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
                          ForgotPassword(
                            email: emailController.text,
                          )
                        );
                      },
                      child: Text(
                        'Restablecer',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                );
              }

          }),
          Padding(
            padding: EdgeInsets.only(
                left: size.width / 25,
                right: size.width / 9,
                top: size.height / 13),
            child: Container(
              width: 25,
              height: 25,
              child: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(
                  'assets/arrow-left.svg',
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
