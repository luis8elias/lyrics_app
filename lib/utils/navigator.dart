
 import 'package:flutter/material.dart';

void navigateTo(BuildContext context, Widget page){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) =>page));
}

void navigateReplacement(BuildContext context, Widget page){
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) =>page));
}
