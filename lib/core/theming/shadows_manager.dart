import 'package:flutter/material.dart';

class ShadowsManager {
  static BoxShadow softShadow({Color? color}) => BoxShadow(
        color: color ?? Colors.black26,
        blurRadius: 13,
        spreadRadius: -8,
        offset: const Offset(0, 16),
      );
  static BoxShadow softerShadow({Color? color}) => BoxShadow(
        color: color ?? Colors.black12,
        blurRadius: 21,
        spreadRadius: 0,
        offset: const Offset(0, 4),
      );
  static BoxShadow upwardShadow({Color? color}) => BoxShadow(
        color: color ?? Colors.black12,
        blurRadius: 30,
        spreadRadius: 0,
        offset: const Offset(0, -11),
      );
}
