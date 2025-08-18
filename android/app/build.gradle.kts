import java.io.File
import java.util.Properties

plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
    id("dev.flutter.flutter-gradle-plugin")
    id("com.google.gms.google-services")
    id("com.google.firebase.crashlytics")
    id("com.google.firebase.firebase-perf")
}

android {
    namespace = "com.dna.tarot_ai"
    compileSdk = 35

    signingConfigs {
        create("release") {
            val f = rootProject.file("key.properties")
            if (f.exists()) {
                val p = Properties()
                f.inputStream().use { s -> p.load(s) }

                val storeFilePath = p.getProperty("storeFile").orEmpty()
                if (storeFilePath.isNotBlank()) {
                    storeFile = file(storeFilePath)
                }
                storePassword = p.getProperty("storePassword")
                keyAlias      = p.getProperty("keyAlias")
                keyPassword   = p.getProperty("keyPassword")
            }
        }
    }

    defaultConfig {
        applicationId = "com.dna.tarot_ai"
        minSdk = 23
        targetSdk = 35

        // --- התיקון כאן: קריאת הגרסה מ-local.properties ---
        val lpFile = File(rootDir, "local.properties")
        check(lpFile.exists()) { "local.properties not found" }
        val lp = Properties().apply { lpFile.inputStream().use { load(it) } }
        
        versionCode = lp.getProperty("flutter.versionCode")?.toIntOrNull() ?: 1
        versionName = lp.getProperty("flutter.versionName") ?: "1.0"
        // --- סוף התיקון ---

        manifestPlaceholders["adMobAppId"] = "ca-app-pub-9736164634286640~4848360703"

        vectorDrawables { useSupportLibrary = true }
        multiDexEnabled = true
    }

    // הוסף את הבלוק הבא
splits {
    abi {
        isEnable = true
        reset()
        include("armeabi-v7a", "arm64-v8a", "x86_64")
        isUniversalApk = false
    }
}



    buildTypes {
        getByName("release") {
            signingConfig = signingConfigs.getByName("release")
            
            isMinifyEnabled = true 
            
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
            
            firebaseCrashlytics {
                mappingFileUploadEnabled = true
            }
        }
        getByName("debug") {
            // No special configuration needed for debug by default
        }
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
    kotlinOptions {
        jvmTarget = "17"
    }

    packaging {
        resources {
            excludes += "/META-INF/{AL2.0,LGPL2.1}"
        }
    }
}

dependencies {
    implementation(platform("com.google.firebase:firebase-bom:33.8.0"))
    implementation("androidx.core:core-ktx:1.13.1")
    implementation("androidx.appcompat:appcompat:1.7.0")
    implementation("com.google.android.material:material:1.12.0")
    implementation("com.google.firebase:firebase-crashlytics-ktx")
    implementation("com.google.firebase:firebase-perf-ktx")
    implementation("androidx.multidex:multidex:2.0.1")
}

// Required by Flutter
flutter {
    source = "../.."
}
