import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mobile_trampoline_park/application/application_part.dart';
import 'package:mobile_trampoline_park/presentation/resources/theme/theme_part.dart';
import 'package:mobile_trampoline_park/presentation/routing/app_routing.dart';
import 'presentation/resources/localizations/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await setUpDependencies();
  runApp(TrampolinePark());
}

class TrampolinePark extends StatefulWidget {
  const TrampolinePark({super.key});

  @override
  State<TrampolinePark> createState() => _TrampolineParkState();
}

class _TrampolineParkState extends State<TrampolinePark> {
  late final AppRouter _appRouter;

  @override
  void initState() {
    super.initState();
    _appRouter = AppRouter();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale('ru'),
      theme: AppTheme.lightTheme,
      routerConfig: _appRouter.config(),
    );
  }
}
