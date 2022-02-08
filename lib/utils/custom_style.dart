import 'package:flutter/material.dart';
import 'package:telemedicine_doctor/utils/colors.dart';
import 'package:telemedicine_doctor/utils/dimensions.dart';

class CustomStyle {
  static var labelText = TextStyle(
      fontSize: Dimensions.heading4TextSize,
      color: CustomColor.white,
      fontWeight: FontWeight.w700);

  static var titleText = TextStyle(
      fontSize: Dimensions.heading2TextSize,
      color: CustomColor.white,
      fontWeight: FontWeight.w700);

  static var textInputCustom = InputDecoration(
      filled: true,
      fillColor: Colors.white,
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff00B896)),
          borderRadius: BorderRadius.circular(5)),
      border: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff00B896)),
          borderRadius: BorderRadius.circular(5)));

//Halaman Notifikasi
  static var NotifHeaderText = TextStyle(
      fontFamily: 'Lexend',
      fontSize: Dimensions.leadParagraphTextSize,
      color: CustomColor.dark1Color,
      fontWeight: FontWeight.w400);

  static var NotifTitleText = TextStyle(
      fontFamily: 'Lexend',
      fontSize: Dimensions.heading5TextSize,
      color: CustomColor.dark1Color,
      fontWeight: FontWeight.w700);

  static var NotifSubTitleText = TextStyle(
      fontFamily: 'Lexend',
      fontSize: Dimensions.bodyMediumTextSize,
      color: CustomColor.dark1Color,
      fontWeight: FontWeight.w400);

  static var NotifTimeText = TextStyle(
      fontFamily: 'Lexend',
      fontSize: Dimensions.bodyNormalTextSize,
      color: CustomColor.mainColor,
      fontWeight: FontWeight.w400);

  //Halaman UserProfile
  static var ProfileCard = BoxDecoration(
      color: CustomColor.mainColor, borderRadius: BorderRadius.circular(6));

  static var ProfileDescCard = TextStyle(
    fontFamily: 'Lexend',
    color: CustomColor.light4Color,
    fontSize: Dimensions.leadParagraphTextSize,
    fontWeight: FontWeight.w400,
  );

  static var ProfileButton = ElevatedButton.styleFrom(
      primary: CustomColor.mainColor, fixedSize: Size(290, 46));

  static var ProfileTextButton = TextStyle(
    fontFamily: 'Lexend',
    fontSize: Dimensions.heading5TextSize,
    fontWeight: FontWeight.w700,
  );

  //Halaman Konsultasi
  static var ConsultBorder = BoxDecoration(
      color: CustomColor.mainColor, borderRadius: BorderRadius.circular(6));

  static var ConsultTitleText = TextStyle(
      fontFamily: 'Lexend',
      fontSize: Dimensions.heading2TextSize,
      fontWeight: FontWeight.w700,
      color: CustomColor.dark1Color);

  /// Halaman Daftar Konsultasi
  static var ConsultlabelText = TextStyle(
      fontSize: Dimensions.heading4TextSize,
      color: CustomColor.mainColorDarker,
      fontWeight: FontWeight.w700);

  static var ConsultNextButton = ElevatedButton.styleFrom(
      primary: CustomColor.mainColor, fixedSize: Size(290, 46));

  static var ConsultTextButton = TextStyle(
    fontFamily: 'Lexend',
    color: CustomColor.light4Color,
    fontSize: Dimensions.heading5TextSize,
    fontWeight: FontWeight.w700,
  );

  static var ConsultDropdownBox = BoxDecoration(
    color: Colors.white,
    border: Border.all(color: Color(0xff00B896)),
    borderRadius: BorderRadius.circular(5),
  );

  /// Halaman Daftar Doctor List
  static var DoctorListTitle = TextStyle(
      fontSize: Dimensions.bodyLargeTextSize,
      color: CustomColor.mainColorDarker,
      fontWeight: FontWeight.w400);

  static var DoctorListSubTitle = TextStyle(
      fontSize: Dimensions.heading4TextSize,
      color: CustomColor.dark1Color,
      fontWeight: FontWeight.w700);
}
