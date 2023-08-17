import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIconButton extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final Color iconColor;
  final double size;
  final IconData icon;
  const CustomIconButton({
    super.key,
    required this.height,
    required this.width,
    required this.color,
    required this.iconColor,
    required this.size,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: Icon(
        icon,
        size: size.r,
        color: iconColor,
      ),
    );
  }
}
