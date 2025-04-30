import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_trampoline_park/application/application_part.dart';
import 'package:mobile_trampoline_park/domain/domain_part.dart';
import 'package:mobile_trampoline_park/presentation/enums/status_enum.dart';
import 'package:mobile_trampoline_park/presentation/extensions/extensions_part.dart';
import 'package:mobile_trampoline_park/presentation/resources/constants/constants_part.dart';
import 'package:mobile_trampoline_park/presentation/routing/app_routing.gr.dart';
import 'package:mobile_trampoline_park/presentation/widgets/widgets_part.dart';

part 'sign_up_workout_part.freezed.dart';
part 'sign_up_workout_screen.dart';
part 'bloc/sign_up_workout_bloc.dart';
part 'bloc/sign_up_workout_event.dart';
part 'bloc/sign_up_workout_state.dart';
