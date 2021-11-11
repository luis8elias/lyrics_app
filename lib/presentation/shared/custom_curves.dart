import 'package:flutter/material.dart';

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


