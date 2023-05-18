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

  static String m0(schema) => "${Intl.select(schema, {
            'limitExceeded':
                'Muitas tentativas em sequência, tente novamente mais tarde.',
            'codeMismatch': 'Código fornecido está errado, tente novamente.',
            'userNotConfirmed': 'E-mail não confirmado, confirme-o.',
            'internalError':
                'Estamos com problemas internos, tente mais tarde.',
            'other': 'Erro ao tentar mudar senha, tente mais tarde.',
          })}";

  static String m1(schema) => "${Intl.select(schema, {
            'limitExceeded':
                'Muitas tentativas em sequência, tente novamente mais tarde.',
            'invalidParameter': 'E-mail, provavelmente, já confirmado.',
            'tooManyFailedAttempts':
                'Parece que você tentou errou o código muitas vezes, entre em contato.',
            'userNotFound': 'Não encontramos este e-mail cadastrado.',
            'internalError':
                'Estamos com problemas internos, tente mais tarde.',
            'codeMismatch': 'Código fornecido está errado, tente novamente.',
            'other': 'Ocorreu algum erro ao confirmar e-mail.',
          })}";

  static String m2(schema) => "${Intl.select(schema, {
            'limitExceeded':
                'Muitas tentativas em sequência, tente novamente mais tarde.',
            'userNotConfirmed': 'E-mail não confirmado, confirme-o.',
            'userNotFound':
                'E-mail não encontrado, certifique-se de que fez cadastro.',
            'invalidParameter':
                'E-mail não confirmado, confirme-o antes de mudar a senha.',
            'internalError':
                'Estamos com problemas internos, tente mais tarde.',
            'other': 'Erro ao tentar resetar senha, tente mais tarde.',
          })}";

  static String m3(schema) => "${Intl.select(schema, {
            'limitExceeded':
                'Muitas tentativas em sequência, tente novamente mais tarde.',
            'signedOut': 'E-mail ou senha incorretos.',
            'notAuthorized': 'E-mail não confirmado, confirme-o.',
            'userNotConfirmed': 'E-mail não confirmado, confirme-o.',
            'userNotFound':
                'E-mail ou senha incorretos ou e-mail não cadastrado.',
            'other': 'Erro ao tentar pegar atributos de usuário.',
          })}";

  static String m4(schema) => "${Intl.select(schema, {
            'limitExceeded':
                'Muitas tentativas em sequência, tente novamente mais tarde.',
            'signedOut': 'E-mail ou senha incorretos.',
            'notAuthorized': 'E-mail não confirmado, confirme-o.',
            'userNotConfirmed': 'E-mail não confirmado, confirme-o.',
            'userNotFound':
                'E-mail ou senha incorretos ou e-mail não cadastrado.',
            'other': 'Algo deu errado ao logar, tente novamente mais tarde.',
          })}";

  static String m5(schema) => "${Intl.select(schema, {
            'limitExceeded':
                'Muitas tentativas em sequência, tente novamente mais tarde.',
            'internalError':
                'Estamos com problemas internos, tente mais tarde.',
            'other': 'Erro ao tentar fazer logout, tente mais tarde.',
          })}";

  static String m6(notifications) => "${Intl.select(notifications, {
            'normalPart': 'Deseja receber ',
            'email': 'notificações por e-mail',
            'app': 'notificações pelo app',
            'other': '',
          })}";

  static String m7(product) => "${Intl.select(product, {
            'ALL': 'Tudo',
            'SANDWICHES': 'Lanches',
            'DRINKS': 'Bebidas',
            'CANDIES': 'Doces',
            'PLATES': 'Pratos',
            'PORTIONS': 'Porções',
            'PASTAS': 'Massas',
            'SNACKS': 'Snacks',
            'SALADS': 'Saladas',
            'DESSERT': 'Sobremesa',
            'SAVOURY': 'Salgado',
            'other': 'Outros',
          })}";

  static String m8(placeholders, prepareTime) => "${prepareTime} min";

  static String m9(amount) => "${amount} ";

  static String m10(schema) => "${Intl.select(schema, {
            'limitExceeded':
                'Muitas tentativas em sequência, tente novamente mais tarde.',
            'usernameExists': 'Já existe um cadastro com este e-mail.',
            'invalidParameter': 'Algum campo preenchido de forma errada.',
            'internalError':
                'Estamos com problemas internos, tente mais tarde.',
            'other':
                'Ocorreu algum erro ao tentar cadastrar, tente novamente mais tarde.',
          })}";

  static String m11(schema) => "${Intl.select(schema, {
            'invalidParameter': 'E-mail, provavelmente, já confirmado.',
            'userNotFound':
                'E-mail não encontrado, certifique-se de que fez cadastro.',
            'limitExceeded':
                'Muitas tentativas em sequência, tente novamente mais tarde.',
            'internalError':
                'Estamos com problemas internos, tente mais tarde.',
            'codeDeliveryFailure':
                'Falha ao enviar código para o e-mail, tente novamente.',
            'other': 'Erro ao tentar enviar código, tente mais tarde.',
          })}";

  static String m12(placeholders, restaurantName) => "${restaurantName}";

  static String m13(restaurant) => "${Intl.select(restaurant, {
            'biba': 'bibaImage',
            'hora_h': 'hora_hImage',
            'moleza': 'molezaImage',
            'other': '',
          })}";

  static String m14(restaurant) => "${Intl.select(restaurant, {
            'biba': 'Souza de Abreu',
            'hora_h': 'Hora H',
            'moleza': 'Cantina do Moleza',
            'other': '',
          })}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "appAcceptTerms": MessageLookupByLibrary.simpleMessage(
            "Li e aceito os Termos de Uso"),
        "appTitle": MessageLookupByLibrary.simpleMessage("Mauá Food"),
        "attentionTitle": MessageLookupByLibrary.simpleMessage("Atenção"),
        "changePasswordTitle":
            MessageLookupByLibrary.simpleMessage("Alterar senha"),
        "codeErrorAlert":
            MessageLookupByLibrary.simpleMessage("Erro com código."),
        "codeTitle": MessageLookupByLibrary.simpleMessage("Código"),
        "confirmEmailTitle":
            MessageLookupByLibrary.simpleMessage("Confirme seu e-mail"),
        "confirmNewPasswordTitle":
            MessageLookupByLibrary.simpleMessage("Confirme a nova senha"),
        "confirmPasswordTitle":
            MessageLookupByLibrary.simpleMessage("Confirme sua senha"),
        "confirmResetPasswordErrorsSchema": m0,
        "confirmTitle": MessageLookupByLibrary.simpleMessage("Confirmar"),
        "confirmationCodeInstructionsTitle": MessageLookupByLibrary.simpleMessage(
            "Por favor, digite seu e-mail, vamos mandar um código de verificação."),
        "correctFieldsInstructionsAlert": MessageLookupByLibrary.simpleMessage(
            "Certifique-se que os campos estão corretos."),
        "cpfTitle": MessageLookupByLibrary.simpleMessage("CPF"),
        "disclaimerText": MessageLookupByLibrary.simpleMessage(
            "O MauáFood trabalha em conjunto com os restaurantes para estarmos sempre atualizados, porém não nos responsabilizamos por qualquer diferença entre os preços, disponibilidade e informações dos produtos dos menus exibidos.\nQualquer erro encontrado nos informe clicando no ícone de e-mail no canto inferior direito da tela!"),
        "doLoginTitle": MessageLookupByLibrary.simpleMessage("Faça o login"),
        "emailConfirmationErrorsSchema": m1,
        "emailConfirmationTitle":
            MessageLookupByLibrary.simpleMessage("Confirmação de e-mail"),
        "emailTitle": MessageLookupByLibrary.simpleMessage("E-mail"),
        "enterTitle": MessageLookupByLibrary.simpleMessage("Entrar"),
        "equalPasswordAlert":
            MessageLookupByLibrary.simpleMessage("Senhas devem ser iguais."),
        "errorEmailOrPassword":
            MessageLookupByLibrary.simpleMessage("Erro com e-mail ou senha."),
        "errorEmptyList": MessageLookupByLibrary.simpleMessage("Lista vazia."),
        "errorFields": MessageLookupByLibrary.simpleMessage(
            "Erro com os campos inseridos."),
        "errorGeneric":
            MessageLookupByLibrary.simpleMessage("Algo deu errado!"),
        "errorItemNotFound":
            MessageLookupByLibrary.simpleMessage("Nenhum item encontrado."),
        "fillFieldsInstructionsAlert": MessageLookupByLibrary.simpleMessage(
            "Certifique-se de que preencheu todos os campos."),
        "forgotPasswordErrorsSchema": m2,
        "forgotPasswordTitle":
            MessageLookupByLibrary.simpleMessage("Esqueceu a senha?"),
        "fullNameTitle": MessageLookupByLibrary.simpleMessage("Nome Completo"),
        "getUserAtribbutesErrorsSchema": m3,
        "haveAccountTitle":
            MessageLookupByLibrary.simpleMessage("Já tem uma conta?"),
        "havePasswordTitle":
            MessageLookupByLibrary.simpleMessage("Já tem uma senha?"),
        "invalidCodeAlert":
            MessageLookupByLibrary.simpleMessage("Código inválido."),
        "invalidCpfAlert":
            MessageLookupByLibrary.simpleMessage("CPF inválido."),
        "invalidEmailAlert":
            MessageLookupByLibrary.simpleMessage("E-mail inválido."),
        "invalidFullNameAlert": MessageLookupByLibrary.simpleMessage(
            "Por favor, insira o nome completo."),
        "invalidPasswordAlert":
            MessageLookupByLibrary.simpleMessage("Senha inválida."),
        "labelMessage": MessageLookupByLibrary.simpleMessage("Mensagem"),
        "labelName": MessageLookupByLibrary.simpleMessage("Nome Completo"),
        "labelSend": MessageLookupByLibrary.simpleMessage("Enviar agora"),
        "loginErrorsSchema": m4,
        "loginTitle": MessageLookupByLibrary.simpleMessage("Login"),
        "logoutErrorsSchema": m5,
        "messageSentSuccessfully":
            MessageLookupByLibrary.simpleMessage("Email enviado com sucesso!"),
        "newPasswordTitle": MessageLookupByLibrary.simpleMessage("Nova senha"),
        "notificationsOptionsSchema": m6,
        "passwordInstructionsAlert": MessageLookupByLibrary.simpleMessage(
            "Sua senha deve conter: \n - Uma ou mais letras maiúsculas \n - Uma ou mais letras minúsculas \n - Um ou mais números \n - Um ou mais caracteres especiais\n(#, ?, !, @, \\\$, %, ^, &, *, -)  \n - Mínimo de 8 caracteres"),
        "passwordTitle": MessageLookupByLibrary.simpleMessage("Senha"),
        "productNameSchema": m7,
        "productPrepareTimeMinutes": m8,
        "productPriceCurrency": m9,
        "questionMark": MessageLookupByLibrary.simpleMessage("?"),
        "recommendationsTitle":
            MessageLookupByLibrary.simpleMessage("Recomendações"),
        "recommendedTitle":
            MessageLookupByLibrary.simpleMessage("Recomendados"),
        "registerEmailInstructionsTitle": MessageLookupByLibrary.simpleMessage(
            "Para completar seu cadastro enviamos um e-mail com um código, insira-o no campo abaixo."),
        "registerErrorsSchema": m10,
        "registerTitle": MessageLookupByLibrary.simpleMessage("Cadastrar"),
        "requiredFieldAlert":
            MessageLookupByLibrary.simpleMessage("Campo obrigatório."),
        "resendCodeErrorsSchema": m11,
        "resendConfirmationCodeTitle": MessageLookupByLibrary.simpleMessage(
            "Reeviar código de confirmação"),
        "restaurantTitle": m12,
        "restaurantsImageSchema": m13,
        "restaurantsNameSchema": m14,
        "restaurantsTitle":
            MessageLookupByLibrary.simpleMessage("Restaurantes"),
        "searchTitle": MessageLookupByLibrary.simpleMessage("Pesquisa"),
        "seeMenuTitle": MessageLookupByLibrary.simpleMessage("Ver cardápio"),
        "sendCodeEmailInstructionsTitle": MessageLookupByLibrary.simpleMessage(
            "Enviamos um código de confirmação em seu e-mail, digite-o no campo abaixo."),
        "sendTitle": MessageLookupByLibrary.simpleMessage("Enviar"),
        "successChangePassword":
            MessageLookupByLibrary.simpleMessage("Senha alterada com sucesso!"),
        "successConfirmEmail":
            MessageLookupByLibrary.simpleMessage("E-mail confirmado!"),
        "termsAcceptAlert": MessageLookupByLibrary.simpleMessage(
            "É necessário aceitar os Termos de Uso."),
        "typeContact":
            MessageLookupByLibrary.simpleMessage("Entre em contato conosco"),
        "typeEmailCorrectlyAlert": MessageLookupByLibrary.simpleMessage(
            "Certifique-se que digitou e-mail corretamente."),
        "typeEmailPasswordAlert": MessageLookupByLibrary.simpleMessage(
            "Certifique-se que digitou e-mail e senha."),
        "understoodTitle": MessageLookupByLibrary.simpleMessage("Entendido!")
      };
}
