import 'app_colors.dart';
import 'app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        textTheme: getTextTheme(isDark: false),
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.backgroundColor,
          centerTitle: true,
          scrolledUnderElevation: 0,
          titleTextStyle: AppTextStyle.getAppTextStyle(
            weight: FontWeight.bold,
            size: 20.sp, // equal to 18px
            color: AppColors.lightBlack,
          ),
          iconTheme: const IconThemeData(
            color: AppColors.lightBlack,
          ),
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
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.all(AppColors.primaryColor),
        ),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
          alignment: Alignment.centerLeft,
          foregroundColor: AppColors.lightBlack,
        )),
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: AppColors.backgroundColor,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          )),
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

  static ThemeData getDarkAppTheme() => ThemeData.dark().copyWith(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.backgroundColorDark,
        textTheme: getTextTheme(isDark: true),
        indicatorColor: AppColors.white,
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
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: AppTextStyle.getAppTextStyle(
            weight: FontWeight.bold,
            size: 20.sp, // equal to 18px
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
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: AppColors.backgroundColorDark,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          )),
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

  static TextTheme getTextTheme({required bool isDark}) => TextTheme(
        headlineLarge: AppTextStyle.getAppTextStyle(
          weight: FontWeight.bold,
          size: 36.sp, // equal to 34px
          color: isDark ? AppColors.whiteDark : AppColors.lightBlack,
        ),
        headlineMedium: AppTextStyle.getAppTextStyle(
          weight: FontWeight.bold,
          size: 25.sp, // equal to 24px
          color: isDark ? AppColors.whiteDark : AppColors.lightBlack,
        ),
        headlineSmall: AppTextStyle.getAppTextStyle(
          weight: FontWeight.bold,
          size: 20.sp, // equal to 18px
          color: isDark ? AppColors.whiteDark : AppColors.lightBlack,
        ),
        titleLarge: AppTextStyle.getAppTextStyle(
          weight: FontWeight.bold,
          size: 17.sp, // equal to 16px
          color: isDark ? AppColors.whiteDark : AppColors.lightBlack,
        ),
        titleMedium: AppTextStyle.getAppTextStyle(
          size: 17.sp, // equal to 16px
          color: isDark ? AppColors.whiteDark : AppColors.lightBlack,
        ),
        titleSmall: AppTextStyle.getAppTextStyle(
          weight: FontWeight.w500,
          size: 15.sp, // equal to 14px
          color: isDark ? AppColors.whiteDark : AppColors.lightBlack,
        ),
        labelLarge: AppTextStyle.getAppTextStyle(
          size: 15.sp, // equal to 14px
          color: isDark ? AppColors.whiteDark : AppColors.lightBlack,
        ),
        labelMedium: AppTextStyle.getAppTextStyle(
          size: 13.sp, // equal to 11px
          color: isDark ? AppColors.whiteDark : AppColors.lightBlack,
        ),
        labelSmall: AppTextStyle.getAppTextStyle(
          size: 12.sp, // equal to 11px
          color: isDark ? AppColors.greyDark : AppColors.grey,
        ),
      );
}
