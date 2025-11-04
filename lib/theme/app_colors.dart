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

/// Widget reutilizable para mostrar información con un estilo coherente.
///
/// Requisitos:
/// - StatelessWidget con dos parámetros obligatorios: `title` y `subtitle`.
/// - Muestra un ListTile con icono de hoja verde a la izquierda.
/// - Fondo blanco, esquinas redondeadas, sombra suave y padding alrededor.
class InfoTile extends StatelessWidget {
  final String title;
  final String subtitle;

  const InfoTile({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.pureWhite,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ListTile(
          leading: const Icon(Icons.eco, color: Colors.green),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(subtitle),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
      ),
    );
  }
}
