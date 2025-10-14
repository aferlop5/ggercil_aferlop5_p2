// Importa el framework de Flutter y los widgets de Material Design.
import 'package:flutter/material.dart';
// Importa la vista principal definida en main_view.dart.
import 'views/main_view.dart';

// Función principal: punto de entrada de la aplicación.
// runApp monta el widget raíz MyApp en la pantalla.
void main() {
  runApp(const MyApp());
}

// MyApp es el widget raíz de la aplicación.
// Define el tema y el widget inicial.
class MyApp extends StatelessWidget {
  // Constructor de MyApp. Key permite identificar el widget de manera única.
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const MaterialApp(
    title: 'P1 IPC', // Título en el interruptor de tareas
    debugShowCheckedModeBanner: false, // Oculta la etiqueta de depuración
    home: MainView(), // Pantalla inicial
  );
}
