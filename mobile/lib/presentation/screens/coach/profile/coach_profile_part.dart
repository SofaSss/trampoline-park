import 'dart:io';

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mobile_trampoline_park/application/application_part.dart';
import 'package:mobile_trampoline_park/domain/domain_part.dart';
import 'package:mobile_trampoline_park/presentation/enums/status_enum.dart';
import 'package:mobile_trampoline_park/presentation/extensions/extensions_part.dart';
import 'package:mobile_trampoline_park/presentation/resources/theme_resources.dart/theme_resources_part.dart';
import 'package:mobile_trampoline_park/presentation/routing/app_routing.gr.dart';
import 'package:mobile_trampoline_park/presentation/screens/client/profile/client_profile_part.dart';
import 'package:mobile_trampoline_park/presentation/widgets/widgets_part.dart';

part 'coach_profile_part.freezed.dart';
part 'bloc/coach_profile_bloc.dart';
part 'bloc/coach_profile_event.dart';
part 'bloc/coach_profile_state.dart';
part 'coach_profile_screen.dart';
part 'widgets/action_widget.dart';
part 'widgets/action_list_widget.dart';
part 'widgets/choose_option_dialog.dart';
