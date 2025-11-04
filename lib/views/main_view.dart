// Importa el framework Flutter y los widgets de Material Design.
import 'package:flutter/material.dart';
// Importa la segunda pantalla (ListViewScreen) para navegar desde MainView.
import 'list_view.dart';
import '../theme/app_colors.dart';

/// Pantalla principal con mensaje de bienvenida y navegación a la segunda pantalla.
// MainView muestra un mensaje de bienvenida y un botón para navegar.
class MainView extends StatelessWidget {
  /// Crea una instancia de MainView.
  // Constructor de MainView. Key permite identificar el widget.
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    // Estructura base de la pantalla con barra superior y contenido
    appBar: AppBar(
      // Barra superior con el título de la pantalla
      title: const Text('Pantalla Principal'),
    ),
    body: Center(
      // Centra el contenido en el eje principal
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // Organiza los widgets en columna (de arriba a abajo)
        children: [
          // Detecta el toque en el contenedor para navegar a la segunda pantalla
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 260),
                pageBuilder: (_, __, ___) => const ListViewScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                      final curved = CurvedAnimation(
                        parent: animation,
                        curve: Curves.easeOutCubic,
                      );
                      final fade = Tween<double>(
                        begin: 0.0,
                        end: 1.0,
                      ).animate(curved);
                      final slide = Tween<Offset>(
                        begin: const Offset(0, 0.06),
                        end: Offset.zero,
                      ).animate(curved);
                      return FadeTransition(
                        opacity: fade,
                        child: SlideTransition(position: slide, child: child),
                      );
                    },
              ),
            ), // Navega a ListViewScreen
            child: const InfoTile(
              title: '¡Bienvenido a la App!',
              subtitle: 'Explora el listado y descubre más detalles.',
            ),
          ),
          // Separador para dejar espacio entre elementos
          const SizedBox(height: 60),
          // Botón que también navega a la segunda pantalla
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 260),
                pageBuilder: (_, __, ___) => const ListViewScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                      final curved = CurvedAnimation(
                        parent: animation,
                        curve: Curves.easeOutCubic,
                      );
                      final fade = Tween<double>(
                        begin: 0.0,
                        end: 1.0,
                      ).animate(curved);
                      final slide = Tween<Offset>(
                        begin: const Offset(0, 0.06),
                        end: Offset.zero,
                      ).animate(curved);
                      return FadeTransition(
                        opacity: fade,
                        child: SlideTransition(position: slide, child: child),
                      );
                    },
              ),
            ), // Navega a ListViewScreen al pulsar el botón
            child: const Text(
              'Ir a Segunda Pantalla',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    ),
  );
}
