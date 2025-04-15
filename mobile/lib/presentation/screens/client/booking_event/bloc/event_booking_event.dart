part of '../booking_event_part.dart';

@freezed
abstract class EventBookingEvent with _$EventBookingEvent {
  const factory EventBookingEvent.loadData() = _LoadData;

  const factory EventBookingEvent.createEvent({
    required DateTime date,
    required DateTime eventStartTime,
    required DateTime eventEndTime,
    required bool isPhotographer,
    required bool isVideographer,
    required List<int?> optionalService,
    required int coachCostume,
  }) = _CreateEvent;

  const factory EventBookingEvent.validateCreateEventData({
    required DateTime? date,
    required String? eventStartTime,
    required String? eventEndTime,
    required int? coachCostume,
    required bool isPhotographer,
    required bool isVideographer,
    required int? masterClassPrice,
    required int? showPrice,
  }) = _ValidateCreateEventData;

  const factory EventBookingEvent.finalPrice({
    required DateTime eventStartTime,
    required DateTime eventEndTime,
    required bool isPhotographer,
    required bool isVideographer,
    required int coachCostumePrice,
    required int? masterClassPrice,
    required int? showPrice,
  }) = _FinalPrice;
}
