import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lyrics_app/styles.dart';
import 'package:lyrics_app/utils/svg_icons.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar(
      {Key? key, required this.index, required this.onIndexSelected})
      : super(key: key);

  final int index;
  final ValueChanged<int> onIndexSelected;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      child: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _customIconButton(icon: SvgIcons.home, innerIndex: 0),
              _customIconButton(icon: SvgIcons.musicNote1, innerIndex: 1),
              _customIconButton(icon: SvgIcons.size, innerIndex: 2),
              _customIconButton(icon: SvgIcons.user, innerIndex: 3),
            ],
          )
        )
      ),
    );
  }

  IconButton _customIconButton({required icon, required innerIndex}) {
    return IconButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        icon: SvgPicture.asset(
          icon,
          color: innerIndex == index ? blueDark : ligthBlue,
          width: 25.0,
        ),
        onPressed: () => onIndexSelected(innerIndex));
  }
}
