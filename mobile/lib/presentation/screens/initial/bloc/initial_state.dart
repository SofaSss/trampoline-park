part of '../initial_part.dart';

@freezed
abstract class InitialState with _$InitialState {
  const factory InitialState({required InitialStatus status}) = _InitialState;
}
