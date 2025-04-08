part of '../service_detail_part.dart';

class ServiceDetailBloc extends Bloc<ServiceDetailEvent, ServiceDetailState> {
  ServiceDetailBloc({required this.workoutUseCases})
    : super(ServiceDetailState(status: Status.loaded)) {
    on<_LoadData>(_loadData);
  }

  final WorkoutUseCases workoutUseCases;

  Future<void> _loadData(
    _LoadData event,
    Emitter<ServiceDetailState> emit,
  ) async {
    try {
      emit(state.copyWith(status: Status.loading));
      final workoutData = await workoutUseCases.getWorkoutType(id: event.id);
      emit(
        state.copyWith(
          status: Status.loaded,
          serviceName: workoutData.name,
          serviceDescription: workoutData.description,
          serviceDuration: workoutData.duration.toString(),
          serviceImage: workoutData.workoutPicture,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: Status.failure));
    }
  }
}
