import 'package:awesome_select/awesome_select.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lyrics_app/styles.dart';
import 'package:lyrics_app/utils/svg_icons.dart';

class GroupPage extends StatefulWidget {
  GroupPage({Key? key}) : super(key: key);

  @override
  _GroupPageState createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Crear Grupo", style: titleStyle),
        leadingWidth: 50,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: IconButton(
            splashRadius: 25,
            onPressed: () {},
            icon: Container(
              child: SvgPicture.asset(SvgIcons.arrowLeft, color: blueDark),
            ),
          ),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 14, right: 14, top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Text('Nombre', style: titleStyle),
              ),
              SizedBox(height: 10),
              Material(
                elevation: 1,
                shadowColor: shadowColor,
                borderRadius: BorderRadius.all(Radius.circular(15)),
                child: TextField(
                  cursorColor: Theme.of(context).primaryColor,
                  style: TextStyle(color: Colors.black, fontSize: 18),
                  decoration: InputDecoration(
                      hintText: 'La Fiera de Ojinaga',
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Align(
                  alignment: Alignment.center,
                  child: ElevatedButton.icon(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: blueDark)))),
                      onPressed: () {},
                      icon: Padding(
                        padding: EdgeInsets.all(7),
                        child: Icon(
                          Icons.save,
                          size: 30,
                        ),
                      ),
                      label: Text(
                        'guardar',
                        style: TextStyle(fontSize: 18),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
