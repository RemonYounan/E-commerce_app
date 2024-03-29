import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class AppThemes {
  static const lightTheme = ThemeMode.light;
  static const darkTheme = ThemeMode.dark;
  static const systemTheme = ThemeMode.system;

  static ThemeData getLightAppTheme() => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        primaryColor: AppColors.primaryColor,
        indicatorColor: AppColors.primaryColor,
        scaffoldBackgroundColor: AppColors.backgroundColor,
        // TODO: Add font
        fontFamily: '',
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.backgroundColor,
          centerTitle: true,
          scrolledUnderElevation: 0,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.sp, // equal to 18px
            color: AppColors.lightBlack,
          ),
          iconTheme: const IconThemeData(
            color: AppColors.lightBlack,
          ),
        ),
        switchTheme: const SwitchThemeData(
          trackColor: MaterialStatePropertyAll(AppColors.primaryColor),
        ),
        cardTheme: CardTheme(
          color: AppColors.white,
          surfaceTintColor: Colors.transparent,
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColors.lightBlack,
          elevation: 0,
          splashColor: Colors.transparent,
          foregroundColor: AppColors.white,
          iconSize: 30,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        popupMenuTheme: PopupMenuThemeData(
          color: AppColors.white,
          elevation: 10,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: AppColors.primaryColor,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.backgroundColor,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: AppColors.grey,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            fixedSize: Size(350.w, 50.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
        checkboxTheme: CheckboxThemeData(
          checkColor: const MaterialStatePropertyAll(AppColors.white),
          fillColor: const MaterialStatePropertyAll(AppColors.lightBlack),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        dialogTheme: const DialogTheme(
          surfaceTintColor: Colors.transparent,
        ),
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.all(AppColors.primaryColor),
        ),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
          alignment: Alignment.centerLeft,
          foregroundColor: AppColors.lightBlack,
        )),
        tabBarTheme: TabBarTheme(
          indicatorColor: Colors.transparent,
          overlayColor:
              MaterialStatePropertyAll(AppColors.primaryColor.withOpacity(0.1)),
          indicatorSize: TabBarIndicatorSize.tab,
          labelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15.sp, // equal to 14px
            color: AppColors.white,
          ),
          labelColor: AppColors.white,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(29),
            shape: BoxShape.rectangle,
            color: AppColors.lightBlack,
          ),
          dividerColor: Colors.transparent,
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: AppColors.backgroundColor,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(35),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: const BorderSide(
              color: AppColors.errorColor,
            ),
          ),
          fillColor: AppColors.white,
          filled: true,
          contentPadding: EdgeInsets.all(20.w),
          labelStyle: TextStyle(
            color: AppColors.grey,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  static ThemeData getDarkAppTheme() => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.backgroundColorDark,
        primaryColor: AppColors.primaryColorDark,
        indicatorColor: AppColors.primaryColorDark,
        // TODO: Add font
        fontFamily: '',
        switchTheme: const SwitchThemeData(
          trackColor: MaterialStatePropertyAll(AppColors.primaryColor),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColors.whiteDark,
          elevation: 0,
          splashColor: Colors.transparent,
          foregroundColor: AppColors.backgroundColorDark,
          iconSize: 30,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: AppColors.primaryColorDark,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.backgroundColorDark,
          surfaceTintColor: Colors.transparent,
          foregroundColor: AppColors.backgroundColorDark,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.sp, // equal to 18px
            color: AppColors.whiteDark,
          ),
          iconTheme: const IconThemeData(
            color: AppColors.whiteDark,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.backgroundColorDark,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.primaryColorDark,
          unselectedItemColor: AppColors.greyDark,
        ),
        popupMenuTheme: PopupMenuThemeData(
          color: AppColors.dark,
          elevation: 10,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        cardTheme: CardTheme(
          color: AppColors.dark,
          surfaceTintColor: Colors.transparent,
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        checkboxTheme: CheckboxThemeData(
          checkColor: const MaterialStatePropertyAll(AppColors.dark),
          fillColor: const MaterialStatePropertyAll(AppColors.whiteDark),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        dialogTheme: const DialogTheme(
          surfaceTintColor: Colors.transparent,
          backgroundColor: AppColors.dark,
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: AppColors.primaryColorDark,
        ),
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.all(AppColors.primaryColorDark),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColorDark,
            fixedSize: Size(350.w, 50.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
        tabBarTheme: TabBarTheme(
          indicatorColor: Colors.transparent,
          overlayColor: const MaterialStatePropertyAll(Colors.transparent),
          indicatorSize: TabBarIndicatorSize.tab,
          labelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15.sp, // equal to 14px
            color: AppColors.dark,
          ),
          labelColor: AppColors.dark,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(29),
            color: AppColors.white,
          ),
          dividerColor: Colors.transparent,
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: AppColors.backgroundColorDark,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(35),
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
          alignment: Alignment.centerLeft,
          foregroundColor: AppColors.whiteDark,
        )),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: const BorderSide(
              color: AppColors.errorColorDark,
            ),
          ),
          fillColor: AppColors.dark,
          filled: true,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
          labelStyle: TextStyle(
            color: AppColors.greyDark,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  // static TextTheme getTextTheme({required bool isDark}) => TextTheme(
  //       headlineLarge: AppTextStyle.getAppTextStyle(
  //         weight: FontWeight.bold,
  //         size: 36.sp, // equal to 34px
  //         color: isDark ? AppColors.whiteDark : AppColors.lightBlack,
  //       ),
  //       headlineMedium: AppTextStyle.getAppTextStyle(
  //         weight: FontWeight.bold,
  //         size: 25.sp, // equal to 24px
  //         color: isDark ? AppColors.whiteDark : AppColors.lightBlack,
  //       ),
  //       headlineSmall: AppTextStyle.getAppTextStyle(
  //         weight: FontWeight.bold,
  //         size: 20.sp, // equal to 18px
  //         color: isDark ? AppColors.whiteDark : AppColors.lightBlack,
  //       ),
  //       titleLarge: AppTextStyle.getAppTextStyle(
  //         weight: FontWeight.bold,
  //         size: 17.sp, // equal to 16px
  //         color: isDark ? AppColors.whiteDark : AppColors.lightBlack,
  //       ),
  //       titleMedium: AppTextStyle.getAppTextStyle(
  //         size: 17.sp, // equal to 16px
  //         color: isDark ? AppColors.whiteDark : AppColors.lightBlack,
  //       ),
  //       titleSmall: AppTextStyle.getAppTextStyle(
  //         weight: FontWeight.w500,
  //         size: 15.sp, // equal to 14px
  //         color: isDark ? AppColors.whiteDark : AppColors.lightBlack,
  //       ),
  //       labelLarge: AppTextStyle.getAppTextStyle(
  //         size: 15.sp, // equal to 14px
  //         color: isDark ? AppColors.whiteDark : AppColors.lightBlack,
  //       ),
  //       labelMedium: AppTextStyle.getAppTextStyle(
  //         size: 13.sp, // equal to 11px
  //         color: isDark ? AppColors.whiteDark : AppColors.lightBlack,
  //       ),
  //       labelSmall: AppTextStyle.getAppTextStyle(
  //         size: 12.sp, // equal to 11px
  //         color: isDark ? AppColors.greyDark : AppColors.grey,
  //       ),
  //     );
}
