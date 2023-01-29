// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/helpers/cache_helper.dart';
import 'package:ecommerce_app/features/profile/data/models/credit_card_model.dart';
import 'package:ecommerce_app/features/profile/domain/entities/credit_card.dart';
import 'package:equatable/equatable.dart';

import 'package:ecommerce_app/features/profile/domain/usecases/get_state_usecase.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(
    this.getStateUsecase,
  ) : super(ProfileInitial());

  final GetStateUsecase getStateUsecase;

  final List<CreditCard> cards = [];
  int defaultCard = 0;

  Future<Map<String, dynamic>> getState(String key) async {
    final respone = await getStateUsecase(key);
    Map<String, dynamic> states = {};
    respone.fold(
      (error) => emit(ProfileErrorState(message: error.message)),
      (data) => states = data,
    );
    return states;
  }

  void addCreditCard(CreditCard card) {
    emit(ProfileLoadingState());
    cards.add(card);
    defaultCard = card.cardNumber;
    emit(AddedCardState(cards: cards, defaultCard: defaultCard));
    saveCardsSharedPrefrence();
  }

  void setDefaultCard(int cardNumber) {
    emit(ProfileLoadingState());
    defaultCard = cardNumber;
    emit(AddedCardState(cards: cards, defaultCard: defaultCard));
  }

  void saveCardsSharedPrefrence() {
    final cardsJson = cards.map((card) {
      final cardModel = CreditCardModel(
        name: card.name,
        cardNumber: card.cardNumber,
        expiryDate: card.expiryDate,
        cvv: card.cvv,
      );
      return cardModel.toJson();
    }).toList();
    CacheHelper.saveDataSharedPreference(
        key: 'CREDIT_CARDS', value: json.encode(cardsJson));
  }

  void getCardsSharedPrefrence() {
    emit(ProfileLoadingState());
    final cardsJson =
        CacheHelper.getDataFromSharedPreference(key: 'CREDIT_CARDS');
    if (cardsJson != null) {
      final List cardsJsonList = json.decode(cardsJson);
      cards.addAll(
          cardsJsonList.map((e) => CreditCardModel.fromJson(e)).toList());
      defaultCard = cards.first.cardNumber;
      emit(AddedCardState(cards: cards, defaultCard: cards.first.cardNumber));
    } else {
      emit(const AddedCardState(cards: []));
    }
  }
}
