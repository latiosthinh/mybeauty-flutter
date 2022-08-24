class Category {
  final String image, name;
  List<Product>? product = [];
  Category({required this.image, required this.name, this.product});
}

class Product {
  final String title;
  Product({required this.title});
}

List<Category> beautyCategories = [
  Category(image: 'assets/images/threading.png', name: 'THREADING', product: [
    Product(title: 'Eyebrow'),
    Product(title: 'Upper lip/chin'),
    Product(title: 'Full face')
  ]),
  Category(image: 'assets/images/threading.png', name: 'WAXING'),
  Category(image: 'assets/images/threading.png', name: 'LASH LIFT'),
  Category(image: 'assets/images/threading.png', name: 'EYELASH EXTENTIONS'),
  Category(image: 'assets/images/threading.png', name: 'EYEBROW LAMINATION'),
  Category(
      image: 'assets/images/threading.png', name: 'EYE PIERCING (Kids + Adult)')
];
