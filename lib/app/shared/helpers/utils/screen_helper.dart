import 'package:flutter/material.dart';

abstract class ScreenHelper {
  static Size size(BuildContext context) => MediaQuery.of(context).size;
  static double width(BuildContext context) => size(context).width;
  static double height(BuildContext context) => size(context).height;
}
