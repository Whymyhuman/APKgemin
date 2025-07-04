# Add project specific ProGuard rules here.
# By default, the flags in proguard-android.txt are applied automatically.
# You can find the most recent version of this file at
# https://android.googlesource.com/platform/tools/proguard/+/master/proguard-android.txt

# Add any project specific keep options here:

# If your project uses Flutter, uncomment the following lines to keep Flutter-specific classes
# -keep class io.flutter.app.** { *; }
# -keep class io.flutter.plugin.** { *; }
# -keep class io.flutter.util.** { *; }
# -keep class io.flutter.view.** { *; }
# -keep class io.flutter.embedding.** { *; }

# For packages that use reflection or dynamic class loading, you might need to add specific rules.
# Example for sqflite:
-keep class com.tekartik.sqflite.** { *; }
-keep class com.tekartik.sqflite_common.** { *; }

# Example for provider:
-keep class * extends androidx.lifecycle.ViewModel { <init>(...); }

# Example for path_provider:
-keep class io.flutter.plugins.pathprovider.** { *; }

# Example for shared_preferences:
-keep class io.flutter.plugins.sharedpreferences.** { *; }

# Example for intl:
# No specific ProGuard rules usually needed for intl, as it's mostly Dart code.

# Example for file_picker:
-keep class com.mr.flutter.plugin.filepicker.** { *; }

# Example for share_plus:
-keep class dev.fluttercommunity.plus.share.** { *; }
