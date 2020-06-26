---
layout: post
published: true
title: "Converting your Gradle build files to the Kotlin DSL"
date: '2020-06-26 21:45:00 +0200'
categories:
- Android
tags:
- Android
- Gradle
- Kotlin
- Groovy
- kts
---
Ever wanted to customize your Android build workflow and found yourself limited by your knowledge of Gradle's historical configuration language, Groovy?

Well, I have good news for you: for a while now, Gradle has supported Kotlin as a first-class language. Chances are if you're an Android developer and you're reading this, you probably already know Kotlin pretty well (and if not, it's not too late)!

Converting an existing project to the Kotlin DSL can be a bit of a pain if you don't know where to start. This article will try to guide you through the process.

## Before we start

Try to start from a clean state, with a recent version of Gradle, Android Studio, and your build plugins. This is good practice anyway and might prevent some unfortunate incompatibilities.

Be sure to keep some documentation on hand in case you need it:
- [Gradle Kotlin DSL Primer][1]
- [Migrating build logic from Groovy to Kotlin][2]
- [gradle/kotlin-dsl-samples][3]

### Use the `plugins` block
If you're still importing your Gradle plugins using the `apply` syntax, you should start by migrating to the `plugins` block. This has been the recommended practice for a while.

Instead of:
```groovy
apply plugin: 'com.example.hello'
```

Do this:
```groovy
plugins {
    id 'com.example.hello'
}
```

You can also specify the plugin's version, if it's third-party.
```groovy
plugins {
    id 'com.example.hello' version '1.0.0'
}
```

Read more about the plugin DSL in the [Gradle docs][4].

## Convert your Gradle files
A great fact about the Kotlin DSL is that you're not required to migrate everything at once, just like you didn't have to convert your whole Java app to Kotlin at once. It works on a file-by-file basis. Especially great if you have many modules!

Start by renaming one of your `build.gradle` files to `build.gradle.kts`. Everything should break. Gradle doesn't know how to build anything yet and freaks out a little; don't worry, it's fine. 👍

### Some common syntax changes
Before getting deeper into some specific DSL changes, you can apply a first pass on your build files to fix most syntax issues.

#### Single-quoted strings should be converted to double-quoted strings. 
A simple search-and-replace is usually good enough.

Instead of:
```groovy
'proguard-android-optimize.txt'
```

Do this:
```kotlin
"proguard-android-optimize.txt"
```

#### Function calls add parentheses and equal signs for named parameters
This can vary a little depending on the API, but generally looks like this.

Instead of:
```groovy
apply from: 'shared.gradle'
```

```groovy
maven { url 'https://jitpack.io' }
```

Do this:
```kotlin
apply(from = "shared.gradle")
```

```kotlin
maven(url = "https://jitpack.io")
```

#### Kotlin plugins can be declared with a handy `kotlin()` function

Instead of:
```groovy
plugins {
    id 'com.android.library'
    id 'kotlin-android-extensions'
}
```

Do this:
```kotlin
plugins {
    id("com.android.library")
    kotlin("android.extensions")
}
```

#### Array declarations can be declared with `listOf()`

Instead of:
```groovy
freeCompilerArgs = [
    "-Xallow-result-return-type", 
    "-Xuse-experimental=kotlin.Experimental"
]
```

Do this:
```kotlin
freeCompilerArgs = listOf(
    "-Xallow-result-return-type", 
    "-Xuse-experimental=kotlin.Experimental"
)
```

#### Some boolean properties have been renamed
Instead of:
```groovy
minifyEnabled true
```

Do this:
```kotlin
isMinifyEnabled = false
```

## Referencing specific build types
Since the Kotlin DSL doesn't know about dynamically generated build types, you can't write this directly in Kotlin:

```groovy
buildTypes {
    release {
        minifyEnabled false
    }
}
```

Instead, refer to a build type with `named()`:

```kotlin
buildTypes {
    named("release") {
        isMinifyEnabled = false
    }
}
```


## What about properties?
If you have more than a simple project, you probably use project properties to define your versions and dependencies in a centralized way.

Let's pretend you have this `shared.gradle` file:
```groovy
ext {
    min_sdk_version = 21
}
```

In Groovy, you could access these properties by importing the file (probably in your `buildscript {}`):

```groovy
apply from: 'dependencies.gradle'
```

...and simply referencing them from your project file.

```groovy
defaultConfig {
    minSdkVersion min_sdk_version
    targetSdkVersion 30
    versionCode 1
    versionName "1.0.0"
}
```

With the Kotlin DSL, these properties can be declared and delegated to `extra` in a fairly easy way.

```kotlin
val target_sdk_version: String by ext

android {
    compileSdkVersion = target_sdk_version
    ...
}
```

You can also use the map syntax if you need to.

```kotlin
android {
    compileSdkVersion = ext["target_sdk_version"] as String
    ...
}
```

Properties aren't especially the best tool once your whole project uses the Kotlin DSL; however, it could be useful to be able to access them in the meantime.

## Taking advantage of Kotlin
Once your project uses the Kotlin DSL, you can use its full power by creating a `buildSrc` module.

### Creating the module
In your project's root directory, create a new `buildSrc` module with a single `build.gradle.kts` file.

It should look like this:

```kotlin
plugins {
    `kotlin-dsl`
}

repositories {
    jcenter()
}
```

Set up the usual `src/main/kotlin` source tree and sync your project. You can write **regular Kotlin code** here, and it will be available as-is in your build scripts!

### Managing dependencies in Kotlin
This section is all a suggestion; as far as I know, there is no clear guidance on how you should declare and manage your project's dependencies, so you might want to have a different approach with *your* project. But the great thing about the Kotlin DSL is that it's super flexible!

In the case of my application, here's what a module's dependencies used to look like:

```groovy
dependencies {
    implementation "org.jetbrains.kotlin:kotlin-stdlib-jdk8:$kotlin_version"

    implementation "androidx.core:core-ktx:$androidx_core_version"
    implementation "androidx.appcompat:appcompat:$androidx_appcompat_version"

    implementation "androidx.room:room-runtime:$kotlinx_room_version"

    // Network libs
    implementation "com.squareup.retrofit2:retrofit:$retrofit_version"
    implementation "com.squareup.moshi:moshi:$moshi_version"
    kapt "com.squareup.moshi:moshi-kotlin-codegen:$moshi_version"

    // Testing
    testImplementation "org.junit.jupiter:junit-jupiter:$junit_version"
    testImplementation "org.mockito:mockito-core:$mockito_version"
}
```

Now they look like this:

```kotlin
dependencies {
    // Kotlin runtime
    implementation(Dependencies.Kotlin.stdlib)

    implementation(Dependencies.AndroidX.core)
    implementation(Dependencies.AndroidX.appcompat)

    implementation(Dependencies.AndroidX.Room.common)

    // Network libs
    implementation(Dependencies.Retrofit.core)
    implementation(Dependencies.Moshi.core)
    kapt(Dependencies.Moshi.codegen)

    // Testing
    testImplementation(Dependencies.Test.junit)
    testImplementation(Dependencies.Test.mockito)
}
```

I achieved this by creating a `Dependencies.kt` file in `buildSrc`:

```kotlin
object Dependencies {

    object AndroidX {
        const val appcompat = "androidx.appcompat:appcompat:1.3.0-alpha01"
        const val core = "androidx.core:core-ktx:1.3.0"

        object Room {
            private const val version = "2.2.5"
            const val common = "androidx.room:room-ktx:$version"
            const val compiler = "androidx.room:room-compiler:$version"
        }
    }

    object Kotlin {
        private const val version = "1.3.72"
        const val stdlib = "org.jetbrains.kotlin:kotlin-stdlib-jdk8:$version"
        const val plugin = "org.jetbrains.kotlin:kotlin-gradle-plugin:$version"
    }

    object Moshi {
        private const val version = "1.9.2"
        const val core = "com.squareup.moshi:moshi:$version"
        const val codegen = "com.squareup.moshi:moshi-kotlin-codegen:$version"
    }

    object Retrofit {
        private const val version = "2.8.1"
        const val core = "com.squareup.retrofit2:retrofit:$version"
        const val moshiConverter = "com.squareup.retrofit2:converter-moshi:$version"
    }

    object Test {
        const val junit = "org.junit.jupiter:junit-jupiter:5.6.0"
        const val mockito = "org.mockito:mockito-core:3.2.4"
    }
}
```

This makes it super easy to refactor and see which dependency is used by which module, as well as upgrade their versions and keep them in sync.

This method can be extended to manage your build dependencies and their versions, as well as things like app version numbers. You can of course use the Kotlin stdlib to add any needed logic as functions as needed.

## Conclusion
Migrating my personal project to the Gradle Kotlin DSL was not the easiest thing. The lack of conversion tools and succint guides or documentation makes it a bit hard to get into, especially for users who might not already be super familiar with Groovy.

However, with some time to convert each file and some help from [sample projects][3], it's not the hardest task either! The migration can be gradual and brings real advantages, especially for Kotlin lovers. Understanding, extending and optimizing my build system is now easier than ever.

Bye bye, Groovy. 👋

[1]: https://docs.gradle.org/current/userguide/kotlin_dsl.html
[2]: https://guides.gradle.org/migrating-build-logic-from-groovy-to-kotlin/
[3]: https://github.com/gradle/kotlin-dsl-samples/
[4]: https://docs.gradle.org/current/userguide/plugins.html
