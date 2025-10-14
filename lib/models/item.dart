/// Modelo de datos para los elementos de la lista de la Práctica 2.
/// Contiene la información básica para renderizar cada ítem.
class Item {
  /// Identificador único del elemento.
  final String id;

  /// Título principal a mostrar.
  final String title;

  /// Descripción breve del elemento.
  final String description;

  /// URL de la imagen (o ruta local). Si es `null`, se mostrará un placeholder.
  final String? imageUrl;

  /// Información adicional opcional (por ejemplo, categoría o etiqueta).
  final String? tag;

  const Item({
    required this.id,
    required this.title,
    required this.description,
    this.imageUrl,
    this.tag,
  });
}

/// Datos mock para poblar la lista inicialmente.
/// Incluye muchas entradas para asegurar que hay scroll.
final List<Item> mockItems = List.generate(30, (index) {
  // Alternamos entre imágenes de red y null para probar placeholders.
  final useNetwork = index % 2 == 0;
  return Item(
    id: 'item_$index',
    title: 'Elemento #$index',
    description:
        'Descripción breve del elemento número $index. Este texto sirve como ejemplo para el ListView.builder.',
    imageUrl: useNetwork
        ? 'https://picsum.photos/seed/p2_$index/200/200'
        : null,
    tag: index % 3 == 0 ? 'Destacado' : null,
  );
});
