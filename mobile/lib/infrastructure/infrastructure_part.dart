import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as fvs;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:mobile_trampoline_park/application/application_part.dart';
import 'package:mobile_trampoline_park/domain/domain_part.dart';
import 'package:mobile_trampoline_park/infrastructure/resources/api_constants.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'infrastructure_part.freezed.dart';
part 'infrastructure_part.g.dart';

part './api/dto/sign_up_dto.dart';
part './api/dto/user_dto.dart';
part './api/dto/token_dto.dart';
part 'api/dto/sign_in_dto.dart';
part 'api/dto/get_user_dto.dart';
part 'api/dto/access_dto.dart';

part 'api/api_routes/user_api.dart';
part 'api/api_routes/token_api.dart';

part 'api/tokens/token_storage.dart';
part 'api/tokens/interceptor.dart';

part 'services/user_service.dart';
part 'services/token_service.dart';

part 'exceptions/api_error.dart';
part 'exceptions/connection_exception.dart';
part 'exceptions/token_exception.dart';

part 'helpers/has_network_helper.dart';
