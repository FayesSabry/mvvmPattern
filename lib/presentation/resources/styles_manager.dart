import 'package:flutter/widgets.dart';
import 'package:mvvm/presentation/resources/fonts_manager.dart';


  TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontFamily: FontsManager.fontFamily
    );
  }

  // regular style

  TextStyle getRegularStyle({
    double fontSize = FontSizes.s12,
    required Color color,
  }) {
    return _getTextStyle(
      fontSize,
      FontWeightManager.regular,
      color,
    );
  }

  // medium style

  TextStyle getMediumStyle({
    double fontSize = FontSizes.s12,
    required Color color,
  }) {
    return _getTextStyle(
      fontSize,
      FontWeightManager.medium,
      color,
    );
  }

  // light style

  TextStyle getLightStyle({
    double fontSize = FontSizes.s12,
    required Color color,
  }) {
    return _getTextStyle(
      fontSize,
      FontWeightManager.light,
      color,
    );
  }

  // bold style

  TextStyle getBoldStyle({
    double fontSize = FontSizes.s12,
    required Color color,
  }) {
    return _getTextStyle(
      fontSize,
      FontWeightManager.bold,
      color,
    );
  }

