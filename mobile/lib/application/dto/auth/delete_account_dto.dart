part of '../../application_part.dart';

@freezed 
abstract class DeleteAccountDto  with _$DeleteAccountDto{
  const factory DeleteAccountDto({required String password}) = _DeleteAccountDto;
}