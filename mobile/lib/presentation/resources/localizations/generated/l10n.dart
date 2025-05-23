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
  String get rePassword {
    return Intl.message(
      'Повторите пароль',
      name: 'rePassword',
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

  /// `Номер телефона введен неверно`
  String get wrongPhoneNumber {
    return Intl.message(
      'Номер телефона введен неверно',
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

  /// `Я (далее - Заявитель) даю согласие Гриенко Марине Александровне, ИНН 614309172615, адрес Ростовская область, город Ростов-на-Дону, ул.Ларина, 45с2 (далее — Оператор) на автоматизированную, а также без использования средств автоматизации, обработку моих персональных данных, предоставленных мною Оператору посредством сети Интернет через приложение Батутный парк №1, а именно фамилия, имя, отчество, год, месяц, дата рождения, адрес электронной почты, номер телефона; включая сбора, записи, систематизации, накопления, хранения, уточнения (обновления, изменения), извлечения, использования, передачу (предоставление, доступ), обезличивания, блокирования удаления и уничтожения, а также на вышеуказанную обработку иных моих персональных данных, полученных в результате их обработки, включая обработку третьими лицами. Целями обработки персональных данных является: предоставление услуг, заключение договора. Указанное согласие дано на срок 1 год. Я уведомлен, что предоставление указанного выше согласия является моим правом, а не обязанностью, данные согласия могут быть отозваны в порядке, предусмотренном законодательством Российской Федерации. Согласие может быть отозвано субъектом персональных данных путем обращения к Оператору с заявлением, оформленным в письменной форме.`
  String get textPDn {
    return Intl.message(
      'Я (далее - Заявитель) даю согласие Гриенко Марине Александровне, ИНН 614309172615, адрес Ростовская область, город Ростов-на-Дону, ул.Ларина, 45с2 (далее — Оператор) на автоматизированную, а также без использования средств автоматизации, обработку моих персональных данных, предоставленных мною Оператору посредством сети Интернет через приложение Батутный парк №1, а именно фамилия, имя, отчество, год, месяц, дата рождения, адрес электронной почты, номер телефона; включая сбора, записи, систематизации, накопления, хранения, уточнения (обновления, изменения), извлечения, использования, передачу (предоставление, доступ), обезличивания, блокирования удаления и уничтожения, а также на вышеуказанную обработку иных моих персональных данных, полученных в результате их обработки, включая обработку третьими лицами. Целями обработки персональных данных является: предоставление услуг, заключение договора. Указанное согласие дано на срок 1 год. Я уведомлен, что предоставление указанного выше согласия является моим правом, а не обязанностью, данные согласия могут быть отозваны в порядке, предусмотренном законодательством Российской Федерации. Согласие может быть отозвано субъектом персональных данных путем обращения к Оператору с заявлением, оформленным в письменной форме.',
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

  /// `Что-то пошло не так...`
  String get failure {
    return Intl.message(
      'Что-то пошло не так...',
      name: 'failure',
      desc: '',
      args: [],
    );
  }

  /// `Учетная запись активирована`
  String get activeAccount {
    return Intl.message(
      'Учетная запись активирована',
      name: 'activeAccount',
      desc: '',
      args: [],
    );
  }

  /// `Профиль`
  String get profile {
    return Intl.message('Профиль', name: 'profile', desc: '', args: []);
  }

  /// `Старый пароль`
  String get oldPassword {
    return Intl.message(
      'Старый пароль',
      name: 'oldPassword',
      desc: '',
      args: [],
    );
  }

  /// `Новый пароль`
  String get newPassword {
    return Intl.message(
      'Новый пароль',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Обновить данные`
  String get update {
    return Intl.message('Обновить данные', name: 'update', desc: '', args: []);
  }

  /// `Вы можете удалить аккаунт`
  String get deleteAccount {
    return Intl.message(
      'Вы можете удалить аккаунт',
      name: 'deleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Изменить пароль`
  String get changePassword {
    return Intl.message(
      'Изменить пароль',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Привет,`
  String get hi {
    return Intl.message('Привет,', name: 'hi', desc: '', args: []);
  }

  /// `Батутер!`
  String get batuter {
    return Intl.message('Батутер!', name: 'batuter', desc: '', args: []);
  }

  /// `Данные успешно обновлены`
  String get updateProfileIsSuccess {
    return Intl.message(
      'Данные успешно обновлены',
      name: 'updateProfileIsSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Выход`
  String get signOut {
    return Intl.message('Выход', name: 'signOut', desc: '', args: []);
  }

  /// `Отмена`
  String get cancel {
    return Intl.message('Отмена', name: 'cancel', desc: '', args: []);
  }

  /// `Действительно ли вы хотите выйти?`
  String get sureToSignOut {
    return Intl.message(
      'Действительно ли вы хотите выйти?',
      name: 'sureToSignOut',
      desc: '',
      args: [],
    );
  }

  /// `Подтверждение`
  String get confirmation {
    return Intl.message(
      'Подтверждение',
      name: 'confirmation',
      desc: '',
      args: [],
    );
  }

  /// `Вы действительно хотите удалить аккаунт?`
  String get sureDeleteAccount {
    return Intl.message(
      'Вы действительно хотите удалить аккаунт?',
      name: 'sureDeleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Удалить`
  String get delete {
    return Intl.message('Удалить', name: 'delete', desc: '', args: []);
  }

  /// `Пароль успешно обновлен`
  String get successResetPassword {
    return Intl.message(
      'Пароль успешно обновлен',
      name: 'successResetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Восстановление пароля`
  String get resetPasswordTitle {
    return Intl.message(
      'Восстановление пароля',
      name: 'resetPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Чтобы обеспечить безопасность вашей учетной записи, придумайте надежный новый пароль.`
  String get resetPasswordDescription {
    return Intl.message(
      'Чтобы обеспечить безопасность вашей учетной записи, придумайте надежный новый пароль.',
      name: 'resetPasswordDescription',
      desc: '',
      args: [],
    );
  }

  /// `Изменить пароль`
  String get resetPassword {
    return Intl.message(
      'Изменить пароль',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `На Вашу почту отправлено письмо для сброса пароля`
  String get emailResetPassword {
    return Intl.message(
      'На Вашу почту отправлено письмо для сброса пароля',
      name: 'emailResetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Не удалось открыть ссылку`
  String get linkError {
    return Intl.message(
      'Не удалось открыть ссылку',
      name: 'linkError',
      desc: '',
      args: [],
    );
  }

  /// `Связаться с нами`
  String get connect {
    return Intl.message(
      'Связаться с нами',
      name: 'connect',
      desc: '',
      args: [],
    );
  }

  /// `Нужна помощь?`
  String get needHelp {
    return Intl.message('Нужна помощь?', name: 'needHelp', desc: '', args: []);
  }

  /// `Привет, Батутер!`
  String get hiHome {
    return Intl.message('Привет, Батутер!', name: 'hiHome', desc: '', args: []);
  }

  /// `Веселье, спорт и активный отдых ждут тебя. Выбери, что подходит именно тебе)`
  String get homeDescription {
    return Intl.message(
      'Веселье, спорт и активный отдых ждут тебя. Выбери, что подходит именно тебе)',
      name: 'homeDescription',
      desc: '',
      args: [],
    );
  }

  /// `Услуги`
  String get services {
    return Intl.message('Услуги', name: 'services', desc: '', args: []);
  }

  /// `Наши тренеры`
  String get coaches {
    return Intl.message('Наши тренеры', name: 'coaches', desc: '', args: []);
  }

  /// `Видео-разминка`
  String get video {
    return Intl.message('Видео-разминка', name: 'video', desc: '', args: []);
  }

  /// `Правильная разминка для безопасности и максимального эффекта от прыжков.🤸‍♂️`
  String get videoDescription {
    return Intl.message(
      'Правильная разминка для безопасности и максимального эффекта от прыжков.🤸‍♂️',
      name: 'videoDescription',
      desc: '',
      args: [],
    );
  }

  /// `Мы рядом)`
  String get map {
    return Intl.message('Мы рядом)', name: 'map', desc: '', args: []);
  }

  /// `ул. Ларина, 45, стр. 2.📍`
  String get address {
    return Intl.message(
      'ул. Ларина, 45, стр. 2.📍',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Онлайн-экскурсия по парку`
  String get excursion {
    return Intl.message(
      'Онлайн-экскурсия по парку',
      name: 'excursion',
      desc: '',
      args: [],
    );
  }

  /// `Приготовьтесь очень внимательно слушать нашего гида😁`
  String get excursionDescription {
    return Intl.message(
      'Приготовьтесь очень внимательно слушать нашего гида😁',
      name: 'excursionDescription',
      desc: '',
      args: [],
    );
  }

  /// `День Рождения под ключ`
  String get happyBirthday {
    return Intl.message(
      'День Рождения под ключ',
      name: 'happyBirthday',
      desc: '',
      args: [],
    );
  }

  /// `Устройте незабываемый праздник ребенку🎂`
  String get happyBirthdayDescription {
    return Intl.message(
      'Устройте незабываемый праздник ребенку🎂',
      name: 'happyBirthdayDescription',
      desc: '',
      args: [],
    );
  }

  /// `Опытные тренеры для ярких и безопасных прыжков!🤸‍♂️`
  String get coachesDescription {
    return Intl.message(
      'Опытные тренеры для ярких и безопасных прыжков!🤸‍♂️',
      name: 'coachesDescription',
      desc: '',
      args: [],
    );
  }

  /// `Все развлечения и активности парка — в одном месте! 🎉`
  String get servicesDescription {
    return Intl.message(
      'Все развлечения и активности парка — в одном месте! 🎉',
      name: 'servicesDescription',
      desc: '',
      args: [],
    );
  }

  /// `ч`
  String get hour {
    return Intl.message('ч', name: 'hour', desc: '', args: []);
  }

  /// `Записаться`
  String get enter {
    return Intl.message('Записаться', name: 'enter', desc: '', args: []);
  }

  /// `Спортивные достижения`
  String get achievements {
    return Intl.message(
      'Спортивные достижения',
      name: 'achievements',
      desc: '',
      args: [],
    );
  }

  /// `Специализация`
  String get specialization {
    return Intl.message(
      'Специализация',
      name: 'specialization',
      desc: '',
      args: [],
    );
  }

  /// `Записаться на тренировку`
  String get enterToWorkout {
    return Intl.message(
      'Записаться на тренировку',
      name: 'enterToWorkout',
      desc: '',
      args: [],
    );
  }

  /// `Стаж`
  String get experience {
    return Intl.message('Стаж', name: 'experience', desc: '', args: []);
  }

  /// `год(а)`
  String get years {
    return Intl.message('год(а)', name: 'years', desc: '', args: []);
  }

  /// `Тренер`
  String get coach {
    return Intl.message('Тренер', name: 'coach', desc: '', args: []);
  }

  /// `Нужен ли будет фотограф?`
  String get isPhotograph {
    return Intl.message(
      'Нужен ли будет фотограф?',
      name: 'isPhotograph',
      desc: '',
      args: [],
    );
  }

  /// `Нужен ли будет видео оператор?`
  String get isVideographer {
    return Intl.message(
      'Нужен ли будет видео оператор?',
      name: 'isVideographer',
      desc: '',
      args: [],
    );
  }

  /// `Выбери дополнительные услуги:`
  String get isOptionalService {
    return Intl.message(
      'Выбери дополнительные услуги:',
      name: 'isOptionalService',
      desc: '',
      args: [],
    );
  }

  /// `Забронировать`
  String get booking {
    return Intl.message('Забронировать', name: 'booking', desc: '', args: []);
  }

  /// `Ок`
  String get ok {
    return Intl.message('Ок', name: 'ok', desc: '', args: []);
  }

  /// `мин`
  String get minutes {
    return Intl.message('мин', name: 'minutes', desc: '', args: []);
  }

  /// `час`
  String get hours {
    return Intl.message('час', name: 'hours', desc: '', args: []);
  }

  /// `Мероприятие успешно забронировано`
  String get successBookingEvent {
    return Intl.message(
      'Мероприятие успешно забронировано',
      name: 'successBookingEvent',
      desc: '',
      args: [],
    );
  }

  /// `Дата: `
  String get time {
    return Intl.message('Дата: ', name: 'time', desc: '', args: []);
  }

  /// `Дата: `
  String get date {
    return Intl.message('Дата: ', name: 'date', desc: '', args: []);
  }

  /// `Фотограф: `
  String get photo {
    return Intl.message('Фотограф: ', name: 'photo', desc: '', args: []);
  }

  /// `Да`
  String get yes {
    return Intl.message('Да', name: 'yes', desc: '', args: []);
  }

  /// `Нет`
  String get no {
    return Intl.message('Нет', name: 'no', desc: '', args: []);
  }

  /// `Аниматор: `
  String get animator {
    return Intl.message('Аниматор: ', name: 'animator', desc: '', args: []);
  }

  /// `Мастер-класс: `
  String get masterClass {
    return Intl.message(
      'Мастер-класс: ',
      name: 'masterClass',
      desc: '',
      args: [],
    );
  }

  /// `Шоу-программа: `
  String get showProgram {
    return Intl.message(
      'Шоу-программа: ',
      name: 'showProgram',
      desc: '',
      args: [],
    );
  }

  /// `Всего: `
  String get all {
    return Intl.message('Всего: ', name: 'all', desc: '', args: []);
  }

  /// `Бронирование праздника`
  String get bookingEvent {
    return Intl.message(
      'Бронирование праздника',
      name: 'bookingEvent',
      desc: '',
      args: [],
    );
  }

  /// `Выберите дату`
  String get chooseDate {
    return Intl.message(
      'Выберите дату',
      name: 'chooseDate',
      desc: '',
      args: [],
    );
  }

  /// `Мастер-классы:`
  String get masterClasses {
    return Intl.message(
      'Мастер-классы:',
      name: 'masterClasses',
      desc: '',
      args: [],
    );
  }

  /// `Шоу-программы:`
  String get showPrograms {
    return Intl.message(
      'Шоу-программы:',
      name: 'showPrograms',
      desc: '',
      args: [],
    );
  }

  /// `Выбери время`
  String get chooseTime {
    return Intl.message('Выбери время', name: 'chooseTime', desc: '', args: []);
  }

  /// `Начало`
  String get start {
    return Intl.message('Начало', name: 'start', desc: '', args: []);
  }

  /// `Конец`
  String get end {
    return Intl.message('Конец', name: 'end', desc: '', args: []);
  }

  /// `Прыгаем в наши соцсети? Там много всего интересного о Батутном парке №1!`
  String get jumpInCommunication {
    return Intl.message(
      'Прыгаем в наши соцсети? Там много всего интересного о Батутном парке №1!',
      name: 'jumpInCommunication',
      desc: '',
      args: [],
    );
  }

  /// `Видеограф`
  String get videographer {
    return Intl.message('Видеограф', name: 'videographer', desc: '', args: []);
  }

  /// `Успешное бронирование`
  String get successBooking {
    return Intl.message(
      'Успешное бронирование',
      name: 'successBooking',
      desc: '',
      args: [],
    );
  }

  /// `Мероприятие успешно забронировано!`
  String get eventSuccessBooking {
    return Intl.message(
      'Мероприятие успешно забронировано!',
      name: 'eventSuccessBooking',
      desc: '',
      args: [],
    );
  }

  /// `🔔 В течение дня Вам позвонит менеджер для уточнения информации`
  String get managerEventMessage {
    return Intl.message(
      '🔔 В течение дня Вам позвонит менеджер для уточнения информации',
      name: 'managerEventMessage',
      desc: '',
      args: [],
    );
  }

  /// `Нужен`
  String get need {
    return Intl.message('Нужен', name: 'need', desc: '', args: []);
  }

  /// `Выбери аниматора:`
  String get chooseAnimator {
    return Intl.message(
      'Выбери аниматора:',
      name: 'chooseAnimator',
      desc: '',
      args: [],
    );
  }

  /// `руб/ч`
  String get rubH {
    return Intl.message('руб/ч', name: 'rubH', desc: '', args: []);
  }

  /// `Не нужен`
  String get notNeed {
    return Intl.message('Не нужен', name: 'notNeed', desc: '', args: []);
  }

  /// `руб.`
  String get rub {
    return Intl.message('руб.', name: 'rub', desc: '', args: []);
  }

  /// `Мест:`
  String get spaces {
    return Intl.message('Мест:', name: 'spaces', desc: '', args: []);
  }

  /// `Выбери категории`
  String get chooseFilter {
    return Intl.message(
      'Выбери категории',
      name: 'chooseFilter',
      desc: '',
      args: [],
    );
  }

  /// `Тип тренировки`
  String get workoutType {
    return Intl.message(
      'Тип тренировки',
      name: 'workoutType',
      desc: '',
      args: [],
    );
  }

  /// `Вы успешно записаны на тренировку!`
  String get successSignUpWorkout {
    return Intl.message(
      'Вы успешно записаны на тренировку!',
      name: 'successSignUpWorkout',
      desc: '',
      args: [],
    );
  }

  /// `На данный момент по выбранным фильтрам не найдено тренировок`
  String get noWorkoutsOnTheseFilters {
    return Intl.message(
      'На данный момент по выбранным фильтрам не найдено тренировок',
      name: 'noWorkoutsOnTheseFilters',
      desc: '',
      args: [],
    );
  }

  /// `Вы записаны`
  String get clientWasSignUpWorkout {
    return Intl.message(
      'Вы записаны',
      name: 'clientWasSignUpWorkout',
      desc: '',
      args: [],
    );
  }

  /// `Расписание`
  String get schedule {
    return Intl.message('Расписание', name: 'schedule', desc: '', args: []);
  }

  /// `Цитата`
  String get quote {
    return Intl.message('Цитата', name: 'quote', desc: '', args: []);
  }

  /// `Пока что нет клиентов`
  String get noClients {
    return Intl.message(
      'Пока что нет клиентов',
      name: 'noClients',
      desc: '',
      args: [],
    );
  }

  /// `Клиенты:`
  String get clients {
    return Intl.message('Клиенты:', name: 'clients', desc: '', args: []);
  }

  /// `Тренировки`
  String get workouts {
    return Intl.message('Тренировки', name: 'workouts', desc: '', args: []);
  }

  /// `Отработано часов:`
  String get progressHours {
    return Intl.message(
      'Отработано часов:',
      name: 'progressHours',
      desc: '',
      args: [],
    );
  }

  /// `Проведено тренировок:`
  String get progressWorkouts {
    return Intl.message(
      'Проведено тренировок:',
      name: 'progressWorkouts',
      desc: '',
      args: [],
    );
  }

  /// `Проведено мероприятий:`
  String get progressEvents {
    return Intl.message(
      'Проведено мероприятий:',
      name: 'progressEvents',
      desc: '',
      args: [],
    );
  }

  /// `Ваши усилия создают чемпионов. Не останавливайтесь!`
  String get progressSentence {
    return Intl.message(
      'Ваши усилия создают чемпионов. Не останавливайтесь!',
      name: 'progressSentence',
      desc: '',
      args: [],
    );
  }

  /// `Ваш прогресс в цифрах:`
  String get progressTitle {
    return Intl.message(
      'Ваш прогресс в цифрах:',
      name: 'progressTitle',
      desc: '',
      args: [],
    );
  }

  /// `Тренировки на сегодня`
  String get todayWorkouts {
    return Intl.message(
      'Тренировки на сегодня',
      name: 'todayWorkouts',
      desc: '',
      args: [],
    );
  }

  /// `Ученики:`
  String get students {
    return Intl.message('Ученики:', name: 'students', desc: '', args: []);
  }

  /// `Пройдено`
  String get completed {
    return Intl.message('Пройдено', name: 'completed', desc: '', args: []);
  }

  /// `Здоров`
  String get healthy {
    return Intl.message('Здоров', name: 'healthy', desc: '', args: []);
  }

  /// `Есть проблемы со здоровьем`
  String get notHealthy {
    return Intl.message(
      'Есть проблемы со здоровьем',
      name: 'notHealthy',
      desc: '',
      args: [],
    );
  }

  /// `год`
  String get year {
    return Intl.message('год', name: 'year', desc: '', args: []);
  }

  /// `года`
  String get yearA {
    return Intl.message('года', name: 'yearA', desc: '', args: []);
  }

  /// `лет`
  String get summerYears {
    return Intl.message('лет', name: 'summerYears', desc: '', args: []);
  }

  /// `На сегодня тренировок нет`
  String get noWorkoutsToday {
    return Intl.message(
      'На сегодня тренировок нет',
      name: 'noWorkoutsToday',
      desc: '',
      args: [],
    );
  }

  /// `Для использования приложения необходимо согласие с политикой конфиденциальности`
  String get isPolicy {
    return Intl.message(
      'Для использования приложения необходимо согласие с политикой конфиденциальности',
      name: 'isPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Забыли пароль?`
  String get forgetPassword {
    return Intl.message(
      'Забыли пароль?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Неверный email или пароль`
  String get invalidEmailOrPassword {
    return Intl.message(
      'Неверный email или пароль',
      name: 'invalidEmailOrPassword',
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
