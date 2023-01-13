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
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
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
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Mauá Food`
  String get appTitle {
    return Intl.message(
      'Mauá Food',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get searchTitle {
    return Intl.message(
      'Search',
      name: 'searchTitle',
      desc: '',
      args: [],
    );
  }

  /// `Restaurants`
  String get restaurantsTitle {
    return Intl.message(
      'Restaurants',
      name: 'restaurantsTitle',
      desc: '',
      args: [],
    );
  }

  /// `See menu`
  String get seeMenuTitle {
    return Intl.message(
      'See menu',
      name: 'seeMenuTitle',
      desc: '',
      args: [],
    );
  }

  /// `Recommended`
  String get recommendedTitle {
    return Intl.message(
      'Recommended',
      name: 'recommendedTitle',
      desc: '',
      args: [],
    );
  }

  /// `{restaurant, select, biba{Souza de Abreu} h{H Restaurant} other{}}`
  String restaurantsNameSchema(Object restaurant) {
    return Intl.select(
      restaurant,
      {
        'biba': 'Souza de Abreu',
        'h': 'H Restaurant',
        'other': '',
      },
      name: 'restaurantsNameSchema',
      desc: '',
      args: [restaurant],
    );
  }

  /// `{restaurant, select, biba{https://upload.wikimedia.org/wikipedia/commons/6/62/Barbieri_-_ViaSophia25668.jpg} h{https://upload.wikimedia.org/wikipedia/commons/6/62/Barbieri_-_ViaSophia25668.jpg} other{}}`
  String restaurantsImageSchema(Object restaurant) {
    return Intl.select(
      restaurant,
      {
        'biba':
            'https://upload.wikimedia.org/wikipedia/commons/6/62/Barbieri_-_ViaSophia25668.jpg',
        'h':
            'https://upload.wikimedia.org/wikipedia/commons/6/62/Barbieri_-_ViaSophia25668.jpg',
        'other': '',
      },
      name: 'restaurantsImageSchema',
      desc: '',
      args: [restaurant],
    );
  }

  /// `Contact us`
  String get typeContact {
    return Intl.message(
      'Contact us',
      name: 'typeContact',
      desc: '',
      args: [],
    );
  }

  /// `{meal, select, tudo{All} lanche{Sandwich} bebida{Drinks} doces{Candies} pratos{Dishes} porcoes{Portions} massas{Pastas} salgados{Snacks} saladas{Salads} other{}}`
  String mealNameSchema(Object meal) {
    return Intl.select(
      meal,
      {
        'tudo': 'All',
        'lanche': 'Sandwich',
        'bebida': 'Drinks',
        'doces': 'Candies',
        'pratos': 'Dishes',
        'porcoes': 'Portions',
        'massas': 'Pastas',
        'salgados': 'Snacks',
        'saladas': 'Salads',
        'other': '',
      },
      name: 'mealNameSchema',
      desc: '',
      args: [meal],
    );
  }

  /// `{amount} `
  String mealPriceCurrency(double amount) {
    final NumberFormat amountNumberFormat = NumberFormat.currency(
        locale: Intl.getCurrentLocale(),
        decimalDigits: 2,
        name: 'BRL',
        symbol: 'R\$',
        customPattern: '¤#0.00');
    final String amountString = amountNumberFormat.format(amount);

    return Intl.message(
      '$amountString ',
      name: 'mealPriceCurrency',
      desc: '',
      args: [amountString],
    );
  }

  /// `Something went wrong!`
  String get errorGeneric {
    return Intl.message(
      'Something went wrong!',
      name: 'errorGeneric',
      desc: '',
      args: [],
    );
  }

  /// `No items found.`
  String get errorItemNotFound {
    return Intl.message(
      'No items found.',
      name: 'errorItemNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Empty List.`
  String get errorEmptyList {
    return Intl.message(
      'Empty List.',
      name: 'errorEmptyList',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '' key
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'pt'),
    ];
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
