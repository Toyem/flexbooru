# Add project specific ProGuard rules here.
# You can control the set of applied configuration files using the
# proguardFiles setting in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}

# Uncomment this to preserve the line number information for
# debugging stack traces.
#-keepattributes SourceFile,LineNumberTable

# If you keep the line number information, uncomment this to
# hide the original source file name.
#-renamesourcefileattribute SourceFile
#noinspection ShrinkerUnresolvedReference

-keepattributes *Annotation*, Exceptions, EnclosingMethod, InnerClasses, Signature

# Glide
-keep public class * implements com.bumptech.glide.module.GlideModule
-keep public class * extends com.bumptech.glide.module.AppGlideModule
-keep public enum com.bumptech.glide.load.ImageHeaderParser$** {
  **[] $VALUES;
  public *;
}

-keepattributes SourceFile,LineNumberTable
-keep public class * extends java.lang.Exception
-keep class com.crashlytics.** { *; }

### Kotlin Coroutine
-keepclassmembernames class kotlinx.** {
    volatile <fields>;
}

-keep class com.google.android.gms.** { *; }

-keep class com.android.vending.billing.**

# Kotlin serialization

-dontnote kotlinx.serialization.AnnotationsKt # core serialization annotations

# kotlinx-serialization-json specific. Add this if you have java.lang.NoClassDefFoundError kotlinx.serialization.json.JsonObjectSerializer
-keepclassmembers class kotlinx.serialization.json.** {
    *** Companion;
}
-keepclasseswithmembers class kotlinx.serialization.json.** {
    kotlinx.serialization.KSerializer serializer(...);
}

-keepclassmembers @kotlinx.serialization.Serializable class onlymash.flexbooru.data.model.** {
    # lookup for plugin generated serializable classes
    *** Companion;
    # lookup for serializable objects
    *** INSTANCE;
    kotlinx.serialization.KSerializer serializer(...);
}
-keepclassmembers @kotlinx.serialization.Serializable class onlymash.flexbooru.common.saucenao.model.** {
    # lookup for plugin generated serializable classes
    *** Companion;
    # lookup for serializable objects
    *** INSTANCE;
    kotlinx.serialization.KSerializer serializer(...);
}
-keepclassmembers @kotlinx.serialization.Serializable class onlymash.flexbooru.common.tracemoe.model.** {
    # lookup for plugin generated serializable classes
    *** Companion;
    # lookup for serializable objects
    *** INSTANCE;
    kotlinx.serialization.KSerializer serializer(...);
}
# lookup for plugin generated serializable classes
-if @kotlinx.serialization.Serializable class onlymash.flexbooru.data.model.**
-keepclassmembers class onlymash.flexbooru.data.model.<1>$Companion {
    kotlinx.serialization.KSerializer serializer(...);
}
-if @kotlinx.serialization.Serializable class onlymash.flexbooru.common.saucenao.model.**
-keepclassmembers class onlymash.flexbooru.common.saucenao.model.<1>$Companion {
    kotlinx.serialization.KSerializer serializer(...);
}
-if @kotlinx.serialization.Serializable class onlymash.flexbooru.common.tracemoe.model.**
-keepclassmembers class onlymash.flexbooru.common.tracemoe.model.<1>$Companion {
    kotlinx.serialization.KSerializer serializer(...);
}

# Serialization supports named companions but for such classes it is necessary to add an additional rule.
# This rule keeps serializer and serializable class from obfuscation. Therefore, it is recommended not to use wildcards in it, but to write rules for each such class.
-keep class onlymash.flexbooru.data.model.SerializableClassWithNamedCompanion$$serializer {
    *** INSTANCE;
}
-keep class onlymash.flexbooru.common.saucenao.model.SerializableClassWithNamedCompanion$$serializer {
    *** INSTANCE;
}
-keep class onlymash.flexbooru.common.tracemoe.model.SerializableClassWithNamedCompanion$$serializer {
    *** INSTANCE;
}

# Kodein
-keep, allowobfuscation, allowoptimization class org.kodein.type.TypeReference
-keep, allowobfuscation, allowoptimization class org.kodein.type.JVMAbstractTypeToken$Companion$WrappingTest

-keep, allowobfuscation, allowoptimization class * extends org.kodein.type.TypeReference
-keep, allowobfuscation, allowoptimization class * extends org.kodein.type.JVMAbstractTypeToken$Companion$WrappingTest
