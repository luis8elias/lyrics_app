import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:lyrics_app/presentation/lyric/create/create_lyric_page.dart';

import 'package:lyrics_app/styles.dart';

import 'package:lyrics_app/utils/navigator.dart';
import 'package:lyrics_app/utils/svg_icons.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 40,
        centerTitle: true,
        title: Text("Mi Perfil", style: titleStyle),
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        actions: [],
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: <Widget>[
              Row(
                children: const <Widget>[
                  Expanded(
                    child: CircleAvatar(
                      backgroundColor: Colors.brown,
                      child: const Text('AH'),
                    ),
                  ),
                  Expanded(
                    child: Text('Usuario', textAlign: TextAlign.center),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  print('jala');
                },
                child: Row(
                  children: <Widget>[Icon(Icons.logout), Text('Logout')],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
