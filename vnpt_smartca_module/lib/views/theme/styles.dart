import 'package:flutter/material.dart';

/// Used for all animations in the  app
class AppTimes {
  static const Duration fastest = Duration(milliseconds: 150);
  static const fast = Duration(milliseconds: 250);
  static const medium = Duration(milliseconds: 350);
  static const slow = Duration(milliseconds: 700);
  static const slower = Duration(milliseconds: 1000);
}

class AppSizes {
  static double hitScale = 1;
  static double get hit => 40 * hitScale;
  static const double smallPhone = 500;
  static const double largePhone = 700;
}

class AppIconSizes {
  static const double scale = 1;
  static const double md = 24;
}

class AppInsets {
  static double scale = 1;
  static double offsetScale = 1;
  // Regular paddings
  static double get xs => 4 * scale;
  static double get sm => 8 * scale;
  static double get md => 12 * scale;
  static double get lg => 16 * scale;
  static double get xl => 32 * scale;
  // Offset, used for the edge of the window, or to separate large sections in the app
  static double get offset => 40 * offsetScale;
}

class AppCorners {
  static const double sm = 3;
  static const BorderRadius smBorder = BorderRadius.all(smRadius);
  static const Radius smRadius = Radius.circular(sm);

  static const double md = 5;
  static const BorderRadius mdBorder = BorderRadius.all(mdRadius);
  static const Radius mdRadius = Radius.circular(md);

  static const double lg = 8;
  static const BorderRadius lgBorder = BorderRadius.all(lgRadius);
  static const Radius lgRadius = Radius.circular(lg);
}

class AppStrokes {
  static const double thin = 1;
  static const double thick = 4;
}

class AppShadows {
  static List<BoxShadow> get universal => [
        BoxShadow(
          color: const Color(0xff333333).withOpacity(.15),
          spreadRadius: 0,
          blurRadius: 10,
        ),
      ];
  static List<BoxShadow> get small => [
        BoxShadow(
          color: const Color(0xff333333).withOpacity(.15),
          spreadRadius: 0,
          blurRadius: 3,
          offset: const Offset(0, 1),
        ),
      ];
}

/// Font Sizes
/// You can use these directly if you need, but usually there should be a predefined style in TextStyles.
class AppFontSizes {
  /// Provides the ability to nudge the app-wide font scale in either direction
  static double get scale => 1;
  static double get s10 => 10 * scale;
  static double get s11 => 11 * scale;
  static double get s12 => 12 * scale;
  static double get s14 => 14 * scale;
  static double get s16 => 16 * scale;
  static double get s18 => 18 * scale;
  static double get s24 => 24 * scale;
  static double get s48 => 48 * scale;
}

class AppColors {
  static const Color black = Color(0xFF000000);

  static const Color white = Color(0xFFFFFFFF);

  static const Color initial = Color.fromRGBO(23, 43, 77, 1.0);

  static const Color primary = Color.fromRGBO(9, 107, 217, 1.0);

  static const Color secondary = Color.fromRGBO(247, 250, 252, 1.0);

  static const Color label = Color.fromRGBO(254, 36, 114, 1.0);

  static const Color info = Color.fromRGBO(17, 205, 239, 1.0);

  static const Color error = Color.fromRGBO(207, 19, 34, 1.0);

  static const Color success = Color.fromRGBO(45, 206, 137, 1.0);

  static const Color warning = Color.fromRGBO(251, 99, 64, 1.0);

  static const Color header = Color.fromRGBO(82, 95, 127, 1.0);

  static const Color bgColorScreen = Color.fromRGBO(248, 249, 254, 1.0);

  static const Color border = Color.fromRGBO(202, 209, 215, 1.0);

  static const Color inputSuccess = Color.fromRGBO(123, 222, 177, 1.0);

  static const Color inputError = Color.fromRGBO(252, 179, 164, 1.0);

  static const Color muted = Color.fromRGBO(136, 152, 170, 1.0);

  static const Color text = Color.fromRGBO(50, 50, 93, 1.0);

  static const Color fontBlack = Color(0xDE000000);
  static const Color textFieldBackground = Color(0x1E000000);
  static const Color hintColor = Color(0x99000000);
  static const Color statusBarColor = Color(0x1e000000);
}

