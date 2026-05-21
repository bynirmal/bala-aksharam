import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class AppTheme {
  static const Color primarySaffron = Color(0xFFF97316);
  static const Color primarySaffronLight = Color(0xFFFFC078);
  static const Color primarySaffronDark = Color(0xFFC2410C);
  static const Color primaryKrishna = Color(0xFF3B82F6);
  static const Color primaryKrishnaLight = Color(0xFF93C5FD);
  static const Color lotusPink = Color(0xFFEC4899);
  static const Color lotusPinkLight = Color(0xFFF9A8D4);
  static const Color lotusPinkDark = Color(0xFFBE185D);
  static const Color lotusCream = Color(0xFFFFF6E0);
  static const Color lotusWarmBg = Color(0xFFFEF9F0);
  static const Color divineGold = Color(0xFFF59E0B);
  static const Color divineGoldLight = Color(0xFFFCD34D);
  static const Color sandalwood = Color(0xFFD2691E);
  static const Color peacockGreen = Color(0xFF059669);
  static const Color peacockGreenLight = Color(0xFF34D399);
  static const Color peacockBlue = Color(0xFF0891B2);
  static const Color marigoldYellow = Color(0xFFFBBF24);
  static const Color marigoldYellowLight = Color(0xFFFEF3C7);
  static const Color successGreen = Color(0xFF16A34A);
  static const Color errorRed = Color(0xFFDC2626);
  static const Color textPrimary = Color(0xFF1E1B4B);
  static const Color textSecondary = Color(0xFF4338CA);
  static const Color textMuted = Color(0xFF6B7280);
  static const Color white = Color(0xFFFFFFFF);
  static const Color offWhite = Color(0xFFFAFAFA);

  static ThemeData lightTheme() {
    return ThemeData(
      primaryColor: primarySaffron,
      scaffoldBackgroundColor: lotusWarmBg,
      colorScheme: const ColorScheme.light(
        primary: primarySaffron,
        secondary: lotusPink,
        surface: white,
        background: lotusWarmBg,
        error: errorRed,
      ),
      textTheme: GoogleFonts.nunitoTextTheme(
        const TextTheme(
          displayLarge: TextStyle(
            color: textPrimary,
            fontWeight: FontWeight.w800,
          ),
          displayMedium: TextStyle(
            color: textPrimary,
            fontWeight: FontWeight.w700,
          ),
          displaySmall: TextStyle(
            color: textPrimary,
            fontWeight: FontWeight.w600,
          ),
          headlineMedium: TextStyle(
            color: textSecondary,
            fontWeight: FontWeight.w700,
          ),
          bodyLarge: TextStyle(color: textPrimary),
          bodyMedium: TextStyle(color: textMuted),
          bodySmall: TextStyle(color: textMuted),
          labelLarge: TextStyle(
            color: white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primarySaffron,
          foregroundColor: white,
          elevation: 4,
          shadowColor: primarySaffron.withOpacity(0.3),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      cardTheme: CardTheme(
        color: white,
        elevation: 6,
        shadowColor: primarySaffron.withOpacity(0.12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: primarySaffron,
        foregroundColor: white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: white,
          fontSize: 22,
          fontWeight: FontWeight.w700,
        ),
      ),
      dividerColor: primarySaffronLight.withOpacity(0.3),
    );
  }
}
