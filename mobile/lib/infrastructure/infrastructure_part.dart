import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart' as fvs;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:mobile_trampoline_park/application/application_part.dart';
import 'package:mobile_trampoline_park/domain/domain_part.dart';
import 'package:mobile_trampoline_park/infrastructure/resources/api_constants.dart';
import 'package:retrofit/retrofit.dart';

part 'infrastructure_part.freezed.dart';
part 'infrastructure_part.g.dart';

part 'api/dto/auth/sign_up_dto.dart';
part 'api/dto/auth/unregistered_user_dto.dart';
part 'api/dto/auth/sign_in_dto.dart';
part 'api/dto/auth/activate_dto.dart';
part 'api/dto/auth/set_password_dto.dart';
part 'api/dto/auth/delete_account.dart';
part 'api/dto/auth/send_reset_password_dto.dart';
part 'api/dto/auth/reset_password_dto.dart';

part 'api/dto/tokens/token_dto.dart';
part 'api/dto/tokens/access_dto.dart';

part 'api/dto/get_user_dto.dart';

part 'api/dto/client/client_dto.dart';
part 'api/dto/client/update_client_dto.dart';

part 'api/api_routes/auth_user_api.dart';
part 'api/api_routes/token_api.dart';
part 'api/api_routes/client_api.dart';

part 'api/tokens/token_storage.dart';
part 'api/tokens/interceptor.dart';

part 'services/auth_user_service.dart';
part 'services/token_service.dart';
part 'services/client_service.dart';

part 'exceptions/api_error.dart';
part 'exceptions/connection_exception.dart';
part 'exceptions/token_exception.dart';

part 'helpers/has_network_helper.dart';
part 'helpers/converter_file_helper.dart';