class AppStyles {
  static const pdt2 = Padding(padding: EdgeInsets.only(top: 2));
  static const pdt4 = Padding(padding: EdgeInsets.only(top: 4));
  static const pdt6 = Padding(padding: EdgeInsets.only(top: 6));
  static const pdt10 = Padding(padding: EdgeInsets.only(top: 10));
  static const pdt12 = Padding(padding: EdgeInsets.only(top: 12));
  static const pdt15 = Padding(padding: EdgeInsets.only(top: 15));
  static const pdt20 = Padding(padding: EdgeInsets.only(top: 20));
  static const pdt30 = Padding(padding: EdgeInsets.only(top: 30));
  static const pdt40 = Padding(padding: EdgeInsets.only(top: 40));
  static const pdt50 = Padding(padding: EdgeInsets.only(top: 50));

  static const pdl10 = Padding(padding: EdgeInsets.only(left: 10));
  static const pdl5 = Padding(padding: EdgeInsets.only(left: 5));
  static const pdl15 = Padding(padding: EdgeInsets.only(left: 15));
  static const pdl20 = Padding(padding: EdgeInsets.only(left: 20));
  static const pdh16 = Padding(padding: EdgeInsets.symmetric(horizontal: 16.0));
  static const pdv16 = Padding(padding: EdgeInsets.symmetric(vertical: 16.0));

  static const pd15 = Padding(padding: EdgeInsets.all(15));

  static const mrgtb30 = EdgeInsets.symmetric(vertical: 30.0);

  static InputDecoration inputDecoration({
    String? hintText,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      counterText: "",
      errorMaxLines: 3,
      suffixIcon: suffixIcon,
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromRGBO(222, 155, 57, 1.0),
        ),
      ),
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 20.0),
      hintText: hintText,
    );
  }
}

class AppFonts {
  static const String roboto = "Roboto";
}

class AppTextStyles {
  static const TextStyle fw500 = TextStyle(fontWeight: FontWeight.w500);

  static const TextStyle roboto = TextStyle(
    fontFamily: AppFonts.roboto,
    fontWeight: FontWeight.w400,
    height: 1.2,
  );

  static TextStyle get h1 => roboto.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: AppFontSizes.s48,
        letterSpacing: -1,
        height: 1.2,
      );

  static TextStyle get h2 =>
      h1.copyWith(fontSize: AppFontSizes.s24, letterSpacing: -.5, height: 1.2);

  static TextStyle get h3 =>
      h1.copyWith(fontSize: AppFontSizes.s18, letterSpacing: -.05, height: 1.2);

  static TextStyle get h4 =>
      h1.copyWith(fontSize: AppFontSizes.s14, letterSpacing: -.05, height: 1.2);

  static TextStyle get title1 => roboto.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: AppFontSizes.s16,
        height: 1.3,
      );

  static TextStyle get title2 => title1.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: AppFontSizes.s14,
        height: 1.2,
      );

  static TextStyle get body1 => roboto.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: AppFontSizes.s14,
        height: 1.2,
      );

  static TextStyle get body2 => body1.copyWith(
        fontSize: AppFontSizes.s12,
        height: 1.2,
        letterSpacing: .2,
      );

  static TextStyle get body3 =>
      body1.copyWith(fontSize: AppFontSizes.s12, height: 1.2);

  static TextStyle get callout1 => roboto.copyWith(
        fontWeight: FontWeight.w800,
        fontSize: AppFontSizes.s12,
        height: 1.2,
        letterSpacing: .5,
      );

  static TextStyle get callout2 => callout1.copyWith(
        fontSize: AppFontSizes.s10,
        height: 1,
        letterSpacing: .25,
      );

  static TextStyle get caption => roboto.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: AppFontSizes.s11,
        height: 1.2,
      );

  static TextStyle get error => roboto.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: AppFontSizes.s16,
        height: 1.2,
        color: AppColors.error,
      );
}

class AppRadius {
  static const Radius rc8 = Radius.circular(8.0);
  static const Radius rc5 = Radius.circular(5.0);
}

class AppGap {
  static const double g16 = 16.0;
  static const double g10 = 10.0;
  static const double g4 = g16 / 4;
  static const double g8 = g16 / 2;
  static const double g32 = g16 * 2;
  static const double g48 = g16 * 3;
}
