// FIX THIS CRAP LATER

class Product {
  Product({required this.item});

  Map<String, Object>? item;

  factory Product.fromItem(var data) {
    String type = data['type'];
    switch (type) {
      case 'clothing':
        return Clothing(
          name: data['name'],
          type: data['name'],
          imageUrls: data['name'],
          quantity: data['name'],
          category: data['name'],
          colors: data['name'],
          tags: data['name'],
          fit: data['name'],
          condition: data['name'],
          materials: data['name'],
          occasions: data['name'],
          value: data['name'],
        );
      default:
        return Clothing(
          name: '',
          type: '',
          imageUrls: [],
          quantity: {},
          category: '',
          colors: [],
          tags: [],
          fit: '',
          condition: '',
          materials: [],
          occasions: [],
          value: {},
        );
    }
  }
}

class Clothing implements Product {
  String name;
  List<String> imageUrls;
  Map<String, int> quantity;
  List<String> colors;
  List<String> tags;
  String fit;
  String condition;
  List<String> materials;
  List<String> occasions;
  String category;
  Map<String, Object> value;
  String type;

  Clothing(
      {required this.name,
      required this.imageUrls,
      required this.quantity,
      required this.colors,
      required this.tags,
      required this.fit,
      required this.condition,
      required this.materials,
      required this.occasions,
      required this.category,
      required this.value,
      required this.type});

  @override
  Map<String, Object>? item;
}