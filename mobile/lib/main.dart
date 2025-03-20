import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mobile_trampoline_park/presentation/resources/theme/theme_part.dart';
import 'package:mobile_trampoline_park/presentation/resources/theme_resources.dart/theme_resources_part.dart';
import 'package:mobile_trampoline_park/presentation/widgets/widgets_part.dart';
import 'generated/l10n.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: const MyHomePage(title: "Батутный парк"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Батутный парк',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Text(
              'Батутный парк',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 22,
                color: AppColors.black,
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                  height: 20,
                  child: const ColoredBox(color: AppColors.blue),
                ),
                SizedBox(
                  width: 20,
                  height: 20,
                  child: const ColoredBox(color: AppColors.lightBlue),
                ),
                SizedBox(
                  width: 20,
                  height: 20,
                  child: const ColoredBox(color: AppColors.black),
                ),
                SizedBox(
                  width: 20,
                  height: 20,
                  child: const ColoredBox(color: AppColors.white),
                ),
                SizedBox(
                  width: 20,
                  height: 20,
                  child: const ColoredBox(color: AppColors.gray),
                ),
                SizedBox(
                  width: 20,
                  height: 20,
                  child: const ColoredBox(color: AppColors.lightGray),
                ),
                SizedBox(
                  width: 20,
                  height: 20,
                  child: const ColoredBox(color: AppColors.yellow),
                ),
                SizedBox(
                  width: 20,
                  height: 20,
                  child: const ColoredBox(color: AppColors.lightYellow),
                ),
                SizedBox(
                  width: 20,
                  height: 20,
                  child: const ColoredBox(color: AppColors.red),
                ),
                SizedBox(
                  width: 20,
                  height: 20,
                  child: const ColoredBox(color: AppColors.lightRed),
                ),
                SizedBox(
                  width: 20,
                  height: 20,
                  child: const ColoredBox(color: AppColors.green),
                ),
                SizedBox(
                  width: 20,
                  height: 20,
                  child: const ColoredBox(color: AppColors.lightGreen),
                ),
              ],
            ),
            BaseTextField(
              controller: controller,
              textInputType: TextInputType.name,
              hintText: 'Имя',
              icon: AppIcons.user,
            ),

            BaseTextField(
              controller: controller,
              textInputType: TextInputType.name,
              hintText: 'Имя',
              icon: AppIcons.email,
            ),
            Text(
              'Зарегистрироваться',
              style: TextStyle(
                color: AppColors.black,
                fontSize: 20,
                fontFamily: 'SofiaSans',
              ),
            ),

            ElevatedButton(
              onPressed: () => (),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(AppColors.blue),
              ),
              child: Text('Зарегистрироваться'),
            ),
            TextButton(
              onPressed: () => (),
              child: Text('Войти', style: TextStyle(color: AppColors.blue)),
            ),
            BaseBigCard(
              imageUrl:
                  'https://tvkrasnodar.ru/upload/iblock/767/27b9pgs0kee4x38b4pqz8onqx7jc63g6.jpeg',
              name: 'Название',
              shortDescription:
                  'Вот такой вот у меня сегодня день: то живот болит, то кашляю ',
            ),
            SizedBox(height: 10),
            BaseMediunCard(
              imageUrl:
                  'https://sun9-28.userapi.com/impf/c846420/v846420085/3cefd/bR6vv2Ps0JI.jpg?size=402x604&quality=96&sign=2dc1fb8fcacbe99510bc01babe940a82&type=album',
              name: 'Иван',
              lastName: 'Иванов',
            ),
          ],
        ),
      ),
    );
  }
}
