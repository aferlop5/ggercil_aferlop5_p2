Aplicación Flutter para la asignatura Interfaces Humano-Máquina.

Este README te guía para preparar el entorno, clonar el repositorio y ejecutar la app.

 1. Instala Git, Flutter SDK, VS Code y Android Studio
 2. Ejecuta `flutter doctor` y acepta licencias de Android
 3. Clona el repo y ejecuta `flutter pub get`
 4. Lanza con `flutter run` (elige dispositivo/emulador)

## Requisitos

Git ≥ 2.28 (compruébalo con `git --version`).
Flutter SDK.
Android Studio para Android.
Visual Studio Code + extensiones *Flutter* y *Dart*.

## Instalación del entorno

1) Instala Git

Descarga Git e instálalo con:

sudo apt update
sudo apt install git

2) Instala Flutter

Sigue la siguiente guia:

https://juan-jesus-izquierdo-domenech.gitbook.io/ipc-practicas/herramientas-flutter/instalacion-de-flutter

3) Instala Android Studio (para Android)

Sigue la siguiente guia:

https://juan-jesus-izquierdo-domenech.gitbook.io/ipc-practicas/herramientas-flutter/instalacion-de-android-studio


4) Instala VS Code

Instala Visual Studio Code y las extensiones Flutter y Dart desde el marketplace.

## Clonar y abrir el proyecto


Clona el repo GitHub:

git clone https://github.com/aferlop5/ggercli_aferlop5_p2
cd ggercli_aferlop5_p2


Abre la carpeta del proyecto en VS Code:

code .


## Ejecutar la app:

-Android (emulador o dispositivo físico)**

  Crea un AVD en Android Studio (*Device Manager*) o conecta tu móvil con Depuración USB activada.
  Verifica dispositivos:

    flutter devices

  Ejecuta:

    flutter run

    Web (Chrome/Edge/Firefox)**
  
        flutter run -d chrome
  
    Escritorio (Windows/macOS/Linux)**

        flutter run -d windows
  
-Desde VS Code

    Abre la carpeta del proyecto en VS Code.

    Pulsa Ctrl + Shift + P → escribe Flutter: Select Device y selecciona el destino (emulador, web o escritorio).

    Después pulsa F5 para lanzar la aplicación en modo debug.

    Puedes detener la ejecución con Shift + F5.

Hot Reload: cuando la app esté corriendo, guarda cambios (Ctrl+S) para verlos al instante.

## Comandos útiles

flutter doctor            # Diagnóstico del entorno
flutter pub get           # Instalar dependencias
flutter clean             # Limpiar build cache
dart format .             # Formatear código
dart analyze              # Análisis estático
flutter run -d <device>   # Ejecutar en un dispositivo concreto

## Flujo básico con Git (primera vez)

Configura tu identidad (si nunca lo hiciste en tu máquina):

git config --global user.name "Tu Nombre"
git config --global user.email "tu_email@ejemplo.com"


Autenticación al hacer *push*:

GitLab/GitHub pueden pedir token personal. Al introducirlo una vez, Windows/Mac suelen guardarlo en el Credential Manager del sistema.



Estructura del proyecto

lib/                # Código Dart principal (widgets, vistas, lógica)
assets/             # Imágenes, fuentes, etc. (referenciadas en pubspec.yaml)
test/               # Pruebas unitarias
android/ ios/ web/  # Plataformas


## Novedades Práctica 2

- Pantalla de listado dinámico con `ListView.builder` en `lib/views/list_view.dart`.
- Modelo de datos `Item` en `lib/models/item.dart` con `id`, `title`, `description`, `imageUrl` y `tag`.
- Integración de librería externa `cached_network_image` para carga y caché de imágenes de red.
- Interacción: al tocar un elemento se muestra un `SnackBar` indicando que el detalle llegará en la Fase 3.

Cómo probar el listado:

- Desde la pantalla principal (MainView), pulsa el contenedor de bienvenida o el botón "Ir a Segunda Pantalla" para navegar al listado.
- Desplázate: hay suficientes elementos (30) para que aparezca scroll.
- Toca cualquier ítem para ver el mensaje de `SnackBar`.

Justificación de la dependencia `cached_network_image`:

- Mejora el rendimiento y la experiencia de usuario al cachear imágenes de red, evitando recargas innecesarias.
- Proporciona placeholders y gestión de errores de forma sencilla y personalizable.

