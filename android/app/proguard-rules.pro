# Keep Retrofit and OkHttp classes
-keep class retrofit2.** { *; }
-keep class okhttp3.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.app.** { *; }

# Keep your application classes and methods
-keep class budgetcare.com.budgetcare.** { *; }

# Keep any other necessary classes

# Keep Play Core classes
-keep class com.google.android.play.** { *; }
-dontwarn com.google.android.play.**

# Keep Tink crypto library (if used)
-keep class com.google.crypto.tink.** { *; }
-dontwarn com.google.crypto.tink.**

# Keep ErrorProne annotations
-keep class com.google.errorprone.annotations.** { *; }
-dontwarn com.google.errorprone.annotations.**

# Keep JavaX annotations
-keep class javax.annotation.** { *; }
-dontwarn javax.annotation.**

