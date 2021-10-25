import 'package:flutter/material.dart';
import 'package:lyrics_app/styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body:  Column(
        children: [
          Container(
            width: size.width,
            height: 50.0,
            color: blueDark,
          )
        ],
      ),
      
    );
  }
}