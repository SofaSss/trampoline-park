// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Добро пожаловать в мир прыжков и веселья!`
  String get on_boarding_hello {
    return Intl.message(
      'Добро пожаловать в мир прыжков и веселья!',
      name: 'on_boarding_hello',
      desc: '',
      args: [],
    );
  }

  /// `Зарегистрируйтесь или войдите, чтобы легко бронировать тренировки, следить за расписанием и получать доступ к эксклюзивным событиям парка!`
  String get on_boarding_text {
    return Intl.message(
      'Зарегистрируйтесь или войдите, чтобы легко бронировать тренировки, следить за расписанием и получать доступ к эксклюзивным событиям парка!',
      name: 'on_boarding_text',
      desc: '',
      args: [],
    );
  }

  /// `Вход`
  String get sign_in {
    return Intl.message('Вход', name: 'sign_in', desc: '', args: []);
  }

  /// `Регистрация`
  String get sign_up {
    return Intl.message('Регистрация', name: 'sign_up', desc: '', args: []);
  }

  /// `Присоединяйтесь к нашему батутному сообществу! Это быстро и легко: бронируйте время, копите бонусы и прыгайте в удовольствие.`
  String get signUpDescription {
    return Intl.message(
      'Присоединяйтесь к нашему батутному сообществу! Это быстро и легко: бронируйте время, копите бонусы и прыгайте в удовольствие.',
      name: 'signUpDescription',
      desc: '',
      args: [],
    );
  }

  /// `Имя`
  String get name {
    return Intl.message('Имя', name: 'name', desc: '', args: []);
  }

  /// `Фамилия`
  String get lastName {
    return Intl.message('Фамилия', name: 'lastName', desc: '', args: []);
  }

  /// `Почта`
  String get email {
    return Intl.message('Почта', name: 'email', desc: '', args: []);
  }

  /// `Телефон`
  String get phone {
    return Intl.message('Телефон', name: 'phone', desc: '', args: []);
  }

  /// `Пароль`
  String get password {
    return Intl.message('Пароль', name: 'password', desc: '', args: []);
  }

  /// `Повторите пароль`
  String get repassword {
    return Intl.message(
      'Повторите пароль',
      name: 'repassword',
      desc: '',
      args: [],
    );
  }

  /// `Зарегистрироваться`
  String get signUp {
    return Intl.message(
      'Зарегистрироваться',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Дата рождения`
  String get dateOfBirth {
    return Intl.message(
      'Дата рождения',
      name: 'dateOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `У меня нет жалоб на здоровье`
  String get isHealthy {
    return Intl.message(
      'У меня нет жалоб на здоровье',
      name: 'isHealthy',
      desc: '',
      args: [],
    );
  }

  /// `Номер телефона введен не верно`
  String get wrongPhoneNumber {
    return Intl.message(
      'Номер телефона введен не верно',
      name: 'wrongPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Почта введена неверно`
  String get incorrectMail {
    return Intl.message(
      'Почта введена неверно',
      name: 'incorrectMail',
      desc: '',
      args: [],
    );
  }

  /// `Пароль должен состоять из букв и цифр, длина - не менее 8 символов`
  String get incorrectPassword {
    return Intl.message(
      'Пароль должен состоять из букв и цифр, длина - не менее 8 символов',
      name: 'incorrectPassword',
      desc: '',
      args: [],
    );
  }

  /// `Пароли не совпадают`
  String get passwordNotMatch {
    return Intl.message(
      'Пароли не совпадают',
      name: 'passwordNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Необходимо заполнить поле`
  String get emptyField {
    return Intl.message(
      'Необходимо заполнить поле',
      name: 'emptyField',
      desc: '',
      args: [],
    );
  }

  /// `Без согласия на обработку персональных данных невозможно продолжить использование сервиса`
  String get isConfirmPDn {
    return Intl.message(
      'Без согласия на обработку персональных данных невозможно продолжить использование сервиса',
      name: 'isConfirmPDn',
      desc: '',
      args: [],
    );
  }

  /// `Согласие на обработку персональных данных`
  String get titlePDn {
    return Intl.message(
      'Согласие на обработку персональных данных',
      name: 'titlePDn',
      desc: '',
      args: [],
    );
  }

  /// `Я (далее - Заявитель) даю согласие Гриенко Александру Юрьевичу, ИНН 616389500742, адрес Ростовская область, город Ростов-на-Дону, ул.Ларина, 45с2 (далее — Оператор) на автоматизированную, а также без использования средств автоматизации, обработку моих персональных данных, предоставленных мною Оператору посредством сети Интернет через сайт https://xn--1-7sbaci3bivnagncpfakg8m.xn--p1ai/, а именно фамилия, имя, отчество, год, месяц, дата рождения, пол; включая сбора, записи, систематизации, накопления, хранения, уточнения (обновления, изменения), извлечения, использования, передачу (предоставление, доступ), обезличивания, блокирования удаления и уничтожения, а также на вышеуказанную обработку иных моих персональных данных, полученных в результате их обработки, включая обработку третьими лицами. Целями обработки персональных данных является: предоставление услуг, заключение договора. Указанное согласие дано на срок 1 год. Я уведомлен, что предоставление указанного выше согласия является моим правом, а не обязанностью, данные согласия могут быть отозваны в порядке, предусмотренном законодательством Российской Федерации. Согласие может быть отозвано субъектом персональных данных путем обращения к Оператору с заявлением, оформленным в письменной форме.`
  String get textPDn {
    return Intl.message(
      'Я (далее - Заявитель) даю согласие Гриенко Александру Юрьевичу, ИНН 616389500742, адрес Ростовская область, город Ростов-на-Дону, ул.Ларина, 45с2 (далее — Оператор) на автоматизированную, а также без использования средств автоматизации, обработку моих персональных данных, предоставленных мною Оператору посредством сети Интернет через сайт https://xn--1-7sbaci3bivnagncpfakg8m.xn--p1ai/, а именно фамилия, имя, отчество, год, месяц, дата рождения, пол; включая сбора, записи, систематизации, накопления, хранения, уточнения (обновления, изменения), извлечения, использования, передачу (предоставление, доступ), обезличивания, блокирования удаления и уничтожения, а также на вышеуказанную обработку иных моих персональных данных, полученных в результате их обработки, включая обработку третьими лицами. Целями обработки персональных данных является: предоставление услуг, заключение договора. Указанное согласие дано на срок 1 год. Я уведомлен, что предоставление указанного выше согласия является моим правом, а не обязанностью, данные согласия могут быть отозваны в порядке, предусмотренном законодательством Российской Федерации. Согласие может быть отозвано субъектом персональных данных путем обращения к Оператору с заявлением, оформленным в письменной форме.',
      name: 'textPDn',
      desc: '',
      args: [],
    );
  }

  /// `Минутку...`
  String get progressText {
    return Intl.message('Минутку...', name: 'progressText', desc: '', args: []);
  }

  /// `На Вашу электронную почту отправлено письмо для активации аккаунта`
  String get activateAccount {
    return Intl.message(
      'На Вашу электронную почту отправлено письмо для активации аккаунта',
      name: 'activateAccount',
      desc: '',
      args: [],
    );
  }

  /// `Закрыть`
  String get close {
    return Intl.message('Закрыть', name: 'close', desc: '', args: []);
  }

  /// `С возвращением! Войдите, чтобы продолжить наслаждаться прыжками и управлять своим аккаунтом.`
  String get signInTitle {
    return Intl.message(
      'С возвращением! Войдите, чтобы продолжить наслаждаться прыжками и управлять своим аккаунтом.',
      name: 'signInTitle',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[Locale.fromSubtags(languageCode: 'en')];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
