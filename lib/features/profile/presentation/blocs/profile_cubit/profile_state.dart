part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  const ProfileState({
    this.cards = const [],
    this.defaultCard = 0,
  });
  final List<CreditCard> cards;
  final int defaultCard;

  @override
  List<Object> get props => [cards];
}

class ProfileInitial extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class AddedCardState extends ProfileState {
  const AddedCardState({super.cards, super.defaultCard});

  @override
  List<Object> get props => [cards];
}

class ProfileErrorState extends ProfileState {
  final String message;

  const ProfileErrorState({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
