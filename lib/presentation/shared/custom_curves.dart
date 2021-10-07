import 'package:flutter/material.dart';

class BottomCurve extends CustomClipper<Path>{
   @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 414;
    final double _yScaling = size.height / 896;
    path.lineTo(458.043 * _xScaling,349.5 * _yScaling);
    path.cubicTo(457.765 * _xScaling,353.356 * _yScaling,454.414 * _xScaling,356.256 * _yScaling,450.558 * _xScaling,355.979 * _yScaling,);
    path.cubicTo(450.558 * _xScaling,355.979 * _yScaling,-97.022 * _xScaling,316.52 * _yScaling,-97.022 * _xScaling,316.52 * _yScaling,);
    path.cubicTo(-100.878 * _xScaling,316.243 * _yScaling,-103.779 * _xScaling,312.891 * _yScaling,-103.501 * _xScaling,309.035 * _yScaling,);
    path.cubicTo(-103.501 * _xScaling,309.035 * _yScaling,-81.9341 * _xScaling,9.74325 * _yScaling,-81.9341 * _xScaling,9.74325 * _yScaling,);
    path.cubicTo(-81.6523 * _xScaling,5.83194 * _yScaling,-76.0951 * _xScaling,5.36218 * _yScaling,-75.1607 * _xScaling,9.17069 * _yScaling,);
    path.cubicTo(-52.4609 * _xScaling,101.694 * _yScaling,54.6555 * _xScaling,144.268 * _yScaling,134.676 * _xScaling,92.5707 * _yScaling,);
    path.cubicTo(134.676 * _xScaling,92.5707 * _yScaling,219.762 * _xScaling,37.6008 * _yScaling,219.762 * _xScaling,37.6008 * _yScaling,);
    path.cubicTo(297.218 * _xScaling,-6.64407 * _yScaling,391.09 * _xScaling,-11.45 * _yScaling,472.659 * _xScaling,24.6534 * _yScaling,);
    path.cubicTo(472.659 * _xScaling,24.6534 * _yScaling,480.684 * _xScaling,28.2053 * _yScaling,480.684 * _xScaling,28.2053 * _yScaling,);
    path.cubicTo(480.981 * _xScaling,28.3369 * _yScaling,481.164 * _xScaling,28.641 * _yScaling,481.141 * _xScaling,28.9654 * _yScaling,);
    path.cubicTo(481.141 * _xScaling,28.9654 * _yScaling,458.043 * _xScaling,349.5 * _yScaling,458.043 * _xScaling,349.5 * _yScaling,);
    path.cubicTo(458.043 * _xScaling,349.5 * _yScaling,458.043 * _xScaling,349.5 * _yScaling,458.043 * _xScaling,349.5 * _yScaling,);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
  
}

class MiddleCurve extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 414;
    final double _yScaling = size.height / 896;
    path.lineTo(44.5687 * _xScaling,-112.381 * _yScaling);
    path.cubicTo(46.5017 * _xScaling,-115.729 * _yScaling,50.7828 * _xScaling,-116.876 * _yScaling,54.1308 * _xScaling,-114.943 * _yScaling,);
    path.cubicTo(54.1308 * _xScaling,-114.943 * _yScaling,591.42 * _xScaling,195.261 * _yScaling,591.42 * _xScaling,195.261 * _yScaling,);
    path.cubicTo(594.768 * _xScaling,197.194 * _yScaling,595.915 * _xScaling,201.475 * _yScaling,593.982 * _xScaling,204.823 * _yScaling,);
    path.cubicTo(593.982 * _xScaling,204.823 * _yScaling,420.352 * _xScaling,505.559 * _yScaling,420.352 * _xScaling,505.559 * _yScaling,);
    path.cubicTo(418.131 * _xScaling,509.405 * _yScaling,412.236 * _xScaling,507.114 * _yScaling,413.197 * _xScaling,502.777 * _yScaling,);
    path.cubicTo(413.197 * _xScaling,502.777 * _yScaling,413.197 * _xScaling,502.777 * _yScaling,413.197 * _xScaling,502.777 * _yScaling,);
    path.cubicTo(436.706 * _xScaling,396.604 * _yScaling,347.414 * _xScaling,299.418 * _yScaling,239.634 * _xScaling,313.871 * _yScaling,);
    path.cubicTo(239.634 * _xScaling,313.871 * _yScaling,128.256 * _xScaling,328.806 * _yScaling,128.256 * _xScaling,328.806 * _yScaling,);
    path.cubicTo(128.256 * _xScaling,328.806 * _yScaling,128.256 * _xScaling,328.806 * _yScaling,128.256 * _xScaling,328.806 * _yScaling,);
    path.cubicTo(27.552 * _xScaling,336.707 * _yScaling,-70.7317 * _xScaling,295.29 * _yScaling,-135.409 * _xScaling,217.698 * _yScaling,);
    path.cubicTo(-135.409 * _xScaling,217.698 * _yScaling,-141.287 * _xScaling,210.646 * _yScaling,-141.287 * _xScaling,210.646 * _yScaling,);
    path.cubicTo(-141.516 * _xScaling,210.372 * _yScaling,-141.549 * _xScaling,209.984 * _yScaling,-141.371 * _xScaling,209.675 * _yScaling,);
    path.cubicTo(-141.371 * _xScaling,209.675 * _yScaling,44.5687 * _xScaling,-112.381 * _yScaling,44.5687 * _xScaling,-112.381 * _yScaling,);
    path.cubicTo(44.5687 * _xScaling,-112.381 * _yScaling,44.5687 * _xScaling,-112.381 * _yScaling,44.5687 * _xScaling,-112.381 * _yScaling,);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
  
}


