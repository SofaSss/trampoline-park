part of '../application_part.dart';

class EventUseCases {
  final IEventService eventService;
  final IClientService clientService;

  EventUseCases({required this.clientService, required this.eventService});

  Future<List<CoachCostumeModel>> getListCoachCostume({
    int? limit,
    int? offset,
  }) async {
    return await eventService.getListCoachCostume(limit: limit, offset: offset);
  }

  Future<List<OptionalServiceModel>> getShowPrograms({
    int? limit,
    int? offset,
  }) async {
    return await eventService.getListOptionalService(
      typeOptionalService: 1,
      limit: limit,
      offset: offset,
    );
  }

  Future<List<OptionalServiceModel>> getMasterClasses({
    int? limit,
    int? offset,
  }) async {
    return await eventService.getListOptionalService(
      typeOptionalService: 2,
      limit: limit,
      offset: offset,
    );
  }

  Future<PhotoVideoPriceModel> getPhotoVideoPrice() async {
    return await eventService.getPhotoVideoPrice();
  }

  Future<void> createEvent({
    required DateTime date,
    required DateTime eventStartTime,
    required DateTime eventEndTime,
    required bool isPhotographer,
    required bool isVideographer,
    required List<int?> optionalService,
    required int coachCostume,
  }) async {
    final currentClient = await clientService.getCurrentClient();
    final String name =
        '${currentClient.firstName} ${DateFormat('dd-MM-yyyy').format(date)}';
    final CreateEventDto createEventDto = CreateEventDto(
      name: name,
      date: date,
      eventStartTime: eventStartTime,
      eventEndTime: eventEndTime,
      isPhotographer: isPhotographer,
      isVideographer: isVideographer,
      optionalService: optionalService,
      coachCostume: coachCostume,
      client: currentClient.id,
    );
    await eventService.createEvent(createEventDto: createEventDto);
  }
}
