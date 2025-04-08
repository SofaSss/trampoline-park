import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_trampoline_park/domain/domain_part.dart';
import 'package:dio/dio.dart';
import 'package:mobile_trampoline_park/infrastructure/resources/api_constants.dart';
import 'package:mobile_trampoline_park/infrastructure/infrastructure_part.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'application_part.freezed.dart';

part 'container.dart';

part 'interfaces/auth_user_interface.dart';
part 'interfaces/token_interface.dart';
part 'interfaces/client_interface.dart';
part 'interfaces/workout_interface.dart';
part 'interfaces/coach_interface.dart';

part 'use_cases/auth_user_use_cases.dart';
part 'use_cases/token_use_cases.dart';
part 'use_cases/client_use_cases.dart';
part 'use_cases/workout_use_cases.dart';
part 'use_cases/coach_use_cases.dart';

part 'dto/token/token_dto.dart';
part 'dto/auth/get_user_role_dto.dart';
part 'dto/auth/activate_dto.dart';
part 'dto/auth/sign_in_dto.dart';
part 'dto/client/update_client_dto.dart';
part 'dto/auth/set_password_dto.dart';
part 'dto/auth/delete_account_dto.dart';
part 'dto/auth/send_reset_password_dto.dart';
part 'dto/auth/reset_password_dto.dart';
