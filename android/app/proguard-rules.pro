# Razorpay SDK rules
-keep class com.razorpay.** { *; }
-keep class proguard.annotation.** { *; }
-keepclasseswithmembers class * {
    @com.razorpay.* <methods>;
}
-keepclassmembers class * {
    @com.razorpay.* <fields>;
}
-dontwarn com.razorpay.**