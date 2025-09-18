// android/settings.gradle.kts  — תואם Gradle 8.9 + Kotlin DSL + Flutter

pluginManagement {
    // מחשבים את נתיב ה-Flutter SDK כאן, כדי שיהיה זמין ל-includeBuild:
    val flutterSdkPath: String = run {
        // 1) קודם ממשתנה סביבה FLUTTER_SDK (מומלץ להגדיר ל: C:/src/flutter)
        val fromEnv = System.getenv("FLUTTER_SDK")
        if (!fromEnv.isNullOrBlank()) return@run fromEnv.replace('\\', '/')

        // 2) אחרת – מתוך local.properties (שנוצר ע"י Flutter)
        val props = java.util.Properties()
        val lp = java.io.File(rootDir, "local.properties")
        if (lp.exists()) lp.inputStream().use { props.load(it) }
        val fromProps = props.getProperty("flutter.sdk") ?: ""

        if (fromProps.isBlank()) {
            throw GradleException(
                "Missing Flutter SDK. הגדר FLUTTER_SDK במשתני הסביבה או הוסף 'flutter.sdk=...' ל־android/local.properties"
            )
        }
        fromProps.replace('\\', '/')
    }

    // חיבור ה-Gradle של Flutter
    includeBuild("$flutterSdkPath/packages/flutter_tools/gradle")

    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }

    // גרסאות פלאגינים של Google/Firebase (מרוכז כאן פעם אחת)
    plugins {
        id("com.google.gms.google-services") version "4.4.2"
        id("com.google.firebase.crashlytics") version "3.0.2"
        id("com.google.firebase.firebase-perf") version "1.4.2"
    }
}

// פלאגינים גלובליים (AGP/Kotlin/Loader) — מתאימים ל-Gradle 8.9
plugins {
    id("dev.flutter.flutter-plugin-loader") version "1.0.0"
    id("com.android.application") version "8.7.2" apply false
    id("org.jetbrains.kotlin.android") version "2.1.0" apply false
}

dependencyResolutionManagement {
   repositoriesMode.set(RepositoriesMode.PREFER_PROJECT)

    repositories {
    google()
    mavenCentral()
    maven { url = uri("https://storage.googleapis.com/download.flutter.io") }
}

}

rootProject.name = "tarot_ai"
include(":app")