class TopCurve extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 414;
    final double _yScaling = size.height / 896;
    path.lineTo(-120 * _xScaling,-70 * _yScaling);
    path.cubicTo(-120 * _xScaling,-73.866 * _yScaling,-116.866 * _xScaling,-77 * _yScaling,-113 * _xScaling,-77 * _yScaling,);
    path.cubicTo(-113 * _xScaling,-77 * _yScaling,436 * _xScaling,-77 * _yScaling,436 * _xScaling,-77 * _yScaling,);
    path.cubicTo(439.866 * _xScaling,-77 * _yScaling,443 * _xScaling,-73.866 * _yScaling,443 * _xScaling,-70 * _yScaling,);
    path.cubicTo(443 * _xScaling,-70 * _yScaling,443 * _xScaling,230.068 * _yScaling,443 * _xScaling,230.068 * _yScaling,);
    path.cubicTo(443 * _xScaling,233.99 * _yScaling,437.491 * _xScaling,234.858 * _yScaling,436.285 * _xScaling,231.126 * _yScaling,);
    path.cubicTo(436.285 * _xScaling,231.126 * _yScaling,436.285 * _xScaling,231.126 * _yScaling,436.285 * _xScaling,231.126 * _yScaling,);
    path.cubicTo(406.994 * _xScaling,140.474 * _yScaling,297.095 * _xScaling,105.709 * _yScaling,220.997 * _xScaling,163.023 * _yScaling,);
    path.cubicTo(220.997 * _xScaling,163.023 * _yScaling,140.082 * _xScaling,223.966 * _yScaling,140.082 * _xScaling,223.966 * _yScaling,);
    path.cubicTo(140.082 * _xScaling,223.966 * _yScaling,140.082 * _xScaling,223.966 * _yScaling,140.082 * _xScaling,223.966 * _yScaling,);
    path.cubicTo(66.0062 * _xScaling,273.664 * _yScaling,-27.2773 * _xScaling,285.204 * _yScaling,-111.23 * _xScaling,255.057 * _yScaling,);
    path.cubicTo(-111.23 * _xScaling,255.057 * _yScaling,-119.49 * _xScaling,252.091 * _yScaling,-119.49 * _xScaling,252.091 * _yScaling,);
    path.cubicTo(-119.796 * _xScaling,251.981 * _yScaling,-120 * _xScaling,251.691 * _yScaling,-120 * _xScaling,251.365 * _yScaling,);
    path.cubicTo(-120 * _xScaling,251.365 * _yScaling,-120 * _xScaling,-70 * _yScaling,-120 * _xScaling,-70 * _yScaling,);
    path.cubicTo(-120 * _xScaling,-70 * _yScaling,-120 * _xScaling,-70 * _yScaling,-120 * _xScaling,-70 * _yScaling,);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
  
}