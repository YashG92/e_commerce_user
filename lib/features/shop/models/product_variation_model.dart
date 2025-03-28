import 'package:get/get.dart';

class ProductVariationModel {
  final String id;
  String sku;
  Rx<String> image;
  String? description;
  double price;
  double salePrice;
  int stock;
  Map<String, String> attributeValues;

  ProductVariationModel({
    required this.id,
    this.sku = '',
    String image = '',
    this.description = '',
    this.price = 0.0,
    this.salePrice = 0.0,
    this.stock = 0,
    required this.attributeValues,
  }) : image = image.obs;

  static ProductVariationModel empty() =>
      ProductVariationModel(id: '', attributeValues: {});

  toJson() {
    return {
      'id': id,
      'image': image.value,
      'description': description,
      'price': price,
      'salePrice': salePrice,
      'sku': sku,
      'stock': stock,
      'attributeValues': attributeValues,
    };
  }

  factory ProductVariationModel.fromSnapshot(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return ProductVariationModel.empty();

    return ProductVariationModel(
      id: data['id'] ?? '',
      price: double.parse((data['price'] ?? 0.0).toString()),
      sku: data['sku'] ?? '',
      description: data['description'] ?? '',
      stock: data['stock'] ?? 0,
      salePrice: double.parse((data['salePrice'] ?? 0.0).toString()),
      image: data['image'] ?? '',
      attributeValues: Map<String, String>.from(data['attributeValues']),
    );
  }
}
