import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:mobile_trampoline_park/application/application_part.dart';
import 'package:mobile_trampoline_park/domain/domain_part.dart';
import 'package:retrofit/retrofit.dart';

part 'infrastructure_part.freezed.dart';
part 'infrastructure_part.g.dart';
part './api/dto/sign_up_dto.dart';
part './api/dto/user_dto.dart';
part 'api/api_routes/sign_up_api.dart';
part 'services/user_service.dart';
part 'exceptions/api_error.dart';