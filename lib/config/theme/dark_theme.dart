import 'package:flutter/material.dart';

const Color _spaceWhite = Color(0xFFF7FAFF);
const Color trueWhite = Color(0xFFFFFFFF);
const Color _spaceGreyDark = Color(0xFF222222);
const Color _spaceGreySemiDark = Color(0xFF333D3F);
const Color _spaceGrey = Color(0xFF4D5557);
const Color _spaceGreySemiLight = Color(0xFF999E9F);
const Color _spaceGreyLight = Color(0xFFCCCECF);

final ThemeData darkTheme = ThemeData(
  primaryColorLight: _spaceGreyLight,
  backgroundColor: trueWhite,
  primaryColor: _spaceGrey,
  primaryColorDark: _spaceGreyDark,
  brightness: Brightness.light,
  disabledColor: const Color(0xFFCED3DD),
  indicatorColor: _spaceGreySemiLight,
  shadowColor: const Color(0x44555555),
  splashColor: Colors.transparent,
  scaffoldBackgroundColor: _spaceWhite,
  dialogBackgroundColor: const Color(0xFFD6F3FF),
  inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.transparent,
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: _spaceGrey,
          )),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: _spaceGreyLight,
          )),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.red,
          )),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.red,
          )),
      floatingLabelStyle: const TextStyle(
          fontSize: 14,
          color: _spaceGrey,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w400),
      labelStyle: const TextStyle(
          fontSize: 14,
          color: _spaceGrey,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w400),
      hintStyle: const TextStyle(
          fontSize: 14,
          color: _spaceGreyLight,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w400),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
    minimumSize: const Size(230, 42),
    foregroundColor: Colors.white,
    backgroundColor: _spaceGrey,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    padding: const EdgeInsets.all(12),
    textStyle: const TextStyle(
        fontSize: 12,
        color: _spaceGrey,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w500),
  )),
  textTheme: const TextTheme(
    headline1: TextStyle(
        fontSize: 24,
        fontFamily: 'Montserrat',
        color: _spaceGrey,
        fontWeight: FontWeight.normal),
    headline2: TextStyle(
        fontSize: 22,
        fontFamily: 'Montserrat',
        color: _spaceGrey,
        fontWeight: FontWeight.w600),
    headline3: TextStyle(
        fontSize: 15,
        color: _spaceGreySemiLight,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w500),
    headline4: TextStyle(
        fontSize: 14,
        color: _spaceGrey,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.normal),
    headline6: TextStyle(
        fontSize: 10,
        color: _spaceGrey,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.normal),
    bodyText1: TextStyle(
      fontSize: 16,
      fontFamily: 'Montserrat',
      color: _spaceGrey,
      fontWeight: FontWeight.w300,
      height: 1.4,
    ),
    bodyText2: TextStyle(
      fontSize: 14,
      fontFamily: 'Montserrat',
      color: _spaceGreySemiDark,
      fontWeight: FontWeight.w600,
      height: 1.4,
    ),
  ),
);
