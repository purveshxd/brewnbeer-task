// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:brewnbeer_task/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  final Color primaryColor;
  final Color accentColor;
  final String? imagePath;
  ThemeData? userTheme;
  CustomTheme({
    required this.primaryColor,
    required this.accentColor,
    this.imagePath,
    this.userTheme,
  });
  ThemeData toThemeData() {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Constants.getMaterialColor(primaryColor)),
      dialogBackgroundColor: accentColor,
    );
  }

  CustomTheme copyWith({
    Color? primaryColor,
    Color? accentColor,
    String? imagePath,
  }) {
    return CustomTheme(
      primaryColor: primaryColor ?? this.primaryColor,
      accentColor: accentColor ?? this.accentColor,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'primaryColor': primaryColor.value,
      'accentColor': accentColor.value,
      'imagePath': imagePath,
    };
  }

  factory CustomTheme.fromMap(Map<String, dynamic> map) {
    return CustomTheme(
      primaryColor: Color(map['primaryColor'] as int),
      accentColor: Color(map['accentColor'] as int),
      imagePath: map['imagePath'] != null ? map['imagePath'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomTheme.fromJson(String source) =>
      CustomTheme.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CustomTheme(primaryColor: $primaryColor, accentColor: $accentColor, imagePath: $imagePath)';

  @override
  bool operator ==(covariant CustomTheme other) {
    if (identical(this, other)) return true;

    return other.primaryColor == primaryColor &&
        other.accentColor == accentColor &&
        other.imagePath == imagePath;
  }

  @override
  int get hashCode =>
      primaryColor.hashCode ^ accentColor.hashCode ^ imagePath.hashCode;
}
