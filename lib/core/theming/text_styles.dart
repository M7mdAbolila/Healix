import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

/// App Text Styles class that contains all text types with names and sizes in figma file
class AppTextStyles {
  static TextStyle fontTitleText({Color? color}) => GoogleFonts.poppins(
        fontSize: 22.sp,
        fontWeight: FontWeight.w700,
        color: color,
      );

  static TextStyle fontBodyText({Color? color}) => GoogleFonts.poppins(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: color,
      );
  static TextStyle fontHeaderText({Color? color}) => GoogleFonts.poppins(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: color,
      );
  static TextStyle fontTextInput({Color? color}) => GoogleFonts.poppins(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: color,
      );
  static TextStyle fontParagraphText({Color? color}) => GoogleFonts.poppins(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: color,
      );
  static TextStyle fontSmallerText({Color? color}) => GoogleFonts.inter(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: color,
      );
}
