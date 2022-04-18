part of 'utils.dart';

class CustomStyle {
  static var labelText = TextStyle(
      fontFamily: 'Lexend',
      fontSize: Dimensions.heading4TextSize,
      color: CustomColor.white,
      fontWeight: FontWeight.w700);

  static var titleText = TextStyle(
      fontFamily: 'Lexend',
      fontSize: Dimensions.heading2TextSize,
      color: CustomColor.white,
      fontWeight: FontWeight.w700);

  static var textInputCustom = InputDecoration(
      filled: true,
      fillColor: Colors.white,
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xff00B896)),
          borderRadius: BorderRadius.circular(5)),
      border: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xff00B896)),
          borderRadius: BorderRadius.circular(5)));

//Halaman Notifikasi
  static var notifHeaderText = TextStyle(
      fontFamily: 'Lexend',
      fontSize: Dimensions.leadParagraphTextSize,
      color: CustomColor.dark1Color,
      fontWeight: FontWeight.w400);

  static var notifTitleText = TextStyle(
      fontFamily: 'Lexend',
      fontSize: Dimensions.heading5TextSize,
      color: CustomColor.dark1Color,
      fontWeight: FontWeight.w700);

  static var notifSubTitleText = TextStyle(
      fontFamily: 'Lexend',
      fontSize: Dimensions.bodyMediumTextSize,
      color: CustomColor.dark1Color,
      fontWeight: FontWeight.w400);

  static var notifTimeText = TextStyle(
      fontFamily: 'Lexend',
      fontSize: Dimensions.bodyNormalTextSize,
      color: CustomColor.mainColor,
      fontWeight: FontWeight.w400);

  //Halaman UserProfile
  static var profileCard = BoxDecoration(
      color: CustomColor.mainColor, borderRadius: BorderRadius.circular(6));

  static var profileDescCard = TextStyle(
    fontFamily: 'Lexend',
    color: CustomColor.light4Color,
    fontSize: Dimensions.leadParagraphTextSize,
    fontWeight: FontWeight.w400,
  );

  static var profileButton = ElevatedButton.styleFrom(
      primary: CustomColor.mainColor, fixedSize: const Size(290, 46));

  static var profileTextButton = TextStyle(
    fontFamily: 'Lexend',
    fontSize: Dimensions.heading5TextSize,
    fontWeight: FontWeight.w700,
  );

  //Halaman Konsultasi
  static var consultBorder = BoxDecoration(
      color: CustomColor.mainColor, borderRadius: BorderRadius.circular(6));

  static var consultTitleText = TextStyle(
      fontFamily: 'Lexend',
      fontSize: Dimensions.heading2TextSize,
      fontWeight: FontWeight.w700,
      color: CustomColor.dark1Color);

  /// Halaman Daftar Konsultasi
  static var consultlabelText = TextStyle(
      fontSize: Dimensions.heading4TextSize,
      color: CustomColor.mainColorDarker,
      fontWeight: FontWeight.w700);

  static var consultNextButton = ElevatedButton.styleFrom(
      primary: CustomColor.mainColor, fixedSize: const Size(290, 46));

  static var consultTextButton = TextStyle(
    fontFamily: 'Lexend',
    color: CustomColor.light4Color,
    fontSize: Dimensions.heading5TextSize,
    fontWeight: FontWeight.w700,
  );

  static var consultDropdownBox = BoxDecoration(
    color: Colors.white,
    border: Border.all(color: const Color(0xff00B896)),
    borderRadius: BorderRadius.circular(5),
  );

  /// Halaman Daftar Doctor List
  static var doctorListTitle = TextStyle(
      fontSize: Dimensions.bodyLargeTextSize,
      color: CustomColor.mainColorDarker,
      fontWeight: FontWeight.w400);

  static var doctorListSubTitle = TextStyle(
      fontSize: Dimensions.heading4TextSize,
      color: CustomColor.dark1Color,
      fontWeight: FontWeight.w700);
}
