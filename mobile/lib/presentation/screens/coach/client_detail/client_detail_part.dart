import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_trampoline_park/application/application_part.dart';
import 'package:mobile_trampoline_park/presentation/enums/status_enum.dart';
import 'package:mobile_trampoline_park/presentation/extensions/extensions_part.dart';
import 'package:mobile_trampoline_park/presentation/resources/constants/constants_part.dart';
import 'package:mobile_trampoline_park/presentation/resources/theme_resources.dart/theme_resources_part.dart';
import 'package:mobile_trampoline_park/presentation/widgets/widgets_part.dart';

part 'client_detail_part.freezed.dart';
part 'bloc/client_detail_bloc.dart';
part 'bloc/client_detail_event.dart';
part 'bloc/client_detail_state.dart';
part 'client_detail_screen.dart';
