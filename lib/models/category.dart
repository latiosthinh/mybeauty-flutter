class Category {
  final String image, name;
  List<Product> products = [];
  Category({required this.image, required this.name, required this.products});
}

class Product {
  final String title;
  Product({required this.title});
}

List<Category> beautyCategories = [
  Category(image: 'assets/images/threading.png', name: 'THREADING', products: [
    Product(title: 'Eyebrow'),
    Product(title: 'Upper lip/chin'),
    Product(title: 'Full face')
  ]),
  Category(image: 'assets/images/threading.png', name: 'WAXING', products: []),
  Category(
      image: 'assets/images/threading.png', name: 'LASH LIFT', products: []),
  Category(
      image: 'assets/images/threading.png',
      name: 'EYELASH EXTENTIONS',
      products: []),
  Category(
      image: 'assets/images/threading.png',
      name: 'EYEBROW LAMINATION',
      products: []),
  Category(
      image: 'assets/images/threading.png',
      name: 'EYE PIERCING (Kids + Adult)',
      products: [])
];
