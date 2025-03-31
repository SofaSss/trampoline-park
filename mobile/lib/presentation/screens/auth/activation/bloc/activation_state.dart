part of '../activation_part.dart';

@freezed
abstract class ActivationState with _$ActivationState {
  const factory ActivationState({required Status status}) = _SignInState;
}
