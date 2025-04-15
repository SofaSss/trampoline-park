part of '../booking_event_part.dart';

@freezed
abstract class EventBookingState with _$EventBookingState {
  const factory EventBookingState({
    required EventStatus status,
    @Default({}) Map<InputErrorTypeEnum, InputFieldError> errors,
    @Default([]) List<CoachCostumeModel> coachCostumeList,
    @Default([]) List<OptionalServiceModel> showProgramList,
    @Default([]) List<OptionalServiceModel> masterClassList,
    @Default(' ') String photoPrice,
    @Default(' ') String videoPrice,
    @Default(' ') String finalVideoPrice,
    @Default(' ') String finalPhotoPrice,
    @Default(' ') String finalAnimatorPrice,
    @Default(' ') String finalPrice,
  }) = _EventBookingState;
}
