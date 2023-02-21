import 'package:flutter/material.dart';

const Color spaceWhite = Color(0xFFF7FAFF);
const Color trueWhite = Color(0xFFFFFFFF);

const Color spacePrimaryDark = Color(0xFF007396);
const Color spacePrimarySemiDark = Color(0xFF01A7D9);
const Color spacePrimary = Color(0xFF01BAF2);
const Color spacePrimarySemiLight = Color(0xFF41CBF5);
const Color spacePrimaryLight = Color(0xFFBFEEFC);
const Color spacePrimaryBright = Color(0xFFF4FBFE);
const Color spaceSecondaryDark = Color(0xFF1593A1);
const Color spaceSecondarySemiDark = Color(0xFF19B0BF);
const Color spaceSecondary = Color(0xFF1593A1);
const Color spaceSecondarySemiLight = Color(0xFF54CEDB);
const Color spaceSecondaryLight = Color(0xFFC6EFF3);
const Color spaceSecondaryBright = Color(0xFFE8F8FA);

const Color spaceTertiaryDark = Color(0xFF519989);
const Color spaceTertiarySemiDark = Color(0xFF62B8A4);
const Color spaceTertiary = Color(0xFF519989);
const Color spaceTertiarySemiLight = Color(0xFF8FD5C5);
const Color spaceTertiaryLight = Color(0xFFDAF1EC);
const Color spaceTertiaryBright = Color(0xFFF0F9F7);

const Color spaceGreenDark = Color(0xFF58966B);
const Color spaceGreenSemiDark = Color(0xFF6AB581);
const Color spaceGreen = Color(0xFF58966B);
const Color spaceGreenSemiLight = Color(0xFF96D3A9);
const Color spaceGreenLight = Color(0xFFDCF0E2);
const Color spaceGreenBright = Color(0xFFF1F9F3);

const Color spaceRedDark = Color(0xFFA6103C);
const Color spaceRedSemiDark = Color(0xFFD9154E);
const Color spaceRed = Color(0xFFF21857);
const Color spaceRedSemiLight = Color(0xFFF55281);
const Color spaceRedLight = Color(0xFFFCC5D5);
const Color spaceRedBright = Color(0xFFFEE8EE);

const Color spacePink = Color(0xFFF160C1);
const Color spacePinkSemiLight = Color(0xFFF488D0);
const Color spacePinkLight = Color(0xFFFFE2F5);
const Color spacePinkSemiDark = Color(0xFFD956AD);
const Color spacePinkBright = Color(0xFFFEF5FB);

const Color spaceYellowPinkDark = Color(0xFFB58609);
const Color spaceYellowPinkSemiDark = Color(0xFFDEA40B);
const Color spaceYellow = Color(0xFFF2B30C);
const Color spaceYellowPinkSemiLight = Color(0xFFF5C649);
const Color spaceYellowPinkLight = Color(0xFFFCECC2);
const Color spaceYellowPinkBright = Color(0xFFFEF7E7);

const Color spaceGreyDark = Color(0xFFB58609);
const Color spaceGreySemiDark = Color(0xFF333D3F);
const Color spaceGrey = Color(0xFF4D5557);
const Color spaceGreySemiLight = Color(0xFF999E9F);
const Color spaceGreyLight = Color(0xFFCCCECF);
const Color spaceGreyBright = Color(0xFFE5E7E7);

final ThemeData lightTheme = ThemeData(
  primaryColorLight: spacePrimary,
  backgroundColor: trueWhite,
  primaryColor: spacePrimary,
  primaryColorDark: spaceSecondary,
  brightness: Brightness.light,
  disabledColor: const Color(0xFFCED3DD),
  indicatorColor: spaceSecondary,
  shadowColor: const Color(0x44555555),
  splashColor: Colors.transparent,
  scaffoldBackgroundColor: spaceWhite,
  dialogBackgroundColor: const Color(0xFFD6F3FF),
  inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.transparent,
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: spacePrimary,
          )),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: spaceGreyLight,
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
          color: spacePrimary,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w400),
      labelStyle: const TextStyle(
          fontSize: 14,
          color: spacePrimary,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w400),
      hintStyle: const TextStyle(
          fontSize: 14,
          color: spaceGreyLight,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w400),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
    minimumSize: const Size(230, 42),
    foregroundColor: Colors.white,
    backgroundColor: spacePrimary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    padding: const EdgeInsets.all(12),
    textStyle: const TextStyle(
        fontSize: 12,
        color: spacePrimary,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w500),
  )),
  textTheme: const TextTheme(
    headline1: TextStyle(
        fontSize: 24,
        fontFamily: 'Montserrat',
        color: spacePrimary,
        fontWeight: FontWeight.normal),
    headline2: TextStyle(
        fontSize: 22,
        fontFamily: 'Montserrat',
        color: spacePrimary,
        fontWeight: FontWeight.w600),
    headline3: TextStyle(
        fontSize: 15,
        color: spaceSecondary,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w500),
    headline4: TextStyle(
        fontSize: 14,
        color: spacePrimary,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.normal),
    headline6: TextStyle(
        fontSize: 10,
        color: spacePrimary,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.normal),
    bodyText1: TextStyle(
      fontSize: 16,
      fontFamily: 'Montserrat',
      color: spacePrimary,
      fontWeight: FontWeight.w300,
      height: 1.4,
    ),
    bodyText2: TextStyle(
      fontSize: 14,
      fontFamily: 'Montserrat',
      color: spaceGreySemiDark,
      fontWeight: FontWeight.w600,
      height: 1.4,
    ),
  ),
);
final List<BoxShadow> themeAppGlobalShadow = [
  BoxShadow(
    color: Colors.black.withOpacity(0.05),
    spreadRadius: 1,
    blurRadius: 5,
    offset: const Offset(0, 3),
  )
];
