import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe

import 'package:lyrics_app/styles.dart';
import 'package:lyrics_app/utils/edge_alert.dart';

class CustomAlert{

  static const  DEFAULT_DURATION = 2;

  static void showErrorCustomText({required BuildContext context,required String desc,required title}){
    EdgeAlert.show(
      context,
      title: title, 
      description: desc,
      gravity: EdgeAlert.BOTTOM,
      icon: Icons.error,
      backgroundColor: red,
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
      backgroundColor: green,
      duration: DEFAULT_DURATION
    );

  }




}