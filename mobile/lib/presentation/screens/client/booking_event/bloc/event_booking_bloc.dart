part of '../booking_event_part.dart';

class EventBookingBloc extends Bloc<EventBookingEvent, EventBookingState> {
  EventBookingBloc({required this.eventUseCases})
    : super(EventBookingState(status: EventStatus.loaded)) {
    on<_LoadData>(_loadData);
    on<_CreateEvent>(_createEvent);
    on<_ValidateCreateEventData>(_validateCreateEventData);
    on<_FinalPrice>(_finalPrice);
  }

  final EventUseCases eventUseCases;

  Future<void> _loadData(
    _LoadData event,
    Emitter<EventBookingState> emit,
  ) async {
    try {
      emit(state.copyWith(status: EventStatus.loading));

      final coachCostumeList = await eventUseCases.getListCoachCostume();
      final showProgramList = await eventUseCases.getShowPrograms();
      final masterClassList = await eventUseCases.getMasterClasses();
      final photoVideoPrice = await eventUseCases.getPhotoVideoPrice();

      emit(
        state.copyWith(
          status: EventStatus.loaded,
          coachCostumeList: coachCostumeList,
          showProgramList: showProgramList,
          masterClassList: masterClassList,
          photoPrice: photoVideoPrice.photographerPrice.toString(),
          videoPrice: photoVideoPrice.videographerPrice.toString(),
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: EventStatus.failure));
    }
  }

  Future<void> _validateCreateEventData(
    _ValidateCreateEventData event,
    Emitter<EventBookingState> emit,
  ) async {
    try {
      emit(state.copyWith(status: EventStatus.loading));
      await Future.delayed(const Duration(milliseconds: 300));
      final errors = {
        ...ValidationHelper.validateText(text: event.date.toString()),
        ...ValidationHelper.validateText(text: event.eventStartTime.toString()),
        ...ValidationHelper.validateText(text: event.eventEndTime.toString()),
        ...ValidationHelper.validateText(text: event.coachCostume.toString()),
      };
      if (errors.isNotEmpty) {
        emit(state.copyWith(errors: errors, status: EventStatus.loaded));
        return;
      }
      final coachCostumeList = await eventUseCases.getListCoachCostume();
      await _finalPrice(
        _FinalPrice(
          eventStartTime: parseTimeToDateTime(event.eventStartTime!),
          eventEndTime: parseTimeToDateTime(event.eventEndTime!),
          isPhotographer: event.isPhotographer,
          isVideographer: event.isVideographer,
          coachCostumePrice: coachCostumeList[event.coachCostume!].price,
          masterClassPrice: event.masterClassPrice,
          showPrice: event.showPrice,
        ),
        emit,
      );
      emit(state.copyWith(status: EventStatus.successValidateEvent));
    } catch (_) {
      emit(state.copyWith(status: EventStatus.failure));
    }
  }

  Future<void> _createEvent(
    _CreateEvent event,
    Emitter<EventBookingState> emit,
  ) async {
    try {
      emit(state.copyWith(status: EventStatus.loading));

      await eventUseCases.createEvent(
        date: event.date,
        eventStartTime: event.eventStartTime,
        eventEndTime: event.eventEndTime,
        isPhotographer: event.isPhotographer,
        isVideographer: event.isVideographer,
        optionalService: event.optionalService,
        coachCostume: event.coachCostume,
      );
      emit(state.copyWith(status: EventStatus.successCreateEvent));
      emit(state.copyWith(status: EventStatus.loaded));
    } catch (_) {
      emit(state.copyWith(status: EventStatus.failure));
    }
  }

  Future<void> _finalPrice(
    _FinalPrice event,
    Emitter<EventBookingState> emit,
  ) async {
    try {
      final Duration duration = event.eventEndTime.difference(
        event.eventStartTime,
      );
      final minutes = duration.inMinutes;
      final animatorFinalPrice = event.coachCostumePrice * minutes / 60;
      final photoVideoPrice = await eventUseCases.getPhotoVideoPrice();
      double photoFinalPrice = 0;
      double videoFinalPrice = 0;

      if (event.isPhotographer) {
        photoFinalPrice = photoVideoPrice.photographerPrice * minutes / 60;
      }
      if (event.isVideographer) {
        videoFinalPrice = photoVideoPrice.videographerPrice * minutes / 60;
      }
      final masterClassPrice = event.masterClassPrice ?? 0;
      final showPrice = event.showPrice ?? 0;

      final finalPrice =
          animatorFinalPrice +
          photoFinalPrice +
          videoFinalPrice +
          masterClassPrice +
          showPrice;

      emit(
        state.copyWith(
          finalVideoPrice: videoFinalPrice.toStringAsFixed(2),
          finalAnimatorPrice: animatorFinalPrice.toStringAsFixed(2),
          finalPhotoPrice: photoFinalPrice.toStringAsFixed(2),
          finalPrice: finalPrice.toStringAsFixed(2),
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: EventStatus.failure));
    }
  }
}
