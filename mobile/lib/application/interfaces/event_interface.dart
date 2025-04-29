part of '../application_part.dart';

abstract class IEventService {
  Future<List<OptionalServiceModel>> getListOptionalService({
    required int typeOptionalService,
    int? limit,
    int? offset,
  });

  Future<List<CoachCostumeModel>> getListCoachCostume({
    int? limit,
    int? offset,
  });

  Future<List<EventModel>> getEventList();

  Future<void> createEvent({required CreateEventDto createEventDto});

  Future<PhotoVideoPriceModel> getPhotoVideoPrice();
}
