import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:winner_2d/providers/theme_provider.dart';

class Utils {
  BuildContext context;
  Utils(this.context);

  bool get gettheme =>
      Provider.of<ThemeProvider>(context).getDarkTheme;
  Color get getColor => gettheme ? Colors.white : Colors.black;

  Color get baseShimmerColor =>
      gettheme ? Colors.grey.shade500 : Colors.grey.shade200;
  Color get highlightShimmerColor =>
      gettheme
          ? Colors.grey.shade700
          : const Color.fromARGB(255, 28, 6, 6);

  Color get widgetShimmerColor =>
      gettheme ? Colors.grey.shade600 : Colors.grey.shade100;
}
