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

part 'use_cases/auth_user_use_cases.dart';
part 'use_cases/token_use_cases.dart';

part 'dto/sign_in_dto.dart';
part 'dto/token_dto.dart';
part 'dto/get_user_role_dto.dart';
part 'dto/activate_dto.dart';
