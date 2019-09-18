import 'package:flutter/material.dart';
import 'package:collection_app/resource/values/app_colors.dart';

/// App Styles Class -> Resource class for storing app level styles constants
class AppStyles {

  // Light Theme
  static ThemeData lightTheme(){
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      primaryColor: AppColors.PRIMARY_COLOR,
      primaryColorLight: AppColors.PRIMARY_COLOR_LIGHT,
      primaryColorDark: AppColors.PRIMARY_COLOR_DARK,
      accentColor: AppColors.ACCENT_COLOR,
      backgroundColor: Colors.white,
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.all(20),
        hintStyle: TextStyle(
          color: AppColors.PRIMARY_COLOR,
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.normal,
          fontSize: 14,
          letterSpacing: 1.5,
        ),
        labelStyle: TextStyle(
          color: AppColors.COLOR_GREY,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal,
          fontSize: 14,
          letterSpacing: 2.0,
        ),
        errorStyle: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
          fontSize: 12,
          letterSpacing: 1,
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.COLOR_GREY,
              width: 2.5,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(4),
                bottomRight: Radius.circular(4),
                bottomLeft: Radius.circular(4)
            ),
            gapPadding: 6.0,
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.PRIMARY_COLOR,
              width: 2.5,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(4),
                bottomRight: Radius.circular(4),
                bottomLeft: Radius.circular(4)
            ),
          gapPadding: 6.0,
        ),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 2.5,
            ),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(4),
                bottomRight: Radius.circular(4),
                bottomLeft: Radius.circular(4)
            ),
          gapPadding: 6.0,
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.orange,
              width: 2.5,
            ),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(4),
                bottomRight: Radius.circular(4),
                bottomLeft: Radius.circular(4)
            ),
          gapPadding: 6.0,
        ),
      ),
      buttonTheme: ButtonThemeData(
        shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0)
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 12.0
        ),
        textTheme:ButtonTextTheme.primary,
        buttonColor: AppColors.ACCENT_COLOR,
      ),
    );
  }

  // Dark Theme
  static ThemeData darkTheme(){
    final ThemeData base = ThemeData.dark();
    return base.copyWith(
      primaryColor: AppColors.PRIMARY_COLOR,
      primaryColorLight: AppColors.PRIMARY_COLOR_LIGHT,
      primaryColorDark: AppColors.PRIMARY_COLOR_DARK,
      accentColor: AppColors.ACCENT_COLOR,
      backgroundColor: AppColors.ACCENT_COLOR_DARK,
    );
  }

}