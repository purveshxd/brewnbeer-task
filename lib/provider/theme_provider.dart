import 'package:brewnbeer_task/constants/constants.dart';
import 'package:brewnbeer_task/main.dart';
import 'package:brewnbeer_task/model/custom_theme_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentThemeProvider = StateProvider((ref) => '');
final customThemeProvider = StateProvider<ThemeData>((ref) => ThemeData());

final themeProvider = Provider<ThemeData>((ref) {
  final theme = ref.watch(currentThemeProvider);
  final primaryColor = ref.watch(primaryColorProvider);
  final accentColor = ref.watch(accentColorProvider);
  switch (theme) {
    case Constants.darkTheme:
      return ThemeData.dark().copyWith(
          colorScheme: const ColorScheme.dark(primary: Colors.purple));
    case Constants.lightTheme:
      return ThemeData().copyWith(
        colorScheme: const ColorScheme.light(primary: Colors.purple),
      );
    case Constants.userTheme:
      return CustomTheme(primaryColor: primaryColor, accentColor: accentColor)
          .toThemeData();

    case Constants.systemTheme:
      return ThemeData();
    case Constants.resetTheme:
      return ThemeData();
    default:
      return defaultTheme;
  }
});

final primaryColorProvider = StateProvider((ref) {
  final userTheme = ref.watch(customThemeProvider);

  return userTheme.colorScheme.primary;
});
final accentColorProvider = StateProvider((ref) {
  final userTheme = ref.watch(customThemeProvider);

  return userTheme.colorScheme.surface;
});
final textStyleProvider = StateProvider<TextStyle?>((ref) {
  final userTheme = ref.watch(customThemeProvider);

  return userTheme.dialogTheme.titleTextStyle;
});
