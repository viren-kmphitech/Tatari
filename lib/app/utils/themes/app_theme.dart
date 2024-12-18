import 'package:flutter/material.dart';
import 'package:tatari/app/utils/constants/app_colors.dart';

// TextTheme textTheme = Get.theme.textTheme;
// ColorScheme colorScheme = Get.theme.colorScheme;

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,

    colorScheme: ColorScheme(
      brightness: Brightness.light,

      ///primary
      primary: AppColors.primaryColor,
      onPrimary: AppColors.white,
      primaryContainer: AppColors.bgOneColor,

      ///secondary
      secondary: AppColors.secondaryColor,
      onSecondary: AppColors.black,
      secondaryContainer: AppColors.greyTextColor,

      ///Error
      error: AppColors.red,
      onError: AppColors.red,

      /// Field Bg Color & Text Selection
      surface: AppColors.bgTwoColor,

      ///Please Make Sure onSurface should be Primary Color
      onSurface: AppColors.primaryColor,

      /// Borders
      outline: AppColors.primaryColor,
    ),
    scaffoldBackgroundColor: AppColors.white,
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.white; // Active thumb color
        }
        return AppColors.red; // Inactive thumb color
      }),
      trackColor: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.greyTextColor.withOpacity(0.5);
          }
          return AppColors.red.withOpacity(0.5);
        },
      ),
      thumbIcon: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const Icon(
            Icons.done,
            color: AppColors.primaryColor,
          );
        }
        return null;
      }),
    ),

    /// Whenever your use the AppBar make sure most of the scenario your AppBar theme is must be sat here.
    appBarTheme: const AppBarTheme(
      elevation: 0,
      color: AppColors.primaryColor,
      titleTextStyle: TextStyle(
        fontFamily: 'Outfit',
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: AppColors.white,
      ),
      iconTheme: IconThemeData(color: AppColors.white),
    ),

    /// If you app supports a single FontFamily, So this is the best way to change FontFamily for allover the app.
    fontFamily: 'Outfit',
    checkboxTheme: CheckboxThemeData(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      visualDensity: VisualDensity.compact,
      fillColor: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primaryColor;
          }
          return AppColors.white;
        },
      ),
    ),

    /// InputDecorationTheme is used for make you TextFormField, DropDownFormField and many more widget.
    /// Those Widget Which is depended on InputDecorationTheme.
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.borderColor, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.primaryColor, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.borderColor, width: 1),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.borderColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.red),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 18),
      // contentPadding: const EdgeInsets.all(16),
      errorStyle: const TextStyle(color: AppColors.red, fontSize: 12, fontWeight: FontWeight.w600),
      hintStyle: WidgetStateTextStyle.resolveWith(
        (states) {
          if (states.contains(WidgetState.error)) {
            return const TextStyle(
              color: AppColors.red,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            );
          }
          return TextStyle(
            color: AppColors.greyTextColor,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          );
        },
      ),
      labelStyle: WidgetStateTextStyle.resolveWith(
        (states) {
          if (states.contains(WidgetState.error)) {
            return const TextStyle(
              color: AppColors.red,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            );
          }
          return TextStyle(
            color: AppColors.greyTextColor,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          );
        },
      ),
      floatingLabelStyle: WidgetStateTextStyle.resolveWith(
        (states) {
          if (states.contains(WidgetState.error)) {
            return const TextStyle(
              color: AppColors.red,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            );
          }
          return const TextStyle(
            color: AppColors.primaryColor,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          );
        },
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
    ),
    dividerColor: AppColors.bgOneColor,
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.primaryColor,
    ),
    textTheme: TextTheme(
      /// Used for Headline Like AppBar And Other Titles which are largest in Ui.
      headlineLarge: TextStyle(fontSize: 26, color: AppColors.secondaryColor, fontWeight: FontWeight.w600), // ---
      headlineMedium: TextStyle(color: AppColors.secondaryColor, fontSize: 24, fontWeight: FontWeight.w600), // ---
      headlineSmall: const TextStyle(color: AppColors.black, fontSize: 22, fontWeight: FontWeight.w500), // ---

      ///  title styles:  are smaller than headline styles and should be used for shorter, medium-emphasis text.

      /// Used For Most Used Styles
      bodyLarge: const TextStyle(color: AppColors.black, fontSize: 20, fontWeight: FontWeight.w500), // ---
      bodyMedium: TextStyle(color: AppColors.greyTextColor, fontSize: 18, fontWeight: FontWeight.w400),
      bodySmall: const TextStyle(color: AppColors.black0A, fontSize: 16, fontWeight: FontWeight.w400), // --

      ///USED for Description and Small Text.
      labelLarge: TextStyle(color: AppColors.greyTextColor, fontSize: 18, fontWeight: FontWeight.w400), // ---
      labelMedium: const TextStyle(fontSize: 16, color: AppColors.black, fontWeight: FontWeight.w400), // ---
      labelSmall: TextStyle(color: AppColors.greyTextColor, fontSize: 14, fontWeight: FontWeight.w400),

      //   Also U can add More TextStyle According Your Design
    ),
  );

  /*static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,

      ///primary
      primary: AppColors.primaryColor,
      onPrimary: AppColors.black,
      primaryContainer: AppColors.bgOneColor,

      ///secondary
      secondary: AppColors.secondaryColor,
      onSecondary: AppColors.white,
      secondaryContainer: AppColors.greyTextColor,

      ///Error
      error: AppColors.red,
      onError: AppColors.red,

      /// Field Bg Color & Text Selection
      surface: AppColors.bgTwoColor,

      ///Please Make Sure onSurface should be Primary Color
      onSurface: AppColors.primaryColor,

      /// Borders
      outline: AppColors.primaryColor,
    ),
    scaffoldBackgroundColor: AppColors.black,
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.white; // Active thumb color
        }
        return AppColors.red; // Inactive thumb color
      }),
      trackColor: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.greyTextColor.withOpacity(0.5);
          }
          return AppColors.red.withOpacity(0.5);
        },
      ),
      thumbIcon: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const Icon(
            Icons.done,
            color: AppColors.primaryColor,
          );
        }
        return null;
      }),
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      color: AppColors.primaryColor,
      titleTextStyle: TextStyle(
        fontFamily: 'Outfit',
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: AppColors.white,
      ),
      iconTheme: IconThemeData(color: AppColors.black),
    ),
    fontFamily: 'Outfit',
    checkboxTheme: CheckboxThemeData(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      visualDensity: VisualDensity.compact,
      fillColor: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primaryColor;
          }
          return AppColors.black;
        },
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.greyTextColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.red),
      ),
      contentPadding: const EdgeInsets.all(8),
      errorStyle: const TextStyle(color: AppColors.red, fontSize: 12, fontWeight: FontWeight.w600),
      hintStyle: WidgetStateTextStyle.resolveWith(
        (states) {
          if (states.contains(WidgetState.error)) {
            return const TextStyle(
              color: AppColors.red,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            );
          }
          return const TextStyle(
            color: AppColors.primaryColor,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          );
        },
      ),
      labelStyle: WidgetStateTextStyle.resolveWith(
        (states) {
          if (states.contains(WidgetState.error)) {
            return const TextStyle(
              color: AppColors.red,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            );
          }
          return const TextStyle(
            color: AppColors.primaryColor,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          );
        },
      ),
      floatingLabelStyle: WidgetStateTextStyle.resolveWith(
        (states) {
          if (states.contains(WidgetState.error)) {
            return const TextStyle(
              color: AppColors.red,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            );
          }
          return const TextStyle(
            color: AppColors.primaryColor,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          );
        },
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
    ),
    dividerColor: AppColors.bgOneColor,
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.primaryColor,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(debugLabel: 'blackMountainView displayLarge', fontFamily: 'Roboto', color: Colors.black54, decoration: TextDecoration.none),
      displayMedium: TextStyle(debugLabel: 'blackMountainView displayMedium', fontFamily: 'Roboto', color: Colors.black54, decoration: TextDecoration.none),
      displaySmall: TextStyle(debugLabel: 'blackMountainView displaySmall', fontFamily: 'Roboto', color: Colors.black54, decoration: TextDecoration.none),
      headlineLarge: TextStyle(debugLabel: 'blackMountainView headlineLarge', fontFamily: 'Roboto', color: Colors.black54, decoration: TextDecoration.none),
      headlineMedium: TextStyle(debugLabel: 'blackMountainView headlineMedium', fontFamily: 'Roboto', color: Colors.black54, decoration: TextDecoration.none),
      headlineSmall: TextStyle(debugLabel: 'blackMountainView headlineSmall', fontFamily: 'Roboto', color: Colors.black87, decoration: TextDecoration.none),
      titleLarge: TextStyle(debugLabel: 'blackMountainView titleLarge', fontFamily: 'Roboto', color: Colors.black87, decoration: TextDecoration.none),
      titleMedium: TextStyle(debugLabel: 'blackMountainView titleMedium', fontFamily: 'Roboto', color: Colors.black87, decoration: TextDecoration.none),
      titleSmall: TextStyle(debugLabel: 'blackMountainView titleSmall', fontFamily: 'Roboto', color: Colors.black, decoration: TextDecoration.none),
      bodyLarge: TextStyle(debugLabel: 'blackMountainView bodyLarge', fontFamily: 'Roboto', color: Colors.black87, decoration: TextDecoration.none),
      bodyMedium: TextStyle(debugLabel: 'blackMountainView bodyMedium', fontFamily: 'Roboto', color: Colors.black87, decoration: TextDecoration.none),
      bodySmall: TextStyle(debugLabel: 'blackMountainView bodySmall', fontFamily: 'Roboto', color: Colors.black54, decoration: TextDecoration.none),
      labelLarge: TextStyle(debugLabel: 'blackMountainView labelLarge', fontFamily: 'Roboto', color: Colors.black87, decoration: TextDecoration.none),
      labelMedium: TextStyle(debugLabel: 'blackMountainView labelMedium', fontFamily: 'Roboto', color: Colors.black, decoration: TextDecoration.none),
      labelSmall: TextStyle(debugLabel: 'blackMountainView labelSmall', fontFamily: 'Roboto', color: Colors.black, decoration: TextDecoration.none),

      /// Used for Headline Like AppBar And Other Titles which are largest in Ui.
      // headlineLarge: const TextStyle(color: AppColors.white, fontSize: 26, fontWeight: FontWeight.w600),
      // headlineMedium: const TextStyle(color: AppColors.white, fontSize: 22, fontWeight: FontWeight.w600),
      // headlineSmall: const TextStyle(color: AppColors.white, fontSize: 20, fontWeight: FontWeight.w600),

      // ///  title styles:  are smaller than headline styles and should be used for shorter, medium-emphasis text.
      // // titleLarge: ,

      // /// Used For Most Used Styles
      // bodyLarge: const TextStyle(color: AppColors.white, fontSize: 20, fontWeight: FontWeight.w500),
      // bodyMedium: const TextStyle(color: AppColors.white, fontSize: 18, fontWeight: FontWeight.w500),
      // bodySmall: const TextStyle(color: AppColors.white, fontSize: 16, fontWeight: FontWeight.w500),

      // ///USED for Description and Small Text.
      // labelLarge: TextStyle(color: AppColors.bgOneColor, fontSize: 18, fontWeight: FontWeight.w400),
      // labelMedium: TextStyle(color: AppColors.bgOneColor, fontSize: 16, fontWeight: FontWeight.w400),
      // labelSmall: TextStyle(color: AppColors.bgOneColor, fontSize: 14, fontWeight: FontWeight.w400),

      //   Also U can add More TextStyle According Your Design
    ),
  );*/
}
