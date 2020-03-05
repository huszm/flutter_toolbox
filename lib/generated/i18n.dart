import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
class S implements WidgetsLocalizations {
  const S();

  static S current;

  static const GeneratedLocalizationsDelegate delegate =
    GeneratedLocalizationsDelegate();

  static S of(BuildContext context) => Localizations.of<S>(context, S);

  @override
  TextDirection get textDirection => TextDirection.ltr;

  String get could_not_launch_google_maps => "Could not launch google maps";
  String get couldnt_open_the_mail_app => "Couldn't open the mail app";
  String get couldnt_open_the_phone_app => "Couldn't open the phone app";
  String get couldnt_open_this_url => "Couldn't open this url";
  String get please_check_your_connection => "Please check your connection";
  String get please_check_your_internet_connection => "Please check your internet connection";
  String get required_field => "Required Field";
  String get search => "Search...";
  String get select_date => "Select date";
  String get select_time => "Select time";
  String get server_error => "Server error";
  String get the_email_address_or_password_is_wrong => "The email address or password is wrong";
  String get this_file_is_not_an_image => "This file is not an image";
}

class $ar extends S {
  const $ar();

  @override
  TextDirection get textDirection => TextDirection.rtl;

  @override
  String get please_check_your_internet_connection => "الرجاء التاكد من اتصالك بالأنترنت";
  @override
  String get could_not_launch_google_maps => "لا يمكن فتح خرائط جوجل";
  @override
  String get select_date => "إختر التاريخ";
  @override
  String get couldnt_open_the_mail_app => "لا يمكن فتح تطبيق البريد الإلكتروني";
  @override
  String get couldnt_open_the_phone_app => "لا يمكن فتح تطبيق الهاتف";
  @override
  String get search => "إبحث...";
  @override
  String get required_field => "حقل مطلوب";
  @override
  String get the_email_address_or_password_is_wrong => "البريد الإلكتروني او كلمة المرور غير صحيحة";
  @override
  String get select_time => "إختر الوقت";
  @override
  String get server_error => "خطأ من الخادم حاول مرة اخري";
  @override
  String get this_file_is_not_an_image => "هذا الملف ليس صورة";
  @override
  String get please_check_your_connection => "تأكد من وجود انترنت";
  @override
  String get couldnt_open_this_url => "لا يمكن فتح هذا الرابط";
}

class $ru extends S {
  const $ru();

  @override
  TextDirection get textDirection => TextDirection.ltr;

  @override
  String get please_check_your_internet_connection => "Пожалуйста, проверьте ваше соединение";
  @override
  String get could_not_launch_google_maps => "Не удалось запустить Google Maps";
  @override
  String get select_date => "Выберите дату";
  @override
  String get couldnt_open_the_mail_app => "Couldn't open the mail app";
  @override
  String get couldnt_open_the_phone_app => "Couldn't open the phone app";
  @override
  String get search => "Поиск...";
  @override
  String get required_field => "Обязательное поле";
  @override
  String get the_email_address_or_password_is_wrong => "Неверный адрес электронной почты или пароль";
  @override
  String get select_time => "Выберите время";
  @override
  String get server_error => "Ошибка сервера";
  @override
  String get this_file_is_not_an_image => "Этот файл не является изображением";
  @override
  String get please_check_your_connection => "Пожалуйста, проверьте ваше соединение";
  @override
  String get couldnt_open_this_url => "Couldn't open this url";
}

class $en extends S {
  const $en();
}

class GeneratedLocalizationsDelegate extends LocalizationsDelegate<S> {
  const GeneratedLocalizationsDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale("ar", ""),
      Locale("ru", ""),
      Locale("en", ""),
    ];
  }

  LocaleListResolutionCallback listResolution({Locale fallback, bool withCountry = true}) {
    return (List<Locale> locales, Iterable<Locale> supported) {
      if (locales == null || locales.isEmpty) {
        return fallback ?? supported.first;
      } else {
        return _resolve(locales.first, fallback, supported, withCountry);
      }
    };
  }

  LocaleResolutionCallback resolution({Locale fallback, bool withCountry = true}) {
    return (Locale locale, Iterable<Locale> supported) {
      return _resolve(locale, fallback, supported, withCountry);
    };
  }

  @override
  Future<S> load(Locale locale) {
    final String lang = getLang(locale);
    if (lang != null) {
      switch (lang) {
        case "ar":
          S.current = const $ar();
          return SynchronousFuture<S>(S.current);
        case "ru":
          S.current = const $ru();
          return SynchronousFuture<S>(S.current);
        case "en":
          S.current = const $en();
          return SynchronousFuture<S>(S.current);
        default:
          // NO-OP.
      }
    }
    S.current = const S();
    return SynchronousFuture<S>(S.current);
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale, true);

  @override
  bool shouldReload(GeneratedLocalizationsDelegate old) => false;

  ///
  /// Internal method to resolve a locale from a list of locales.
  ///
  Locale _resolve(Locale locale, Locale fallback, Iterable<Locale> supported, bool withCountry) {
    if (locale == null || !_isSupported(locale, withCountry)) {
      return fallback ?? supported.first;
    }

    final Locale languageLocale = Locale(locale.languageCode, "");
    if (supported.contains(locale)) {
      return locale;
    } else if (supported.contains(languageLocale)) {
      return languageLocale;
    } else {
      final Locale fallbackLocale = fallback ?? supported.first;
      return fallbackLocale;
    }
  }

  ///
  /// Returns true if the specified locale is supported, false otherwise.
  ///
  bool _isSupported(Locale locale, bool withCountry) {
    if (locale != null) {
      for (Locale supportedLocale in supportedLocales) {
        // Language must always match both locales.
        if (supportedLocale.languageCode != locale.languageCode) {
          continue;
        }

        // If country code matches, return this locale.
        if (supportedLocale.countryCode == locale.countryCode) {
          return true;
        }

        // If no country requirement is requested, check if this locale has no country.
        if (true != withCountry && (supportedLocale.countryCode == null || supportedLocale.countryCode.isEmpty)) {
          return true;
        }
      }
    }
    return false;
  }
}

String getLang(Locale l) => l == null
  ? null
  : l.countryCode != null && l.countryCode.isEmpty
    ? l.languageCode
    : l.toString();
