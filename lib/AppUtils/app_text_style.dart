import 'package:flutter/material.dart';
import 'package:flutter_object_detection_app/AppUtils/app_font_size.dart';
import 'package:flutter_object_detection_app/AppUtils/app_font_weight.dart';

/*
Title: AppTextStyle Used through App
Purpose:AppTextStyle Used through App
Created On:20/03/2024
Edited On:20/03/2024
Author: Kalpesh Khandla
*/

class AppTextStyle {
  // 18 Family

  static TextStyle gilroys18Regular({Color? color}) => TextStyle(
        fontFamily: 'Gilroy',
        fontSize: AppFontSize.fontSize18,
        fontWeight: AppFontWeight.fontWeight400,
        color: color,
      );

  static TextStyle gilroys18Light({Color? color}) => TextStyle(
        fontFamily: 'Gilroy',
        fontSize: AppFontSize.fontSize18,
        color: color,
        fontWeight: AppFontWeight.fontWeight400,
      );

  static TextStyle gilroys18Medium({Color? color}) => TextStyle(
        fontFamily: 'Gilroy',
        fontSize: AppFontSize.fontSize18,
        color: color,
        fontWeight: AppFontWeight.fontWeight500,
      );

  static TextStyle gilroys18SemiBold({Color? color}) => TextStyle(
        fontFamily: 'Gilroy',
        fontSize: AppFontSize.fontSize18,
        fontWeight: AppFontWeight.fontWeight600,
        color: color,
      );
}
