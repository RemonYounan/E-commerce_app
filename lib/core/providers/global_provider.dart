import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/common/app_themes.dart';
import 'package:ecommerce_app/core/constants/app_constants.dart';
import 'package:ecommerce_app/core/constants/enums.dart';
import 'package:ecommerce_app/core/helpers/cache_helper.dart';
import 'package:ecommerce_app/features/products/domain/usecases/toggle_favorite_usecase.dart';
import 'package:flutter/material.dart';

class GlobalProvider with ChangeNotifier {
  // ThemeModeManager
  bool _isDark = false;

  GlobalProvider(this._toggleFavoriteUsecase);
  bool get isDark => _isDark;
  ThemeMode _themeMode = AppThemes.systemTheme;
  ThemeMode get themeMode => _themeMode;

  void changeThemeMode(bool isDark) {
    _themeMode = isDark ? AppThemes.darkTheme : AppThemes.lightTheme;
    _isDark = isDark;
    notifyListeners();
    CacheHelper.saveDataSharedPreference(key: 'THEME_MODE', value: isDark);
  }

  void getCachedTheme() async {
    final bool? isDark =
        await CacheHelper.getDataFromSharedPreference(key: 'THEME_MODE');
    if (isDark != null) {
      isDark ? _themeMode = AppThemes.darkTheme : AppThemes.lightTheme;
      _isDark = isDark;
    } else {
      _themeMode = AppThemes.systemTheme;
    }
    notifyListeners();
  }

  // NavbarIndexManager
  int _index = 0;

  int get index => _index;

  void changeIndex(int newIndex) {
    _index = newIndex;
    notifyListeners();
  }

  // sortByManager
  String _sortBy = AppConstants.newToOld;
  String _title = 'newest';

  String get sortBy => _sortBy;
  String get title => _title;

  void changeSortBy(String newSort) {
    _sortBy = newSort;
    if (newSort == AppConstants.newToOld) {
      _title = 'newest'.tr();
    } else if (newSort == AppConstants.priceLowToHigh) {
      _title = 'price_low_to_high';
    } else if (newSort == AppConstants.priceHighToLow) {
      _title = 'price_high_to_low';
    }
    notifyListeners();
  }

  // listStyle Manager
  ListStyle _listStyle = ListStyle.grid;

  ListStyle get listStyle => _listStyle;

  void changeListStyle() {
    if (_listStyle == ListStyle.grid) {
      _listStyle = ListStyle.list;
    } else {
      _listStyle = ListStyle.grid;
    }
    notifyListeners();
  }

  // FavProducts Manager
  final ToggleFavoriteUsecase _toggleFavoriteUsecase;

  late Map<String, dynamic> _favProducts;

  Map<String, dynamic> get favProducts => _favProducts;

  void setFavProducts(favProducts) {
    _favProducts = favProducts;
    notifyListeners();
  }

  Future<void> toggleFavorite(int id, int uid) async {
    if (_favProducts.containsKey('$id')) {
      _favProducts.remove('$id');
    } else {
      _favProducts.addAll({'$id': true});
    }
    notifyListeners();
    final result = await _toggleFavoriteUsecase(id, uid);
    result.fold(
      (error) => null,
      (favProducts) {
        _favProducts = favProducts;
      },
    );
    notifyListeners();
  }
}
