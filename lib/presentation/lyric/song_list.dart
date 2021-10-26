import 'package:flutter/material.dart';

class SongList extends StatelessWidget {
  const SongList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Canciones",
            style: TextStyle(color: Colors.white, fontSize: 28)),
        leading: GestureDetector(
          onTap: () {
            print('si jala el ontap salu2');
          },
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF2F80ED),
        elevation: 0,
      ),
    );
    return Container();
  }
}
