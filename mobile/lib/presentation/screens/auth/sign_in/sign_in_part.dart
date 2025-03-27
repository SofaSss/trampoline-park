import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_trampoline_park/application/application_part.dart';
import 'package:mobile_trampoline_park/presentation/enums/validation_enums.dart';
import 'package:mobile_trampoline_park/presentation/extensions/extensions_part.dart';
import 'package:mobile_trampoline_park/presentation/helpers/helpers_part.dart';
import 'package:mobile_trampoline_park/presentation/resources/theme_resources.dart/theme_resources_part.dart';
import 'package:mobile_trampoline_park/presentation/routing/app_routing.gr.dart';
import 'package:mobile_trampoline_park/presentation/widgets/widgets_part.dart';
import 'package:mobile_trampoline_park/presentation/enums/status_enum.dart';

part 'sign_in_part.freezed.dart';
part 'sign_in_screen.dart';
part 'bloc/sign_in_bloc.dart';
part 'bloc/sign_in_state.dart';
part 'bloc/sign_in_event.dart';