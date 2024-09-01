part of 'cart_cubit.dart';

@immutable
sealed class CarState {}

final class CarStateLoading extends CarState {}
final class CarStateLoaded extends CarState {}
final class CarStateEmpty extends CarState {}


