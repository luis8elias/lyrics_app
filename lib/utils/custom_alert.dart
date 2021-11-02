import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe

import 'package:lyrics_app/styles.dart';
import 'package:lyrics_app/utils/edge_alert.dart';

class CustomAlert{

  static const  DEFAULT_DURATION = 2;


  static void showSucces({required BuildContext context,required String desc}){
    EdgeAlert.show(
      context,
      title: 'Operacion Exitosa',
      description: desc,
      gravity: EdgeAlert.BOTTOM,
      icon: Icons.check,
      backgroundColor: AlertsColors.success,
      duration: DEFAULT_DURATION
    );

  }

  static void showError({required BuildContext context}){
    EdgeAlert.show(
      context,
      title: 'Operacion Fallida', 
      description: 'Algo salió mal',
      gravity: EdgeAlert.BOTTOM,
      icon: Icons.error,
      backgroundColor: AlertsColors.error,
      duration: DEFAULT_DURATION
    );

  }

  static void showErrorCustomText({required BuildContext context,required String desc,required title}){
    EdgeAlert.show(
      context,
      title: title, 
      description: desc,
      gravity: EdgeAlert.BOTTOM,
      icon: Icons.error,
      backgroundColor: AlertsColors.error,
      duration: DEFAULT_DURATION
    );

  }


  static void showSuccesCustomText({required BuildContext context,required String desc,required title}){
    EdgeAlert.show(
      context,
      title: title, 
      description: desc,
      gravity: EdgeAlert.BOTTOM,
      icon: Icons.error,
      backgroundColor: AlertsColors.success,
      duration: DEFAULT_DURATION
    );

  }




}