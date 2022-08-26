class Category {
  final String image, name;
  List<Product> products = [];
  bool isExpanded = false;
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
  Category(image: 'assets/images/threading.png', name: 'WAXING', products: [
    Product(title: 'Arms & Underarms'),
    Product(title: 'Full body')
  ]),
  Category(
      image: 'assets/images/threading.png', name: 'LASH LIFT', products: []),
  Category(
      image: 'assets/images/threading.png',
      name: 'EYELASH EXTENTIONS',
      products: [
        Product(title: 'Classic'),
        Product(title: 'Hybrid'),
        Product(title: 'Russian')
      ]),
  Category(
      image: 'assets/images/threading.png',
      name: 'EYEBROW LAMINATION',
      products: [
        Product(title: 'Brow Lamination'),
        Product(title: 'Brow Lamination + Tinting')
      ]),
  Category(
      image: 'assets/images/threading.png',
      name: 'EYE PIERCING (Kids + Adult)',
      products: [
        Product(title: 'Classic 24ct Gold Earing'),
        Product(title: '24ct Gold Plated & Stainless steel Earing'),
        Product(title: '9ct Gold Earing')
      ])
];
