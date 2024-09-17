import 'package:image_picker/image_picker.dart';

class ProductsRequestModel {
  final int categoryId;
  final String name;
  final String description;
  final int price;
  final int stock;
  final XFile image;
  ProductsRequestModel({
    required this.categoryId,
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
    required this.image,
  });

  Map<String, String> toMap() {
    return {
      'category_id': categoryId.toString(),
      'name': name,
      'description': description,
      'price': price.toString(),
      'stock': stock.toString(),
    };
  }

  @override
  String toString() {
    return 'ProductsRequestModel(name: $name, description: $description, price: $price, stock: $stock, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductsRequestModel &&
        other.name == name &&
        other.description == description &&
        other.price == price &&
        other.stock == stock &&
        other.image == image;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        description.hashCode ^
        price.hashCode ^
        stock.hashCode ^
        image.hashCode;
  }
}
