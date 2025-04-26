import 'package:flutter/material.dart';

class ShadowsManager {
  static BoxShadow softShadow({Color? color}) => BoxShadow(
        color: color ?? Colors.black26,
        blurRadius: 13,
        spreadRadius: -8,
        offset: const Offset(0, 16),
      );
}
