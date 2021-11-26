import 'package:flutter/material.dart';

import 'package:lyrics_app/styles.dart';
import 'package:lyrics_app/utils/navigator.dart';

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
                children: <Widget>[
                  Expanded(
                    child: Container(
                      width: 90,
                      height: 90,
                      child: CircleAvatar(
                        backgroundColor: Colors.brown,
                        child: const Text(
                          'AH',
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
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
