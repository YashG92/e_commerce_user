import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  String imageUrl;
  bool active;
  String targetScreen;

  BannerModel({
    required this.active,
    required this.imageUrl,
    required this.targetScreen,
  });

  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'active': active,
      'targetScreen': targetScreen,
    };
  }

  factory BannerModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return BannerModel(
      imageUrl: data['imageUrl'] ?? '',
      active: data['active'] ?? false,
      targetScreen: data['targetScreen'] ?? '',
    );
  }
}
