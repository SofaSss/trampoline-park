import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mobile_trampoline_park/application/application_part.dart';
import 'package:mobile_trampoline_park/infrastructure/infrastructure_part.dart';
import 'package:mobile_trampoline_park/presentation/enums/status_enum.dart';
import 'package:mobile_trampoline_park/presentation/enums/validation_enums.dart';
import 'package:mobile_trampoline_park/presentation/extensions/extensions_part.dart';
import 'package:mobile_trampoline_park/presentation/helpers/helpers_part.dart';
import 'package:mobile_trampoline_park/presentation/resources/constants/constants_part.dart';
import 'package:mobile_trampoline_park/presentation/resources/theme_resources.dart/theme_resources_part.dart';
import 'package:mobile_trampoline_park/presentation/routing/app_routing.gr.dart';
import 'package:mobile_trampoline_park/presentation/widgets/widgets_part.dart';

part 'client_profile_part.freezed.dart';
part 'bloc/client_profile_bloc.dart';
part 'bloc/client_profile_event.dart';
part 'bloc/client_profile_state.dart';
part 'client_profile_screen.dart';
part '../../../widgets/profile/profile_data_section.dart';
part 'client_delete_account_section.dart';
