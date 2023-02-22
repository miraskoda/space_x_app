import 'package:flutter/material.dart';

const Color _spaceWhite = Color(0xFFF7FAFF);
const Color trueWhite = Color(0xFFFFFFFF);
const Color _spaceGreyDark = Color.fromARGB(255, 0, 100, 172);
const Color _spaceGreySemiDark = Color.fromARGB(255, 70, 130, 233);
const Color _spaceGrey = Color.fromARGB(255, 53, 104, 175);
const Color _spaceGreySemiLight = Color.fromARGB(255, 69, 209, 237);
const Color _spaceGreyLight = Color.fromARGB(255, 154, 206, 232);

final ThemeData lightTheme = ThemeData(
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
