// Importa el framework de Flutter y los widgets de Material Design.
import 'package:flutter/material.dart';
// Librería externa para carga y cache de imágenes de red.
import 'package:cached_network_image/cached_network_image.dart';
// Modelo de datos y datos mock.
import '../models/item.dart';

/// Pantalla que muestra un listado dinámico de elementos (Práctica 2).
/// - Usa ListView.builder para renderizar los ítems.
/// - Cada ítem incluye imagen + textos.
/// - Al tocar un ítem, muestra un SnackBar indicando que los detalles
///   llegarán en la Fase 3.
class ListViewScreen extends StatelessWidget {
  const ListViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Listado de elementos'),
      backgroundColor: Colors.teal,
    ),
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
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Próximamente verás el detalle de "${item.title}" en la Fase 3',
            ),
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 2),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
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
                                color: Colors.teal.shade50,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                item.tag!,
                                style: TextStyle(
                                  color: Colors.teal.shade800,
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
                          color: Colors.black87,
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
        color: Colors.teal.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Icon(Icons.image, color: Colors.white70),
    );

    if (item.imageUrl == null || item.imageUrl!.isEmpty) {
      return ClipRRect(borderRadius: border.borderRadius, child: placeholder);
    }

    // Usa CachedNetworkImage para cachear y mostrar imágenes de red.
    return ClipRRect(
      borderRadius: border.borderRadius,
      child: CachedNetworkImage(
        imageUrl: item.imageUrl!,
        width: size,
        height: size,
        fit: BoxFit.cover,
        placeholder: (_, __) => placeholder,
        errorWidget: (_, __, ___) => Container(
          width: size,
          height: size,
          color: Colors.grey.shade200,
          child: const Icon(Icons.broken_image, color: Colors.grey),
        ),
      ),
    );
  }
}
