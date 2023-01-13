// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(meal) => "${Intl.select(meal, {
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
          })}";

  static String m1(amount) => "${amount} ";

  static String m2(restaurant) => "${Intl.select(restaurant, {
            'biba':
                'https://upload.wikimedia.org/wikipedia/commons/6/62/Barbieri_-_ViaSophia25668.jpg',
            'h':
                'https://upload.wikimedia.org/wikipedia/commons/6/62/Barbieri_-_ViaSophia25668.jpg',
            'other': '',
          })}";

  static String m3(restaurant) => "${Intl.select(restaurant, {
            'biba': 'Souza de Abreu',
            'h': 'H Restaurant',
            'other': '',
          })}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "appTitle": MessageLookupByLibrary.simpleMessage("Mauá Food"),
        "errorEmptyList": MessageLookupByLibrary.simpleMessage("Empty List."),
        "errorGeneric":
            MessageLookupByLibrary.simpleMessage("Something went wrong!"),
        "errorItemNotFound":
            MessageLookupByLibrary.simpleMessage("No items found."),
        "mealNameSchema": m0,
        "mealPriceCurrency": m1,
        "recommendedTitle": MessageLookupByLibrary.simpleMessage("Recommended"),
        "restaurantsImageSchema": m2,
        "restaurantsNameSchema": m3,
        "restaurantsTitle": MessageLookupByLibrary.simpleMessage("Restaurants"),
        "searchTitle": MessageLookupByLibrary.simpleMessage("Search"),
        "seeMenuTitle": MessageLookupByLibrary.simpleMessage("See menu"),
        "typeContact": MessageLookupByLibrary.simpleMessage("Contact us")
      };
}
