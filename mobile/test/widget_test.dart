import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_trampoline_park/presentation/resources/theme/theme_part.dart';
import 'package:mobile_trampoline_park/presentation/resources/theme_resources.dart/theme_resources_part.dart';
import 'package:mobile_trampoline_park/presentation/resources/localizations/generated/l10n.dart';
import 'package:mobile_trampoline_park/presentation/widgets/widgets_part.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  testWidgets('Тестирование применения темы приложения к ElevatedButton', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.lightTheme,
        home: Scaffold(
          body: ElevatedButton(
            onPressed: () {},
            child: const Text('ElevatedButton'),
          ),
        ),
      ),
    );

    final context = tester.element(find.byType(ElevatedButton));
    final buttonStyle = ElevatedButtonTheme.of(context).style!;

    final textStyle = buttonStyle.textStyle?.resolve({});
    final backgroundColor = buttonStyle.backgroundColor?.resolve({});
    final shape = buttonStyle.shape?.resolve({});

    expect(textStyle?.fontFamily, 'SofiaSans');
    expect(textStyle?.fontSize, 18);
    expect(backgroundColor, AppColors.blue);
    expect(
      shape,
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(58)),
    );
  });

  testWidgets('Тестирование применения темы приложения к TextButton', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.lightTheme,
        home: Scaffold(
          body: TextButton(onPressed: () {}, child: const Text('TextButton')),
        ),
      ),
    );

    final context = tester.element(find.byType(TextButton));
    final buttonStyle = TextButtonTheme.of(context).style!;

    final textStyle = buttonStyle.textStyle?.resolve({});

    expect(textStyle?.fontFamily, 'SofiaSans');
    expect(textStyle?.fontSize, 18);
  });

  testWidgets('AppBar использует стили из AppTheme', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.lightTheme,
        home: Scaffold(appBar: AppBar(title: const Text('Заголовок'))),
      ),
    );

    final context = tester.element(find.byType(AppBar));
    final theme = Theme.of(context);

    expect(theme.colorScheme.primary, AppColors.blue);
    expect(theme.appBarTheme.iconTheme?.color, AppColors.white);
    expect(theme.appBarTheme.titleTextStyle?.color, AppColors.white);
    expect(theme.appBarTheme.titleTextStyle?.fontSize, 22);
  });

  testWidgets('Scaffold использует цвет фона из темы', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(theme: AppTheme.lightTheme, home: const Scaffold()),
    );

    final context = tester.element(find.byType(Scaffold));
    final bgColor = Theme.of(context).scaffoldBackgroundColor;

    expect(bgColor, AppColors.white);
  });

  testWidgets('BottomNavigationBar использует стили из темы', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.lightTheme,
        home: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: 0,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: ' '),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Настройки',
              ),
            ],
          ),
        ),
      ),
    );

    final context = tester.element(find.byType(BottomNavigationBar));
    final bottomBarTheme = BottomNavigationBarTheme.of(context);

    expect(bottomBarTheme.backgroundColor, AppColors.blue);
    expect(bottomBarTheme.selectedItemColor, AppColors.yellow);
    expect(bottomBarTheme.unselectedItemColor, AppColors.white);
  });

  testWidgets('Text использует displayLarge из ThemeData', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.lightTheme,
        home: Builder(
          builder:
              (context) => Scaffold(
                body: Text(
                  'DisplayLarge',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
        ),
      ),
    );

    final textWidget = tester.widget<Text>(find.text('DisplayLarge'));

    expect(textWidget.style?.fontSize, 22);
    expect(textWidget.style?.fontFamily, 'SofiaSans');
    expect(textWidget.style?.fontWeight, FontWeight.w900);
    expect(textWidget.style?.color, AppColors.black);
  });

  testWidgets('Text использует displayMedium из ThemeData', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.lightTheme,
        home: Builder(
          builder:
              (context) => Scaffold(
                body: Text(
                  'displayMedium',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
        ),
      ),
    );

    final textWidget = tester.widget<Text>(find.text('displayMedium'));

    expect(textWidget.style?.fontSize, 16);
    expect(textWidget.style?.fontFamily, 'SofiaSans');
    expect(textWidget.style?.fontWeight, FontWeight.w500);
    expect(textWidget.style?.color, AppColors.black);
  });

  testWidgets('Text использует headlineMedium из ThemeData', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.lightTheme,
        home: Builder(
          builder:
              (context) => Scaffold(
                body: Text(
                  'headlineMedium',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
        ),
      ),
    );

    final textWidget = tester.widget<Text>(find.text('headlineMedium'));

    expect(textWidget.style?.fontSize, 18);
    expect(textWidget.style?.fontFamily, 'SofiaSans');
    expect(textWidget.style?.fontWeight, FontWeight.w500);
    expect(textWidget.style?.color, AppColors.white);
  });

  testWidgets('Text использует headlineSmall из ThemeData', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.lightTheme,
        home: Builder(
          builder:
              (context) => Scaffold(
                body: Text(
                  'headlineSmall',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
        ),
      ),
    );

    final textWidget = tester.widget<Text>(find.text('headlineSmall'));

    expect(textWidget.style?.fontSize, 13);
    expect(textWidget.style?.fontFamily, 'Montserrat');
    expect(textWidget.style?.fontWeight, FontWeight.w500);
    expect(textWidget.style?.color, AppColors.gray);
  });

  testWidgets('Text использует bodyMedium из ThemeData', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.lightTheme,
        home: Builder(
          builder:
              (context) => Scaffold(
                body: Text(
                  'bodyMedium',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
        ),
      ),
    );

    final textWidget = tester.widget<Text>(find.text('bodyMedium'));

    expect(textWidget.style?.fontSize, 13);
    expect(textWidget.style?.fontFamily, 'Montserrat');
    expect(textWidget.style?.fontWeight, FontWeight.w500);
    expect(textWidget.style?.color, AppColors.white);
  });

  testWidgets('Text использует bodyLarge из ThemeData', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.lightTheme,
        home: Builder(
          builder:
              (context) => Scaffold(
                body: Text(
                  'bodyLarge',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
        ),
      ),
    );

    final textWidget = tester.widget<Text>(find.text('bodyLarge'));

    expect(textWidget.style?.fontSize, 14);
    expect(textWidget.style?.fontFamily, 'Montserrat');
    expect(textWidget.style?.fontWeight, FontWeight.w500);
    expect(textWidget.style?.color, AppColors.black);
  });

  testWidgets('Text использует bodySmall из ThemeData', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.lightTheme,
        home: Builder(
          builder:
              (context) => Scaffold(
                body: Text(
                  'bodySmall',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
        ),
      ),
    );

    final textWidget = tester.widget<Text>(find.text('bodySmall'));

    expect(textWidget.style?.fontSize, 18);
    expect(textWidget.style?.fontFamily, 'SofiaSans');
    expect(textWidget.style?.fontWeight, FontWeight.w400);
    expect(textWidget.style?.color, AppColors.blue);
  });

  testWidgets('Тестирование BaseProgressIndicator', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        locale: const Locale('ru'),
        theme: AppTheme.lightTheme,
        home: const Scaffold(body: BaseProgressIndicator()),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    final textFinder = find.text(S.current.progressText);
    expect(textFinder, findsOneWidget);

    final textWidget = tester.widget<Text>(textFinder);
    expect(
      textWidget.style?.fontSize,
      AppTextStyles.appTextTheme.bodySmall?.fontSize,
    );
    expect(
      textWidget.style?.fontFamily,
      AppTextStyles.appTextTheme.bodySmall?.fontFamily,
    );
  });

  testWidgets('BaseBigCard отображает текст', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.lightTheme,
        home: Scaffold(
          body: BaseBigCard(
            imageUrl: ' ',
            name: 'Тестовая карточка',
            shortDescription: 'Это краткое описание.',
          ),
        ),
      ),
    );

    expect(find.text('Тестовая карточка'), findsOneWidget);
    expect(find.text('Это краткое описание.'), findsOneWidget);

    final textWidget = tester.widget<Text>(find.text('Тестовая карточка'));
    expect(
      textWidget.style?.fontSize,
      AppTextStyles.appTextTheme.headlineMedium?.fontSize,
    );
  });

  testWidgets(
    'BaseBigCard показывает заглушку при ошибке загрузки изображения',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: Scaffold(
            body: BaseBigCard(
              imageUrl: 'https://broken-link.com/image.jpg',
              name: 'Тестовая карточка',
              shortDescription: 'Это краткое описание.',
            ),
          ),
        ),
      );

      await tester.pump(const Duration(milliseconds: 500));

      expect(find.byType(SvgPicture), findsOneWidget);

      expect(find.text('Тестовая карточка'), findsOneWidget);
      expect(find.text('Это краткое описание.'), findsOneWidget);
    },
  );

  testWidgets('BaseMediumCard отображает текст', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.lightTheme,
        home: Scaffold(
          body: BaseMediumCard(imageUrl: ' ', name: 'Имя', lastName: 'Фамилия'),
        ),
      ),
    );

    expect(find.text('Имя'), findsOneWidget);
    expect(find.text('Фамилия'), findsOneWidget);

    final textNameWidget = tester.widget<Text>(find.text('Имя'));
    expect(
      textNameWidget.style?.fontSize,
      AppTextStyles.appTextTheme.headlineMedium?.fontSize,
    );

    final textLastNameWidget = tester.widget<Text>(find.text('Фамилия'));
    expect(
      textLastNameWidget.style?.fontSize,
      AppTextStyles.appTextTheme.headlineMedium?.fontSize,
    );
  });

  testWidgets(
    'BaseMediumCard показывает заглушку при ошибке загрузки изображения',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.lightTheme,
          home: Scaffold(
            body: BaseMediumCard(
              imageUrl: 'https://broken-link.com/image.jpg',
              name: 'Имя',
              lastName: 'Фамилия',
            ),
          ),
        ),
      );

      await tester.pump(const Duration(milliseconds: 500));

      expect(find.byType(SvgPicture), findsOneWidget);

      expect(find.text('Имя'), findsOneWidget);
      expect(find.text('Фамилия'), findsOneWidget);
    },
  );
}
