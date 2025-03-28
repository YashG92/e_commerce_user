import 'package:cloud_firestore/cloud_firestore.dart';

import 'category_model.dart';


class BrandModel {
  String id;
  String name;
  String image;
  bool isFeatured;
  int? productsCount;

  //Not mapped

  BrandModel({
    required this.name,
    required this.image,
    required this.id,
    this.isFeatured = false,
    this.productsCount,
  });

  static BrandModel empty() => BrandModel(id: '', image: '', name: '');


  toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'isFeatured': isFeatured,
      'productsCount': productsCount,
    };
  }

  factory BrandModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      return BrandModel(
        id: document.id,
        name: data['name'] ?? '',
        image: data['image'] ?? '',
        productsCount: data['productsCount'] ?? 0,
        isFeatured: data['isFeatured'] ?? false,
      );
    }else{
      return BrandModel.empty();
    }
  }

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    final data = json;
    if(data.isEmpty) return BrandModel.empty();
    return BrandModel(
      id: data['id'] ?? '',
      name: data['name'] ?? '',
      image: data['image'] ?? '',
      isFeatured: data['isFeatured'] ?? false,
      productsCount: int.parse((data['productsCount'] ?? 0).toString()),
    );
  }
}
