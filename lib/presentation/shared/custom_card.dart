import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lyrics_app/styles.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard(
      {
        Key? key,
        required this.text,
        required this.value,
        required this.icon,
        required this.onTap
      })
      : super(key: key);

  final String text;
  final String value;
  final String icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [blueDark, Color(0xff5E9DF2)]),
                  borderRadius:
                      BorderRadiusDirectional.all(Radius.circular(10.0)),
                ),
                width: double.infinity,
                height: 120,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(text,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold)),
                )),
            Positioned(
                top: 55,
                left: 10,
                child: Transform.rotate(
                  angle: 3.1416 * 3.85,
                  child: SvgPicture.asset(
                    icon,
                    color: Color(0xff5E9DF2),
                    height: 50,
                  ),
                )),
            Positioned(
              left: 200,
              top: 35,
              child: Text(value,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold)),
            )
          ],
        ),
      ),
    );
  }
}
