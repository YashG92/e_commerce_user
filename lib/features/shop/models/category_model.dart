import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;

  CategoryModel({
    required this.name,
    required this.image,
    required this.id,
    this.parentId = '',
    required this.isFeatured ,
  });



  static CategoryModel empty()=> CategoryModel(id: '', name: '', image: '',isFeatured: false);

  ///Convert CategoryModel to json to send to firebase
 Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'parentId': parentId,
      'isFeatured': isFeatured,
    };
  }

  ///Map json oriented document snapshot data to CategoryModel

  factory CategoryModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if(document.data() != null){
      final data = document.data()!;

      return CategoryModel(
        id: document.id,
        name: data['name'] ?? '',
        image: data['image'] ?? '',
        parentId: data['parentId'] ?? '',
        isFeatured: data['isFeatured'] ?? false,
      );
    }else{
      return CategoryModel.empty();
    }
  }
}
