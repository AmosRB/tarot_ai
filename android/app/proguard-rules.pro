# כללי ProGuard עבור Flutter
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.embedding.** { *; }
-keep class io.flutter.plugins.** { *; }
-dontwarn io.flutter.embedding.**

# --- כללים חיוניים עבור Firebase (גרסה מורחבת) ---
-keep class com.google.firebase.** { *; }
-keep class com.google.android.gms.internal.firebase_auth.** { *; } # <- זה הכלל שהיה חסר

# --- כללים חיוניים עבור Google Sign-In ---
-keep class com.google.android.gms.auth.api.signin.** { *; }
-keep interface com.google.android.gms.auth.api.signin.** { *; }

# כללים כלליים נוספים שמונעים בעיות נפוצות
-keepattributes Signature
-keepattributes *Annotation*
-dontwarn com.google.android.gms.**
-dontwarn com.google.firebase.**
-keep class com.google.android.gms.common.api.internal.GoogleApiManager {*;}