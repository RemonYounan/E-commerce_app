import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/helpers/cache_helper.dart';
import '../../../domain/entities/cart.dart';
import '../../../domain/entities/cart_product.dart';
import '../../../../products/domain/entities/product.dart';
import 'package:equatable/equatable.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  Cart _cart = Cart();
  CartCubit() : super(CartEmptyState());

  Cart get cart => _cart;

  void addToCart({Product? product, CartProduct? newCartProduct}) {
    emit(CartLoadingState());
    late CartProduct cartProduct;
    if (product != null) {
      cartProduct = CartProduct(
        id: product.id,
        name: product.name,
        price: product.price,
        img: product.img,
        category: product.category,
        count: 1,
        isNew: product.isNew,
        isOnSale: product.isOnSale,
        saleDisc: product.saleDisc,
      );
    } else {
      cartProduct = newCartProduct!;
    }
    if (_cart.products.isEmpty) {
      _cart = Cart(products: [cartProduct], totalAmount: cartProduct.price);
    } else {
      bool isInCart = false;
      for (var prod in _cart.products) {
        if (prod.id == cartProduct.id) {
          prod.count += 1;
          isInCart = true;
        }
      }
      if (!isInCart) {
        _cart.products.add(cartProduct);
      }
      _cart.totalAmount += cartProduct.price;
    }
    emit(ProductAddedState());
    emit(CartLoadedState(cart: _cart));
    saveCartInSharedPrefernce();
  }

  void increaseProductQuantity(int id) {
    emit(CartLoadingState());
    for (var prod in _cart.products) {
      if (prod.id == id) {
        prod.count += 1;
        _cart.totalAmount += prod.price;
      }
    }
    emit(ProductAddedState());
    emit(CartLoadedState(cart: _cart));
    saveCartInSharedPrefernce();
  }

  void decreaseProductQuantity(int id) {
    emit(CartLoadingState());
    for (var prod in _cart.products) {
      if (prod.id == id) {
        // here we just decreasing the count not removing the product from cart
        if (prod.count != 1) {
          prod.count -= 1;
          _cart.totalAmount -= prod.price;
          emit(ProductRemovedState());
          emit(CartLoadedState(cart: _cart));
          saveCartInSharedPrefernce();
        }
      }
    }
  }

  void removeFromCart(int id) {
    emit(CartLoadingState());
    final product = _cart.products.firstWhere((element) => element.id == id);
    if (_cart.totalAmount != 0) {
      _cart.totalAmount -= product.price * product.count;
    }
    _cart.products.removeWhere((element) => element.id == id);
    emit(ProductRemovedState());
    if (_cart.products.isEmpty) {
      clearCart();
    } else {
      emit(CartLoadedState(cart: _cart));
      saveCartInSharedPrefernce();
    }
  }

  void saveCartInSharedPrefernce() {
    final cartJsonString = json.encode(_cart.toJson());
    CacheHelper.saveDataSharedPreference(key: 'CART', value: cartJsonString);
  }

  void getCartFromSharedPreference() {
    emit(CartLoadingState());
    final String? cartJsonString =
        CacheHelper.getDataFromSharedPreference(key: 'CART');
    if (cartJsonString != null) {
      _cart = Cart.fromJson(json.decode(cartJsonString));
      emit(CartLoadedState(cart: _cart));
    } else {
      emit(CartEmptyState());
    }
  }

  void clearCart() {
    emit(CartLoadingState());
    _cart = Cart();
    CacheHelper.removeData(key: 'CART');
    emit(CartEmptyState());
  }
}
