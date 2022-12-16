// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure({
    required this.message,
  });
  @override
  List<Object?> get props => [message];
}

class OfflineFailure extends Failure {
  const OfflineFailure({required super.message});
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message});
}

// class EmptyCacheFailure extends Failure {
//   @override
//   List<Object?> get props => [];
// }
