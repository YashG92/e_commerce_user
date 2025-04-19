import 'package:cloud_firestore/cloud_firestore.dart';

class SettingsModel {
  final String? id;
  double shippingCost;
  double? freeShippingLimit;

  SettingsModel({
    this.id,
    this.shippingCost = 0.0,
    this.freeShippingLimit,
  });

  Map<String, dynamic> toJson(){
    return {
      'shippingCost': shippingCost,
      'freeShippingLimit': freeShippingLimit,
    };
  }

  factory SettingsModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    if(document.data() != null){
      final data = document.data()!;
      return SettingsModel(
        id: document.id,
        shippingCost: (data['shippingCost'] as num?)?.toDouble() ?? 0.0,
        freeShippingLimit: (data['freeShippingLimit'] as num?)?.toDouble() ?? 0.0,
      );
    }else{
      return SettingsModel();
    }
  }
}
