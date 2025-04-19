
class TPricingCalculator {

  /// -- Calculate Price based on tax and shipping
  static double calculateTotalPrice(double productPrice, String location,double shippingCost) {
  double taxRate = getTaxRateForLocation(location);
  double taxAmount = productPrice * taxRate;


  double totalPrice =  productPrice + shippingCost;
  return totalPrice;
  }
  /// Calculate discount percentage between original price and sale price
  static double? calculateDiscountPercentage(double originalPrice, double salePrice) {
    if (originalPrice <= 0 || salePrice <= 0 || salePrice >= originalPrice) return null;

    final discount = ((originalPrice - salePrice) / originalPrice) * 100;
    return double.parse(discount.toStringAsFixed(1)); // e.g. 15.3%
  }

  /// Calculate absolute discount value
  static double? calculateDiscountAmount(double originalPrice, double salePrice) {
    if (originalPrice <= 0 || salePrice <= 0 || salePrice >= originalPrice) return 0;

    return double.parse((originalPrice - salePrice).toStringAsFixed(2));
  }

  /// -- Calculate shipping cost
  static double calculateShippingCost(double productPrice, String location) {
  double shippingCost = getShippingCost(location);
  return shippingCost;
  }
  /// -- Calculate tax
  static String calculateTax(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
  return taxAmount.toStringAsFixed(2);
  }

  static double getTaxRateForLocation(String location) {
  // Lookup the tax rate for the given location from a tax rate database or API.
  // Return the appropriate tax rate.
  return 0.10; // Example tax rate of 10%
  }

  static double getShippingCost(String location) {
  // Lookup the shipping cost for the given location using a shipping rate API.
  // Calculate the shipping cost based on various factors like distance, weight, etc.
  return 40.00; // Example shipping cost of $5
  }

  /// -- Sum all cart values and return total amount
  // static double calculateCartTotal(CartModel cart) {
  //   return cart.items.map((e) => e.price).fold(0, (previousPrice, currentPrice) => previousPrice + (currentPrice ?? 0));
  // }
}
