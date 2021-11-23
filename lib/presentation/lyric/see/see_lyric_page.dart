import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lyrics_app/domain/models/lyric.dart';
import 'package:lyrics_app/presentation/wrapper/wrapper_page.dart';
import 'package:lyrics_app/styles.dart';
import 'package:lyrics_app/utils/navigator.dart';
import 'package:lyrics_app/utils/svg_icons.dart';

class SeeLyricPage extends StatelessWidget {
  const SeeLyricPage({Key? key, required this.lyric}) : super(key: key);

  final Lyric lyric;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          centerTitle: true,
          title: Text(lyric.name, style: titleStyle),
          leadingWidth: 50,
          leading: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: IconButton(
              splashRadius: 25,
              onPressed: () {
                navigateTo(context, WrapperPage(pageIndex: 1));
              },
              icon: Container(
                child: SvgPicture.asset(SvgIcons.arrowLeft, color: blueDark),
              ),
            ),
          ),
          backgroundColor: Theme.of(context).backgroundColor,
          elevation: 0,
        ),
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                Text(
                  lyric.lyric,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ));
  }
}
