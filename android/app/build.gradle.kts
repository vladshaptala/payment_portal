plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.payment_portal"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    defaultConfig {
        applicationId = "com.example.payment_portal"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    // ── White-label product flavors ───────────────────────────────────────────
    flavorDimensions += "brand"

    productFlavors {
        create("retail") {
            dimension = "brand"
            applicationIdSuffix = ".retail"
            versionNameSuffix = "-retail"
            resValue("string", "app_name", "Retail Shop Pay")
        }
        create("utility") {
            dimension = "brand"
            applicationIdSuffix = ".utility"
            versionNameSuffix = "-utility"
            resValue("string", "app_name", "Utility Pay")
        }
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}
