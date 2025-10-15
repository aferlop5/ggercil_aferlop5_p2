/// Modelo de datos para los elementos de la lista de la Práctica 2.
/// Contiene la información básica para renderizar cada ítem.
class Item {
  /// Identificador único del elemento.
  final String id;

  /// Título principal a mostrar.
  final String title;

  /// Descripción breve del elemento.
  final String description;

  /// Ruta de la imagen local dentro de assets (por ejemplo: assets/images/img_01.jpg).
  /// Si es `null`, se mostrará un placeholder.
  final String? assetPath;

  /// Información adicional opcional (por ejemplo, categoría o etiqueta).
  final String? tag;

  const Item({
    required this.id,
    required this.title,
    required this.description,
    this.assetPath,
    this.tag,
  });
}

/// Listado de árboles (datos estáticos para la práctica).
/// Asegúrate de colocar las imágenes con estos nombres en `assets/images/`.
final List<Item> mockItems = [
  const Item(
    id: 'olivo',
    title: 'Olivo',
    description:
        'Árbol mediterráneo de hoja perenne, muy resistente a la sequía. Ideal para climas cálidos y secos, necesita mucho sol y poca agua.',
    assetPath: 'assets/images/olivo.jpg',
  ),
  const Item(
    id: 'naranjo',
    title: 'Naranjo',
    description:
        'Árbol frutal de hoja perenne que crece bien en zonas cálidas y templadas. Requiere mucho sol y riego moderado.',
    assetPath: 'assets/images/naranjo.jpg',
  ),
  const Item(
    id: 'limonero',
    title: 'Limonero',
    description:
        'Árbol frutal pequeño típico de climas cálidos sin heladas. Necesita mucho sol y riegos frecuentes, evitando el exceso de agua.',
    assetPath: 'assets/images/limonero.jpg',
  ),
  const Item(
    id: 'pino',
    title: 'Pino',
    description:
        'Árbol conífero resistente, de hoja perenne. Prefiere zonas templadas o montañosas, con sol o semisombra, y poca necesidad de agua.',
    assetPath: 'assets/images/pino.jpg',
  ),
  const Item(
    id: 'roble',
    title: 'Roble',
    description:
        'Árbol grande y longevo de hoja caduca. Se adapta a zonas templadas y húmedas, requiere buena luz y bastante agua.',
    assetPath: 'assets/images/roble.jpg',
  ),
  const Item(
    id: 'almendro',
    title: 'Almendro',
    description:
        'Árbol frutal de flor temprana, típico de climas secos y cálidos. Necesita mucho sol y poca agua.',
    assetPath: 'assets/images/almendro.jpg',
  ),
  const Item(
    id: 'cerezo',
    title: 'Cerezo',
    description:
        'Árbol frutal de hoja caduca, ideal para climas templados. Necesita sol directo y riego moderado.',
    assetPath: 'assets/images/cerezo.jpg',
  ),
  const Item(
    id: 'encina',
    title: 'Encina',
    description:
        'Árbol mediterráneo de hoja perenne, muy resistente a la sequía. Vive bien en zonas secas y cálidas con mucho sol y muy poca agua.',
    assetPath: 'assets/images/encina.jpg',
  ),
  const Item(
    id: 'nogal',
    title: 'Nogal',
    description:
        'Árbol grande de hoja caduca que produce nueces. Prefiere climas templados y húmedos, con buena exposición solar y riego regular.',
    assetPath: 'assets/images/nogal.jpg',
  ),
];
