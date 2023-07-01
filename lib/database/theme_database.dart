import 'dart:convert';

import 'package:brewnbeer_task/main.dart';

import 'package:brewnbeer_task/model/custom_theme_model.dart';
import 'package:flutter/material.dart';

class ThemeDatabase {
  //
  void setTheme(CustomTheme userTheme) async {
    await prefs.setString('userTheme', jsonEncode(userTheme));
  }

  ThemeData getTheme() {
    try {
      String? theme = prefs.getString('userTheme');
      if (theme == null) {
        return ThemeData();
      } else {
        return CustomTheme.fromJson(jsonDecode(theme)).toThemeData();
      }
    } on Exception {
      throw 'null';
    }
  }

  void resetTheme() async {
    await prefs.remove('userTheme');
  }
}
