// Importa el framework de Flutter y los widgets de Material Design.
import 'package:flutter/material.dart';
// Modelo de datos y datos mock.
import '../models/item.dart';
// Paleta de colores
import '../theme/app_colors.dart';

/// Pantalla que muestra un listado dinámico de elementos (Práctica 2).
/// - Usa ListView.builder para renderizar los ítems.
/// - Cada ítem incluye imagen + textos.
/// - Al tocar un ítem, muestra un SnackBar indicando que los detalles
///   llegarán en la Fase 3.
class ListViewScreen extends StatelessWidget {
  const ListViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Listado de elementos')),
    body: ListView.builder(
      itemCount: mockItems.length,
      itemBuilder: (context, index) {
        final item = mockItems[index];
        return _ItemTile(item: item);
      },
    ),
  );
}

/// Tile individual para cada elemento del listado.
class _ItemTile extends StatelessWidget {
  final Item item;

  const _ItemTile({required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 260),
          pageBuilder: (_, __, ___) => ItemDetailScreen(item: item),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final curved = CurvedAnimation(
              parent: animation,
              curve: Curves.easeOutCubic,
            );
            final fade = Tween<double>(begin: 0.0, end: 1.0).animate(curved);
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
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildImage(),
              const SizedBox(width: 12),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              item.title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColors.olive,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (item.tag != null)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.sand,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                item.tag!,
                                style: const TextStyle(
                                  color: AppColors.olive,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        item.description,
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.earth,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    const double size = 84;
    final border = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    );

    Widget placeholder = Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppColors.sand,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Icon(Icons.image, color: AppColors.olive),
    );

    if (item.assetPath == null || item.assetPath!.isEmpty) {
      return ClipRRect(borderRadius: border.borderRadius, child: placeholder);
    }

    // Carga de imagen local desde assets.
    return ClipRRect(
      borderRadius: border.borderRadius,
      child: Image.asset(
        item.assetPath!,
        width: size,
        height: size,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => Container(
          width: size,
          height: size,
          color: AppColors.earth.withOpacity(0.1),
          child: const Icon(Icons.broken_image, color: AppColors.earth),
        ),
      ),
    );
  }
}

/// Pantalla de detalle para un elemento del listado.
class ItemDetailScreen extends StatelessWidget {
  final Item item;

  const ItemDetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(item.title)),
      body: ListView(
        children: [
          // Reutilizamos el widget personalizado InfoTile al inicio.
          InfoTile(title: item.title, subtitle: item.description),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: item.assetPath == null || item.assetPath!.isEmpty
                  ? Container(
                      height: 180,
                      color: AppColors.sand,
                      child: const Center(
                        child: Icon(Icons.image, color: AppColors.olive),
                      ),
                    )
                  : Image.asset(
                      item.assetPath!,
                      height: 220,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        height: 180,
                        color: AppColors.earth.withOpacity(0.1),
                        child: const Center(
                          child: Icon(
                            Icons.broken_image,
                            color: AppColors.earth,
                          ),
                        ),
                      ),
                    ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
