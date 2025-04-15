part of '../infrastructure_part.dart';

class EventService implements IEventService {
  final EventApi eventApi;

  EventService({required this.eventApi});

  @override
  Future<List<OptionalServiceModel>> getListOptionalService({
    required int typeOptionalService,
    int? limit,
    int? offset,
  }) async {
    final ResponseWrapperDto<OptionalServiceInfraDto> response = await eventApi
        .getListOptionalService(
          typeOptionalService: typeOptionalService,
          limit: limit,
          offset: offset,
        );
    final List<OptionalServiceModel> listOptionalServiceModel =
        response.results.map((optionalServiceInfraDto) {
          return OptionalServiceModel(
            id: optionalServiceInfraDto.id,
            name: optionalServiceInfraDto.name,
            optionalServicePicture: optionalServiceInfraDto.servicePicture,
            type: optionalServiceInfraDto.typeId,
            price: optionalServiceInfraDto.servicePrice,
          );
        }).toList();

    return listOptionalServiceModel;
  }

  @override
  Future<List<CoachCostumeModel>> getListCoachCostume({
    int? limit,
    int? offset,
  }) async {
    final ResponseWrapperDto<CoachCostumeInfraDto> response = await eventApi
        .getListCoachCostume(limit: limit, offset: offset);

    final List<CoachCostumeModel> listCoachCostumeModel =
        response.results.map((coachCostumeInfraDto) {
          return CoachCostumeModel(
            id: coachCostumeInfraDto.id,
            name: coachCostumeInfraDto.name,
            picture: coachCostumeInfraDto.picture,
            price: coachCostumeInfraDto.price,
          );
        }).toList();

    return listCoachCostumeModel;
  }

  @override
  Future<void> createEvent({required CreateEventDto createEventDto}) async {
    final CreateEventInfraDto createEventInfraDto = CreateEventInfraDto(
      name: createEventDto.name,
      date: DateFormat('yyyy-MM-dd').format(createEventDto.date),
      eventStartTime: DateFormat('HH:mm').format(createEventDto.eventStartTime),
      eventEndTime: DateFormat('HH:mm').format(createEventDto.eventEndTime),
      isPhotographer: createEventDto.isPhotographer,
      isVideographer: createEventDto.isVideographer,
      optionalService: createEventDto.optionalService,
      coachCostume: createEventDto.coachCostume,
      client: createEventDto.client,
    );
    await eventApi.createEvent(
      createEventInfraDto: createEventInfraDto.toJson(),
    );
  }

  @override
  Future<PhotoVideoPriceModel> getPhotoVideoPrice() async {
    final response = await eventApi.getPhotoVideoPrice();
    final PhotoVideoPriceModel photoVideoPriceModel = PhotoVideoPriceModel(
      id: response.id,
      photographerPrice: response.photographerPrice,
      videographerPrice: response.videographerPrice,
    );
    return photoVideoPriceModel;
  }
}
