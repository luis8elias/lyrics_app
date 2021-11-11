import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lyrics_app/data/repositories/dio_auth_repositry.dart';
import 'package:lyrics_app/presentation/auth/restore_pass/restore_pass_page.dart';
import 'package:lyrics_app/presentation/auth/verification/bloc/verification_bloc.dart';

import 'package:lyrics_app/presentation/shared/custom_curves.dart';
import 'package:lyrics_app/utils/custom_alert.dart';
import 'package:lyrics_app/utils/navigator.dart';

import '../../../styles.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => VerificationBloc(
        authRepository: DioAuthRepository()
      ),
      child: VerificationPageUI(),
    );
  }
}

class VerificationPageUI extends StatefulWidget {


  const VerificationPageUI({ Key? key }) : super(key: key);

  @override
  _VerificationPageUIState createState() => _VerificationPageUIState();
}

class _VerificationPageUIState extends State<VerificationPageUI> {

  final codeController = TextEditingController();
  
  @override
  void dispose() {
    codeController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {


    final size = MediaQuery.of(context).size;
    final btnWidth = 120.0;
    final btnHeigth = 60.0;

    final _bloc = BlocProvider.of<VerificationBloc>(context);

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
              'Verificación',
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
                controller: codeController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                labelText: 'Ingresar el código que se envio a correo '),
              )
            ),
          ),
          BlocBuilder<VerificationBloc,VerificationState>(
            builder: (context,state){

              WidgetsBinding.instance?.addPostFrameCallback((_){

                if(state is SuccessfulCode){

                  CustomAlert.showSuccesCustomText(
                    context: context,
                    desc: '',
                    title: state.message
                  );
                  navigateToPage(context,RestorePassPage(
                    code: state.code,
                  ));

                }else if(state is WrongCode){

                  CustomAlert.showErrorCustomText(
                    context: context,
                    desc: 'Inténtalo de nuevo',
                    title: state.message
                  );
                }
              });

              if(state is VerificationInProcess){
                 
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
                    decoration: BoxDecoration(
                      color: blueDark,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    width: btnWidth,
                    height: btnHeigth,
                    child: TextButton(
                    
                      onPressed: (){
                        _bloc.add(VerificateCode(code: codeController.text));
                      },
                      child: Text('Verificar' ,style: TextStyle(color: Colors.white),),
                    )
                  ),
                );
              }
            }
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

