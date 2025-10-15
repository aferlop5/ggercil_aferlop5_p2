import 'package:flutter/material.dart';

/// Paleta de colores de la app (P2)
class AppColors {
  // Fondo base (marfil)
  static const Color background = Color(0xFFFAFAF8);

  // Verde oliva (primario: títulos, iconos header, botones, AppBar)
  static const Color olive = Color(0xFF72845D);

  // Marrón tierra (texto secundario, descripciones, bordes suaves)
  static const Color earth = Color(0xFF8C7051);

  // Blanco puro (cards, botones flotantes, modales)
  static const Color pureWhite = Color(0xFFFFFFFF);

  // Amarillo arena (acentos puntuales)
  static const Color sand = Color(0xFFE8D5B5);
}

ThemeData buildAppTheme() {
  final base = ThemeData.light();

  return base.copyWith(
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: base.colorScheme.copyWith(
      primary: AppColors.olive,
      onPrimary: Colors.white,
      secondary: AppColors.sand,
      surface: AppColors.pureWhite,
      onSurface: Colors.black87,
      background: AppColors.background,
      onBackground: Colors.black87,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.olive,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.olive,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.olive.withOpacity(0.95),
      contentTextStyle: const TextStyle(color: Colors.white),
      behavior: SnackBarBehavior.floating,
    ),
    cardColor: AppColors.pureWhite,
    textTheme: base.textTheme.copyWith(
      titleLarge: const TextStyle(
        color: AppColors.olive,
        fontWeight: FontWeight.w700,
      ),
      bodyMedium: const TextStyle(color: AppColors.earth),
      bodySmall: const TextStyle(color: AppColors.earth),
    ),
    dividerColor: AppColors.earth.withOpacity(0.2),
  );
}
