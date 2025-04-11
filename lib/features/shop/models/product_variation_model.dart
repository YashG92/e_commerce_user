import 'package:get/get.dart';

class ProductVariationModel {
  final String id;
  String sku;
  String image;
  String? description;
  double price;
  double salePrice;
  final int soldQuantity;
  int stock;
  Map<String, String> attributeValues;

  ProductVariationModel({
    required this.id,
    this.sku = '',
    this.image = '',
    this.description = '',
    this.price = 0.0,
    this.salePrice = 0.0,
    this.soldQuantity = 0,
    this.stock = 0,
    required this.attributeValues,
  });

  static ProductVariationModel empty() =>
      ProductVariationModel(id: '', attributeValues: {});

  ProductVariationModel copyWith({
    String? id,
    String? description,
    String? image,
    double? price,
    double? salePrice,
    String? sku,
    int? soldQuantity,
    int? stock,
    Map<String, String>? attributeValues,
  }) {
    return ProductVariationModel(
      id: id ?? this.id,
      description: description ?? this.description,
      image: image ?? this.image,
      price: price ?? this.price,
      salePrice: salePrice ?? this.salePrice,
      sku: sku ?? this.sku,
      soldQuantity: soldQuantity ?? this.soldQuantity,
      stock: stock ?? this.stock,
      attributeValues: attributeValues ?? this.attributeValues,
    );
  }

  toJson() {
    return {
      'id': id,
      'image': image,
      'description': description,
      'price': price,
      'salePrice': salePrice,
      'soldQuantity': soldQuantity,
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
      soldQuantity: data['soldQuantity'] ?? 0,
      salePrice: double.parse((data['salePrice'] ?? 0.0).toString()),
      image: data['image'] ?? '',
      attributeValues: Map<String, String>.from(data['attributeValues']),
    );
  }
}
