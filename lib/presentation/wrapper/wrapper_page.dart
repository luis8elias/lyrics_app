import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lyrics_app/presentation/home/home_page.dart';
import 'package:lyrics_app/presentation/shared/custom_navigation_bar.dart';
import 'package:lyrics_app/styles.dart';

class WrapperPage extends StatelessWidget {
  const WrapperPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: 
        FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: CustomNavigationBar(
          index: 0,
          onIndexSelected: (index){
           
          },
        ),
        floatingActionButton: Container(
          padding: const EdgeInsets.all(3.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle
          ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: blueDark
            ),
            child: FloatingActionButton(
              onPressed: (){
                //_bloc.add(IndexChangedEvent(index: 2));
              },
              elevation: 0,
              highlightElevation: 0,
              foregroundColor: Colors.white,
              splashColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(
                  'assets/search.svg',
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: IndexedStack(
                index: 0,
                children: [
                  const HomePage(),
                  Container(),
                  Container(),
                  Container(),
                  Container()
                ],
              )
            ),
          ],
        ),
      );
  }
}