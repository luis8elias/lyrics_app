import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lyrics_app/styles.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({
    Key? key,
    required this.index,
    required this.onIndexSelected 
  }) : super(key: key);

  
  final int index;
  final ValueChanged<int> onIndexSelected;

  @override
  Widget build(BuildContext context) {
    return  ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft:  Radius.circular(20),
        topRight: Radius.circular(20)
      ),
      child: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _customIconButton(
                icon: 'home',
                innerIndex: 0
              ),
              _customIconButton(
                icon: 'music-note',
                innerIndex: 1
              ),
              const SizedBox(width: 100),
              _customIconButton(
                icon: 'collection',
                innerIndex: 3
              ),
              _customIconButton(
                icon: 'user',
                innerIndex: 4
              ),
            ],
          )
        )
      ),
    );
    
  } 

  IconButton _customIconButton({required icon, required innerIndex}){
    return  IconButton(
      splashColor: Colors.transparent, 
      highlightColor: Colors.transparent,
      icon: SvgPicture.asset(
         'assets/$icon-solid.svg',
        color: innerIndex == index ? blueDark : ligthBlue,
        width: 25.0,
      ),
      onPressed: ()=> onIndexSelected(innerIndex)
    );

  }

}