class CartItemModel {
  String productId;
  String title;
  double price;
  String? image;
  int quantity;
  String variationId;
  String? brandName;
  Map<String, String>? selectedVariation;

  CartItemModel({
    required this.productId,
    required this.quantity,
    this.variationId = '',
    this.image,
    this.price = 0.0,
    this.title = '',
    this.brandName,
    this.selectedVariation,
});

  ///Empty Cart
  static CartItemModel empty() => CartItemModel(productId: '',quantity: 0);

  ///Calculate Total Amount
  String get totalAmount => (price * quantity).toStringAsFixed(1);

  ///Convert a cart item to json
  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'title': title,
      'price': price,
      'image': image,
      'quantity': quantity,
      'variationId': variationId,
      'brandName': brandName,
      'selectedVariation': selectedVariation,
    };
  }

  ///Create a cartitem from json
  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      productId: json['productId'],
      title: json['title'],
      price: json['price'],
      image: json['image'],
      quantity: json['quantity'],
      variationId: json['variationId'],
      brandName: json['brandName'],
      selectedVariation: json['selectedVariation'] != null ? Map<String, String>.from(json['selectedVariation']) : null,
    );
  }
}