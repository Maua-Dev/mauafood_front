// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pt locale. All the
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
  String get localeName => 'pt';

  static String m0(meal) => "${Intl.select(meal, {
            'tudo': 'Tudo',
            'lanche': 'Lanche',
            'bebida': 'Bebidas',
            'doces': 'Doces',
            'pratos': 'Pratos',
            'porcoes': 'Porções',
            'massas': 'Massas',
            'salgados': 'Salgados',
            'saladas': 'Saladas',
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
            'h': 'Restaurante do H',
            'other': '',
          })}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "appTitle": MessageLookupByLibrary.simpleMessage("Mauá Food"),
        "errorEmptyList": MessageLookupByLibrary.simpleMessage("Lista vazia."),
        "errorGeneric":
            MessageLookupByLibrary.simpleMessage("Algo deu errado!"),
        "errorItemNotFound":
            MessageLookupByLibrary.simpleMessage("Nenhum item encontrado."),
        "labelMessage": MessageLookupByLibrary.simpleMessage("Mensagem"),
        "labelSend": MessageLookupByLibrary.simpleMessage("Enviar agora"),
        "mealNameSchema": m0,
        "mealPriceCurrency": m1,
        "recommendedTitle":
            MessageLookupByLibrary.simpleMessage("Recomendados"),
        "restaurantsImageSchema": m2,
        "restaurantsNameSchema": m3,
        "restaurantsTitle":
            MessageLookupByLibrary.simpleMessage("Restaurantes"),
        "searchTitle": MessageLookupByLibrary.simpleMessage("Pesquisa"),
        "seeMenuTitle": MessageLookupByLibrary.simpleMessage("Ver cardápio"),
        "typeContact":
            MessageLookupByLibrary.simpleMessage("Entre em contato conosco")
      };
}
