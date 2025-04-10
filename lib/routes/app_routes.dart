import 'package:e_commerce_user/features/authentication/screens/login/login.dart';
import 'package:e_commerce_user/features/authentication/screens/onboarding/onboarding.dart';
import 'package:e_commerce_user/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:e_commerce_user/features/authentication/screens/signup/signup.dart';
import 'package:e_commerce_user/features/personaliztion/screens/address/address.dart';
import 'package:e_commerce_user/features/personaliztion/screens/profile/profile.dart';
import 'package:e_commerce_user/features/shop/screens/checkout/checkout_screen.dart';
import 'package:e_commerce_user/features/shop/screens/home/home.dart';
import 'package:e_commerce_user/features/shop/screens/order/order.dart';
import 'package:e_commerce_user/features/shop/screens/product_reviews/product_review.dart';
import 'package:e_commerce_user/features/shop/screens/wishlist/wishlist.dart';
import 'package:e_commerce_user/routes/routes.dart';
import 'package:get/get.dart';

import '../features/authentication/screens/signup/verify_email.dart';
import '../features/personaliztion/screens/settings/settings.dart';
import '../features/shop/screens/cart/cart.dart';
import '../features/shop/screens/shop/store.dart';

class AppRoutes {
  static final pages =[
    GetPage(name: Routes.home, page: ()=> HomeScreen()),
    GetPage(name: Routes.store, page: ()=> StoreScreen()),
    GetPage(name: Routes.favourites, page: ()=> WishlistScreen()),
    GetPage(name: Routes.settings, page: ()=> SettingsScreen()),
    GetPage(name: Routes.productReviews, page: ()=> ProductReviewScreen()),
    GetPage(name: Routes.order, page: ()=> OrderListScreen()),
    GetPage(name: Routes.checkout, page: ()=> CheckoutScreen()),
    GetPage(name: Routes.cart, page: ()=> CartScreen()),
    GetPage(name: Routes.userProfile, page: ()=> ProfileScreen()),
    GetPage(name: Routes.userAddress, page: ()=> UserAddressScreen()),
    GetPage(name: Routes.signUp, page: ()=> SignupScreen()),
    GetPage(name: Routes.verifyEmail, page: ()=> VerifyEmailScreen()),
    GetPage(name: Routes.signIn, page: ()=> LoginScreen()),
    GetPage(name: Routes.forgetPassword, page: ()=> ForgetPassword()),
    GetPage(name: Routes.onBoarding, page: ()=> OnBoardingScreen()),


  ];
}