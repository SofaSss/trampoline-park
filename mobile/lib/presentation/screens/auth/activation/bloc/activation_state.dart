part of '../activation_part.dart';

@freezed
abstract class ActivationState with _$ActivationState {
  const factory ActivationState({required StatusProfile status}) = _SignInState;
}
