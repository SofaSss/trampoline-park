part of '../activation_part.dart';

@freezed
abstract class ActivationEvent with _$ActivationEvent {
  const factory ActivationEvent({required String uid, required String token}) =
      _ActivationEvent;
}
