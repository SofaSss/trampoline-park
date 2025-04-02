part of '../../application_part.dart';

@freezed
abstract class UpdateClientDto with _$UpdateClientDto {
  const factory UpdateClientDto({
    File? profilePicture,
    String? phoneNumber,
    bool? isHealthy,
  }) = _UpdateClientDto;
}
