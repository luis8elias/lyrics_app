import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lyrics_app/styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Bienvenido",
        style: TextStyle(color: Colors.white, fontSize: 28)),
        leading: GestureDetector(
          onTap: () {
            
          },
          child: SvgPicture.asset(
            'assets/arrow-left.svg',
            color: Colors.white,
          ),
        ),
        backgroundColor: blueDark,
        elevation: 0,
      ),
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