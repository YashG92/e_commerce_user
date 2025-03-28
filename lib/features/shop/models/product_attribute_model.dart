class ProductAttributeModel {
  String? name;
  final List<String>? values;

  ProductAttributeModel({this.name, this.values});

  toJson() {
    return {
      'name': name,
      'values': values,
    };
  }

  factory ProductAttributeModel.fromSnapshot(Map<String, dynamic> document) {
    final data = document;

    if (data.isEmpty) return ProductAttributeModel();

    return ProductAttributeModel(
      name: data.containsKey('name') ? data['name'] : '',
      values: List<String>.from(data['values']),
    );
  }
}
