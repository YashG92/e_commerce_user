import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {

  final String id;
  String fullName;
  String email;
  String phoneNumber;
  String profilePicture;

  UserModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
});


  static UserModel empty() =>
      UserModel(id: '',
          fullName: '',
          email: '',
          phoneNumber: '',
          profilePicture: '');


  ///Convert model to JSon structure for storing data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'FullName': fullName,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
    };
  }

  ///Factory method to create UserModel from Firebase document Snapshot.
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
      id: document.id,
      fullName: data['FullName'] ?? "",
      email: data['Email'] ?? "",
      phoneNumber: data['PhoneNumber'] ?? "",
      profilePicture: data['ProfilePicture'] ?? "",
    );
  }
}