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
            'codeDeliveryFailure':
                'Falha ao enviar código para o e-mail, tente novamente.',
            'codeMismatch': 'Código fornecido está errado, tente novamente.',
            'invalidParameter': 'E-mail, provavelmente, já confirmado.',
            'usernameExists': 'Já existe um cadastro com este e-mail.',
            'notAuthorized': 'E-mail não confirmado, confirme-o.',
            'userNotConfirmed': 'E-mail não confirmado, confirme-o.',
            'signedOut': 'E-mail ou senha incorretos.',
            'limitExceeded':
                'Muitas tentativas em sequência, tente novamente mais tarde.',
            'tooManyFailedAttempts':
                'Parece que você tentou errou o código muitas vezes, entre em contato.',
            'userNotFound': 'Não encontramos este e-mail cadastrado.',
            'internalError':
                'Estamos com problemas internos, tente mais tarde.',
            'other': 'Ocorreu algum erro ao confirmar e-mail.',
          })}";

  static String m1(placeholders, entityErrorMessage) =>
      "Campo ${entityErrorMessage} não é válido";

  static String m2(placeholders, message) =>
      "Itens não encontrados para: ${message}";

  static String m3(notifications) => "${Intl.select(notifications, {
            'normalPart': 'Deseja receber ',
            'email': 'notificações por e-mail',
            'app': 'notificações pelo app',
            'other': '',
          })}";

  static String m4(product) => "${Intl.select(product, {
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

  static String m5(placeholders, prepareTime) => "${prepareTime} min";

  static String m6(amount) => "${amount} ";

  static String m7(name) => "${Intl.select(name, {
            'Tudo': 'ALL',
            'Lanches': 'SANDWICHES',
            'Bebidas': 'DRINKS',
            'Doces': 'CANDIES',
            'Pratos': 'PLATES',
            'Porcoes': 'PORTIONS',
            'Massas': 'PASTAS',
            'Snacks': 'SNACKS',
            'Saladas': 'SALADS',
            'Sobremesa': 'DESSERT',
            'Salgado': 'SAVOURY',
            'other': 'OUTROS',
          })}";

  static String m8(placeholders, message) => "${message}";

  static String m9(placeholders, restaurantName) => "${restaurantName}";

  static String m10(restaurant) => "${Intl.select(restaurant, {
            'souza_de_abreu': 'bibaImage',
            'hora_h': 'hora_hImage',
            'cantina_do_moleza': 'molezaImage',
            'other': '',
          })}";

  static String m11(restaurant) => "${Intl.select(restaurant, {
            'souza_de_abreu': 'Souza de Abreu',
            'hora_h': 'Hora H',
            'cantina_do_moleza': 'Cantina do Moleza',
            'other': '',
          })}";

  static String m12(status) => "${Intl.select(status, {
            'PENDING': 'Pendente',
            'PREPARING': 'Em preparo',
            'REFUSED': 'Recusado',
            'READY': 'Pronto',
            'CANCELED': 'Cancelado',
            'ALL': 'Todos',
            'other': 'Outros',
          })}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "appAcceptTerms": MessageLookupByLibrary.simpleMessage(
            "Li e aceito os Termos de Uso"),
        "appTitle": MessageLookupByLibrary.simpleMessage("Mauá Food"),
        "applyTitle": MessageLookupByLibrary.simpleMessage("Aplicar"),
        "attentionTitle": MessageLookupByLibrary.simpleMessage("Atenção"),
        "authErrorsSchema": m0,
        "biggestPriceTitle":
            MessageLookupByLibrary.simpleMessage("Maior Preço"),
        "cancelationTitle": MessageLookupByLibrary.simpleMessage("Cancelar"),
        "cart": MessageLookupByLibrary.simpleMessage("Cesta"),
        "categoriesTitle": MessageLookupByLibrary.simpleMessage("Categorias"),
        "categoryTitle": MessageLookupByLibrary.simpleMessage("Categoria"),
        "changePasswordTitle":
            MessageLookupByLibrary.simpleMessage("Alterar senha"),
        "cleanFilterTitle":
            MessageLookupByLibrary.simpleMessage("Limpar filtro"),
        "closeTitle": MessageLookupByLibrary.simpleMessage("Fechar"),
        "codeErrorAlert":
            MessageLookupByLibrary.simpleMessage("Erro com código."),
        "codeTitle": MessageLookupByLibrary.simpleMessage("Código"),
        "confirmEmailTitle":
            MessageLookupByLibrary.simpleMessage("Confirme seu e-mail"),
        "confirmNewPasswordTitle":
            MessageLookupByLibrary.simpleMessage("Confirme a nova senha"),
        "confirmPasswordTitle":
            MessageLookupByLibrary.simpleMessage("Confirme sua senha"),
        "confirmTitle": MessageLookupByLibrary.simpleMessage("Confirmar"),
        "confirmationCodeInstructionsTitle": MessageLookupByLibrary.simpleMessage(
            "Por favor, digite seu e-mail, vamos mandar um código de verificação."),
        "contactError": MessageLookupByLibrary.simpleMessage(
            "Erro ao enviar mensagem, tente novamente mais tarde."),
        "correctFieldsInstructionsAlert": MessageLookupByLibrary.simpleMessage(
            "Certifique-se que os campos estão corretos."),
        "cpfTitle": MessageLookupByLibrary.simpleMessage("CPF"),
        "createProductTitle":
            MessageLookupByLibrary.simpleMessage("Criar produto"),
        "createTitle": MessageLookupByLibrary.simpleMessage("Criar"),
        "customersView":
            MessageLookupByLibrary.simpleMessage("Visão dos clientes"),
        "dataStorageAlertTitle": MessageLookupByLibrary.simpleMessage(
            "Caso voce confirme o envio da mensagem, está concordando que armazenemos seu nome e e-mail para que possamos ter o seu feedback e caso necessário, responde-lo."),
        "dataStorageTitle":
            MessageLookupByLibrary.simpleMessage("Armazenamento de dados"),
        "deleteProductConfirmationTitle": MessageLookupByLibrary.simpleMessage(
            "Tem certeza que deseja excluir o produto?"),
        "deleteTitle": MessageLookupByLibrary.simpleMessage("Excluir"),
        "descriptionTitle": MessageLookupByLibrary.simpleMessage("Descrição"),
        "disclaimerText": MessageLookupByLibrary.simpleMessage(
            "O MauáFood trabalha em conjunto com os restaurantes para estarmos sempre atualizados, porém não nos responsabilizamos por qualquer diferença entre os preços, disponibilidade e informações dos produtos dos menus exibidos.\nQualquer erro encontrado nos informe clicando no ícone de e-mail no canto inferior direito da tela!"),
        "doLoginTitle": MessageLookupByLibrary.simpleMessage("Faça o login"),
        "editProductTitle":
            MessageLookupByLibrary.simpleMessage("Editar produto"),
        "editTitle": MessageLookupByLibrary.simpleMessage("Editar"),
        "emailConfirmationTitle":
            MessageLookupByLibrary.simpleMessage("Confirmação de e-mail"),
        "emailTitle": MessageLookupByLibrary.simpleMessage("E-mail"),
        "emptyListErrorMessage": MessageLookupByLibrary.simpleMessage(
            "Lista vazia, itens não encontrados para essa requisição"),
        "enterTitle": MessageLookupByLibrary.simpleMessage("Entrar"),
        "entityErrorMessage": m1,
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
        "forgotPasswordTitle":
            MessageLookupByLibrary.simpleMessage("Esqueceu a senha?"),
        "fullNameTitle": MessageLookupByLibrary.simpleMessage("Nome Completo"),
        "haveAccountTitle":
            MessageLookupByLibrary.simpleMessage("Já tem uma conta?"),
        "havePasswordTitle":
            MessageLookupByLibrary.simpleMessage("Já tem uma senha?"),
        "help": MessageLookupByLibrary.simpleMessage("Ajuda"),
        "home": MessageLookupByLibrary.simpleMessage("Home"),
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
        "loginTitle": MessageLookupByLibrary.simpleMessage("Login"),
        "lowestPriceTitle": MessageLookupByLibrary.simpleMessage("Menor Preço"),
        "messageSentError": MessageLookupByLibrary.simpleMessage(
            "Error ao enviar Email, Tente novamente mais tarde."),
        "messageSentSuccessfully":
            MessageLookupByLibrary.simpleMessage("Email enviado com sucesso!"),
        "minutesTitle": MessageLookupByLibrary.simpleMessage("minutos"),
        "nameTitle": MessageLookupByLibrary.simpleMessage("Nome"),
        "newPasswordTitle": MessageLookupByLibrary.simpleMessage("Nova senha"),
        "noItemsFoundErrorMessage": m2,
        "notificationsOptionsSchema": m3,
        "orders": MessageLookupByLibrary.simpleMessage("Pedidos"),
        "passwordInstructionsAlert": MessageLookupByLibrary.simpleMessage(
            "Sua senha deve conter: \n - Uma ou mais letras maiúsculas \n - Uma ou mais letras minúsculas \n - Um ou mais números \n - Um ou mais caracteres especiais\n(#, ?, !, @, \\\$, %, ^, &, *, -)  \n - Mínimo de 8 caracteres"),
        "passwordTitle": MessageLookupByLibrary.simpleMessage("Senha"),
        "photoTitle": MessageLookupByLibrary.simpleMessage("Foto"),
        "prepareTimeTitle":
            MessageLookupByLibrary.simpleMessage("Tempo de Preparo"),
        "previewTitle":
            MessageLookupByLibrary.simpleMessage("Pré-visualização"),
        "priceOrder": MessageLookupByLibrary.simpleMessage("Ordem de preço"),
        "priceRangeOrder":
            MessageLookupByLibrary.simpleMessage("Faixa de preço"),
        "priceTitle": MessageLookupByLibrary.simpleMessage("Preço"),
        "productAvailabilityTitle":
            MessageLookupByLibrary.simpleMessage("Disponibilidade do Produto"),
        "productNameSchema": m4,
        "productPrepareTimeMinutes": m5,
        "productPriceCurrency": m6,
        "productSuccessfullyCreatedTitle":
            MessageLookupByLibrary.simpleMessage("Produto criado com sucesso."),
        "productSuccessfullyDeletedTitle": MessageLookupByLibrary.simpleMessage(
            "Produto excluído com sucesso."),
        "productSuccessfullyEditedTitle": MessageLookupByLibrary.simpleMessage(
            "Produto editado com sucesso."),
        "productToEnumSchema": m7,
        "profile": MessageLookupByLibrary.simpleMessage("Perfil"),
        "profileErrorPictureMessage": MessageLookupByLibrary.simpleMessage(
            "Ocorreu um erro ao mudar a foto de perfil"),
        "profileSuccessPictureMessage": MessageLookupByLibrary.simpleMessage(
            "Foto de perfil atualizado com sucesso"),
        "questionMark": MessageLookupByLibrary.simpleMessage("?"),
        "recommendationsTitle":
            MessageLookupByLibrary.simpleMessage("Recomendações"),
        "recommendedTitle":
            MessageLookupByLibrary.simpleMessage("Outras Opções"),
        "registerEmailInstructionsTitle": MessageLookupByLibrary.simpleMessage(
            "Para completar seu cadastro enviamos um e-mail com um código, insira-o no campo abaixo."),
        "registerTitle": MessageLookupByLibrary.simpleMessage("Cadastrar"),
        "requestErrorMessage": m8,
        "requiredFieldAlert":
            MessageLookupByLibrary.simpleMessage("Campo obrigatório."),
        "resendConfirmationCodeTitle": MessageLookupByLibrary.simpleMessage(
            "Reeviar código de confirmação"),
        "restaurantTitle": m9,
        "restaurantsImageSchema": m10,
        "restaurantsNameSchema": m11,
        "restaurantsTitle":
            MessageLookupByLibrary.simpleMessage("Restaurantes"),
        "saveTitle": MessageLookupByLibrary.simpleMessage("Salvar"),
        "searchTitle": MessageLookupByLibrary.simpleMessage("Pesquisa"),
        "seeMenuTitle": MessageLookupByLibrary.simpleMessage("Ver cardápio"),
        "selectButton": MessageLookupByLibrary.simpleMessage("Selecionar"),
        "sendCodeEmailInstructionsTitle": MessageLookupByLibrary.simpleMessage(
            "Enviamos um código de confirmação em seu e-mail, digite-o no campo abaixo."),
        "sendTitle": MessageLookupByLibrary.simpleMessage("Enviar"),
        "statusNameSchema": m12,
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
