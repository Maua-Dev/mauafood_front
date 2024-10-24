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

  /// `?`
  String get questionMark {
    return Intl.message(
      '?',
      name: 'questionMark',
      desc: '',
      args: [],
    );
  }

  /// `I read and accept the Terms of Use`
  String get appAcceptTerms {
    return Intl.message(
      'I read and accept the Terms of Use',
      name: 'appAcceptTerms',
      desc: '',
      args: [],
    );
  }

  /// `{restaurantName}`
  String restaurantTitle(Object placeholders, Object restaurantName) {
    return Intl.message(
      '$restaurantName',
      name: 'restaurantTitle',
      desc: '',
      args: [placeholders, restaurantName],
    );
  }

  /// `Attention`
  String get attentionTitle {
    return Intl.message(
      'Attention',
      name: 'attentionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Understood!`
  String get understoodTitle {
    return Intl.message(
      'Understood!',
      name: 'understoodTitle',
      desc: '',
      args: [],
    );
  }

  /// `MauáFood works together with the restaurants to always be up to date, but we are not responsible for any difference between prices, availability and product information on the displayed menus.\nAny error found, please let us know by clicking the e-mail icon in the lower right corner of the screen!`
  String get disclaimerText {
    return Intl.message(
      'MauáFood works together with the restaurants to always be up to date, but we are not responsible for any difference between prices, availability and product information on the displayed menus.\nAny error found, please let us know by clicking the e-mail icon in the lower right corner of the screen!',
      name: 'disclaimerText',
      desc: '',
      args: [],
    );
  }

  /// `E-mail`
  String get emailTitle {
    return Intl.message(
      'E-mail',
      name: 'emailTitle',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get passwordTitle {
    return Intl.message(
      'Password',
      name: 'passwordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Confirm your password`
  String get confirmPasswordTitle {
    return Intl.message(
      'Confirm your password',
      name: 'confirmPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `New password`
  String get newPasswordTitle {
    return Intl.message(
      'New password',
      name: 'newPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Confirm the new password`
  String get confirmNewPasswordTitle {
    return Intl.message(
      'Confirm the new password',
      name: 'confirmNewPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Confirm your email`
  String get confirmEmailTitle {
    return Intl.message(
      'Confirm your email',
      name: 'confirmEmailTitle',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullNameTitle {
    return Intl.message(
      'Full Name',
      name: 'fullNameTitle',
      desc: '',
      args: [],
    );
  }

  /// `CPF`
  String get cpfTitle {
    return Intl.message(
      'CPF',
      name: 'cpfTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter`
  String get enterTitle {
    return Intl.message(
      'Enter',
      name: 'enterTitle',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get registerTitle {
    return Intl.message(
      'Register',
      name: 'registerTitle',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get sendTitle {
    return Intl.message(
      'Send',
      name: 'sendTitle',
      desc: '',
      args: [],
    );
  }

  /// `Code`
  String get codeTitle {
    return Intl.message(
      'Code',
      name: 'codeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirmTitle {
    return Intl.message(
      'Confirm',
      name: 'confirmTitle',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get nameTitle {
    return Intl.message(
      'Name',
      name: 'nameTitle',
      desc: '',
      args: [],
    );
  }

  /// `Photo`
  String get photoTitle {
    return Intl.message(
      'Photo',
      name: 'photoTitle',
      desc: '',
      args: [],
    );
  }

  /// `Prepare Time`
  String get prepareTimeTitle {
    return Intl.message(
      'Prepare Time',
      name: 'prepareTimeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get priceTitle {
    return Intl.message(
      'Price',
      name: 'priceTitle',
      desc: '',
      args: [],
    );
  }

  /// `Biggest Price`
  String get biggestPriceTitle {
    return Intl.message(
      'Biggest Price',
      name: 'biggestPriceTitle',
      desc: '',
      args: [],
    );
  }

  /// `Lowest Price`
  String get lowestPriceTitle {
    return Intl.message(
      'Lowest Price',
      name: 'lowestPriceTitle',
      desc: '',
      args: [],
    );
  }

  /// `Price order`
  String get priceOrder {
    return Intl.message(
      'Price order',
      name: 'priceOrder',
      desc: '',
      args: [],
    );
  }

  /// `Price range`
  String get priceRangeOrder {
    return Intl.message(
      'Price range',
      name: 'priceRangeOrder',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get categoryTitle {
    return Intl.message(
      'Category',
      name: 'categoryTitle',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categoriesTitle {
    return Intl.message(
      'Categories',
      name: 'categoriesTitle',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get descriptionTitle {
    return Intl.message(
      'Description',
      name: 'descriptionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Observation`
  String get observationTitle {
    return Intl.message(
      'Observation',
      name: 'observationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get totalTitle {
    return Intl.message(
      'Total',
      name: 'totalTitle',
      desc: '',
      args: [],
    );
  }

  /// `Product Availability`
  String get productAvailabilityTitle {
    return Intl.message(
      'Product Availability',
      name: 'productAvailabilityTitle',
      desc: '',
      args: [],
    );
  }

  /// `Preview`
  String get previewTitle {
    return Intl.message(
      'Preview',
      name: 'previewTitle',
      desc: '',
      args: [],
    );
  }

  /// `minutes`
  String get minutesTitle {
    return Intl.message(
      'minutes',
      name: 'minutesTitle',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get saveTitle {
    return Intl.message(
      'Save',
      name: 'saveTitle',
      desc: '',
      args: [],
    );
  }

  /// `Create`
  String get createTitle {
    return Intl.message(
      'Create',
      name: 'createTitle',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get editTitle {
    return Intl.message(
      'Edit',
      name: 'editTitle',
      desc: '',
      args: [],
    );
  }

  /// `{notifications, select, normalPart{Want to receive } email{email notifications} app{app notifications} other{}}`
  String notificationsOptionsSchema(Object notifications) {
    return Intl.select(
      notifications,
      {
        'normalPart': 'Want to receive ',
        'email': 'email notifications',
        'app': 'app notifications',
        'other': '',
      },
      name: 'notificationsOptionsSchema',
      desc: '',
      args: [notifications],
    );
  }

  /// `Full Name`
  String get labelName {
    return Intl.message(
      'Full Name',
      name: 'labelName',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancelationTitle {
    return Intl.message(
      'Cancel',
      name: 'cancelationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Cancel order`
  String get cancelOrderTitle {
    return Intl.message(
      'Cancel order',
      name: 'cancelOrderTitle',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get deleteTitle {
    return Intl.message(
      'Delete',
      name: 'deleteTitle',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get applyTitle {
    return Intl.message(
      'Apply',
      name: 'applyTitle',
      desc: '',
      args: [],
    );
  }

  /// `Clean filter`
  String get cleanFilterTitle {
    return Intl.message(
      'Clean filter',
      name: 'cleanFilterTitle',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete the product?`
  String get deleteProductConfirmationTitle {
    return Intl.message(
      'Are you sure you want to delete the product?',
      name: 'deleteProductConfirmationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Product successfully deleted.`
  String get productSuccessfullyDeletedTitle {
    return Intl.message(
      'Product successfully deleted.',
      name: 'productSuccessfullyDeletedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Poduct successfully created.`
  String get productSuccessfullyCreatedTitle {
    return Intl.message(
      'Poduct successfully created.',
      name: 'productSuccessfullyCreatedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Product successfully edited.`
  String get productSuccessfullyEditedTitle {
    return Intl.message(
      'Product successfully edited.',
      name: 'productSuccessfullyEditedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Data storage`
  String get dataStorageTitle {
    return Intl.message(
      'Data storage',
      name: 'dataStorageTitle',
      desc: '',
      args: [],
    );
  }

  /// `If you confirm the sending of the message, you are agreeing that we store your name and e-mail so that we can have your feedback and, if necessary, respond to it.`
  String get dataStorageAlertTitle {
    return Intl.message(
      'If you confirm the sending of the message, you are agreeing that we store your name and e-mail so that we can have your feedback and, if necessary, respond to it.',
      name: 'dataStorageAlertTitle',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get closeTitle {
    return Intl.message(
      'Close',
      name: 'closeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Without observation`
  String get withoutObservationTitle {
    return Intl.message(
      'Without observation',
      name: 'withoutObservationTitle',
      desc: '',
      args: [],
    );
  }

  /// `No orders at the moment`
  String get emptyOrdersListWarn {
    return Intl.message(
      'No orders at the moment',
      name: 'emptyOrdersListWarn',
      desc: '',
      args: [],
    );
  }

  /// `Required field.`
  String get requiredFieldAlert {
    return Intl.message(
      'Required field.',
      name: 'requiredFieldAlert',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email.`
  String get invalidEmailAlert {
    return Intl.message(
      'Invalid email.',
      name: 'invalidEmailAlert',
      desc: '',
      args: [],
    );
  }

  /// `Invalid password.`
  String get invalidPasswordAlert {
    return Intl.message(
      'Invalid password.',
      name: 'invalidPasswordAlert',
      desc: '',
      args: [],
    );
  }

  /// `Invalid CPF.`
  String get invalidCpfAlert {
    return Intl.message(
      'Invalid CPF.',
      name: 'invalidCpfAlert',
      desc: '',
      args: [],
    );
  }

  /// `Invalid code.`
  String get invalidCodeAlert {
    return Intl.message(
      'Invalid code.',
      name: 'invalidCodeAlert',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the full name.`
  String get invalidFullNameAlert {
    return Intl.message(
      'Please enter the full name.',
      name: 'invalidFullNameAlert',
      desc: '',
      args: [],
    );
  }

  /// `Make sure you typed email correctly.`
  String get typeEmailCorrectlyAlert {
    return Intl.message(
      'Make sure you typed email correctly.',
      name: 'typeEmailCorrectlyAlert',
      desc: '',
      args: [],
    );
  }

  /// `Make sure you enter email and password.`
  String get typeEmailPasswordAlert {
    return Intl.message(
      'Make sure you enter email and password.',
      name: 'typeEmailPasswordAlert',
      desc: '',
      args: [],
    );
  }

  /// `Passwords must be the same.`
  String get equalPasswordAlert {
    return Intl.message(
      'Passwords must be the same.',
      name: 'equalPasswordAlert',
      desc: '',
      args: [],
    );
  }

  /// `Your password must contain: \n - One or more uppercase letters \n - One or more lowercase letters \n - One or more numbers \n - One or more special characters\n(#, ?, !, @, \$, %, ^, &, *, -) \n - Minimum 8 characters`
  String get passwordInstructionsAlert {
    return Intl.message(
      'Your password must contain: \n - One or more uppercase letters \n - One or more lowercase letters \n - One or more numbers \n - One or more special characters\n(#, ?, !, @, \\\$, %, ^, &, *, -) \n - Minimum 8 characters',
      name: 'passwordInstructionsAlert',
      desc: '',
      args: [],
    );
  }

  /// `Make sure the fields are correct.`
  String get correctFieldsInstructionsAlert {
    return Intl.message(
      'Make sure the fields are correct.',
      name: 'correctFieldsInstructionsAlert',
      desc: '',
      args: [],
    );
  }

  /// `Make sure you fill in all the fields.`
  String get fillFieldsInstructionsAlert {
    return Intl.message(
      'Make sure you fill in all the fields.',
      name: 'fillFieldsInstructionsAlert',
      desc: '',
      args: [],
    );
  }

  /// `It is necessary to accept the Terms of Use.`
  String get termsAcceptAlert {
    return Intl.message(
      'It is necessary to accept the Terms of Use.',
      name: 'termsAcceptAlert',
      desc: '',
      args: [],
    );
  }

  /// `Error with code.`
  String get codeErrorAlert {
    return Intl.message(
      'Error with code.',
      name: 'codeErrorAlert',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get forgotPasswordTitle {
    return Intl.message(
      'Forgot password?',
      name: 'forgotPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePasswordTitle {
    return Intl.message(
      'Change Password',
      name: 'changePasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Email confirmation`
  String get emailConfirmationTitle {
    return Intl.message(
      'Email confirmation',
      name: 'emailConfirmationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Resend confirmation code`
  String get resendConfirmationCodeTitle {
    return Intl.message(
      'Resend confirmation code',
      name: 'resendConfirmationCodeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email, we will send you a verification code.`
  String get confirmationCodeInstructionsTitle {
    return Intl.message(
      'Please enter your email, we will send you a verification code.',
      name: 'confirmationCodeInstructionsTitle',
      desc: '',
      args: [],
    );
  }

  /// `We sent a confirmation code to your email, enter it in the field below.`
  String get sendCodeEmailInstructionsTitle {
    return Intl.message(
      'We sent a confirmation code to your email, enter it in the field below.',
      name: 'sendCodeEmailInstructionsTitle',
      desc: '',
      args: [],
    );
  }

  /// `To complete your registration, we will send you an email with a code, enter it in the field below.`
  String get registerEmailInstructionsTitle {
    return Intl.message(
      'To complete your registration, we will send you an email with a code, enter it in the field below.',
      name: 'registerEmailInstructionsTitle',
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

  /// `More Options`
  String get recommendedTitle {
    return Intl.message(
      'More Options',
      name: 'recommendedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get loginTitle {
    return Intl.message(
      'Login',
      name: 'loginTitle',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get doLoginTitle {
    return Intl.message(
      'Login',
      name: 'doLoginTitle',
      desc: '',
      args: [],
    );
  }

  /// `Already have a password?`
  String get havePasswordTitle {
    return Intl.message(
      'Already have a password?',
      name: 'havePasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get haveAccountTitle {
    return Intl.message(
      'Already have an account?',
      name: 'haveAccountTitle',
      desc: '',
      args: [],
    );
  }

  /// `{restaurant, select, souza_de_abreu{Souza de Abreu} hora_h{H Hour} cantina_do_moleza{Cantina do Moleza} other{}}`
  String restaurantsNameSchema(Object restaurant) {
    return Intl.select(
      restaurant,
      {
        'souza_de_abreu': 'Souza de Abreu',
        'hora_h': 'H Hour',
        'cantina_do_moleza': 'Cantina do Moleza',
        'other': '',
      },
      name: 'restaurantsNameSchema',
      desc: '',
      args: [restaurant],
    );
  }

  /// `{restaurant, select, souza_de_abreu{bibaImage} hora_h{hora_hImage} cantina_do_moleza{molezaImage} other{}}`
  String restaurantsImageSchema(Object restaurant) {
    return Intl.select(
      restaurant,
      {
        'souza_de_abreu': 'bibaImage',
        'hora_h': 'hora_hImage',
        'cantina_do_moleza': 'molezaImage',
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

  /// `Message`
  String get labelMessage {
    return Intl.message(
      'Message',
      name: 'labelMessage',
      desc: '',
      args: [],
    );
  }

  /// `Send now`
  String get labelSend {
    return Intl.message(
      'Send now',
      name: 'labelSend',
      desc: '',
      args: [],
    );
  }

  /// `Customers view`
  String get customersView {
    return Intl.message(
      'Customers view',
      name: 'customersView',
      desc: '',
      args: [],
    );
  }

  /// `{product, select, ALL{All} SANDWICHES{Sandwiches} DRINKS{Drinks} CANDIES{Candies} PLATES{Dishes} PORTIONS{Portions} PASTAS{Pastas} SNACKS{Snacks} SALADS{Salads} DESSERT{Dessert} SAVOURY{Savoury} other{Other}}`
  String productNameSchema(Object product) {
    return Intl.select(
      product,
      {
        'ALL': 'All',
        'SANDWICHES': 'Sandwiches',
        'DRINKS': 'Drinks',
        'CANDIES': 'Candies',
        'PLATES': 'Dishes',
        'PORTIONS': 'Portions',
        'PASTAS': 'Pastas',
        'SNACKS': 'Snacks',
        'SALADS': 'Salads',
        'DESSERT': 'Dessert',
        'SAVOURY': 'Savoury',
        'other': 'Other',
      },
      name: 'productNameSchema',
      desc: '',
      args: [product],
    );
  }

  /// `{name, select, All{ALL} Sandwiches{SANDWICHES} Drinks{DRINKS} Candies{CANDIES} Dishes{PLATES} Portions{PORTIONS} Pastas{PASTAS} Snacks{SNACKS} Salads{SALADS} Dessert{DESSERT} Savoury{SAVOURY} other{OUTROS}}`
  String productToEnumSchema(Object name) {
    return Intl.select(
      name,
      {
        'All': 'ALL',
        'Sandwiches': 'SANDWICHES',
        'Drinks': 'DRINKS',
        'Candies': 'CANDIES',
        'Dishes': 'PLATES',
        'Portions': 'PORTIONS',
        'Pastas': 'PASTAS',
        'Snacks': 'SNACKS',
        'Salads': 'SALADS',
        'Dessert': 'DESSERT',
        'Savoury': 'SAVOURY',
        'other': 'OUTROS',
      },
      name: 'productToEnumSchema',
      desc: '',
      args: [name],
    );
  }

  /// `{amount} `
  String productPriceCurrency(double amount) {
    final NumberFormat amountNumberFormat = NumberFormat.currency(
        locale: Intl.getCurrentLocale(),
        decimalDigits: 2,
        name: 'BRL',
        symbol: 'R\$',
        customPattern: '¤#0.00');
    final String amountString = amountNumberFormat.format(amount);

    return Intl.message(
      '$amountString ',
      name: 'productPriceCurrency',
      desc: '',
      args: [amountString],
    );
  }

  /// `{prepareTime} min`
  String productPrepareTimeMinutes(Object placeholders, Object prepareTime) {
    return Intl.message(
      '$prepareTime min',
      name: 'productPrepareTimeMinutes',
      desc: '',
      args: [placeholders, prepareTime],
    );
  }

  /// `{status, select, PENDING{Pending} PREPARING{Preparing} REFUSED{Refused} READY{Ready} CANCELED{Canceled} ALL{All} other{Others}}`
  String statusNameSchema(Object status) {
    return Intl.select(
      status,
      {
        'PENDING': 'Pending',
        'PREPARING': 'Preparing',
        'REFUSED': 'Refused',
        'READY': 'Ready',
        'CANCELED': 'Canceled',
        'ALL': 'All',
        'other': 'Others',
      },
      name: 'statusNameSchema',
      desc: '',
      args: [status],
    );
  }

  /// `{status, select, PENDING{Please wait a moment, your order will be approved!} PREPARING{Your request has been approved! It will soon begin to be prepared!} REFUSED{Refused} READY{Your order is ready! Come pick it up!} CANCELED{Canceled} ALL{All} other{Others}}`
  String statusAlertSchema(Object status) {
    return Intl.select(
      status,
      {
        'PENDING': 'Please wait a moment, your order will be approved!',
        'PREPARING':
            'Your request has been approved! It will soon begin to be prepared!',
        'REFUSED': 'Refused',
        'READY': 'Your order is ready! Come pick it up!',
        'CANCELED': 'Canceled',
        'ALL': 'All',
        'other': 'Others',
      },
      name: 'statusAlertSchema',
      desc: '',
      args: [status],
    );
  }

  /// `Recommendations`
  String get recommendationsTitle {
    return Intl.message(
      'Recommendations',
      name: 'recommendationsTitle',
      desc: '',
      args: [],
    );
  }

  /// `Create product`
  String get createProductTitle {
    return Intl.message(
      'Create product',
      name: 'createProductTitle',
      desc: '',
      args: [],
    );
  }

  /// `Edit product`
  String get editProductTitle {
    return Intl.message(
      'Edit product',
      name: 'editProductTitle',
      desc: '',
      args: [],
    );
  }

  /// `Password changed successfully!`
  String get successChangePassword {
    return Intl.message(
      'Password changed successfully!',
      name: 'successChangePassword',
      desc: '',
      args: [],
    );
  }

  /// `Email confirmed!`
  String get successConfirmEmail {
    return Intl.message(
      'Email confirmed!',
      name: 'successConfirmEmail',
      desc: '',
      args: [],
    );
  }

  /// `Email successfully sent!`
  String get messageSentSuccessfully {
    return Intl.message(
      'Email successfully sent!',
      name: 'messageSentSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Error sending email, please try again later.`
  String get messageSentError {
    return Intl.message(
      'Error sending email, please try again later.',
      name: 'messageSentError',
      desc: '',
      args: [],
    );
  }

  /// `Cesta`
  String get cart {
    return Intl.message(
      'Cesta',
      name: 'cart',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Help`
  String get help {
    return Intl.message(
      'Help',
      name: 'help',
      desc: '',
      args: [],
    );
  }

  /// `Orders`
  String get orders {
    return Intl.message(
      'Orders',
      name: 'orders',
      desc: '',
      args: [],
    );
  }

  /// `Refuse order`
  String get refuseOrder {
    return Intl.message(
      'Refuse order',
      name: 'refuseOrder',
      desc: '',
      args: [],
    );
  }

  /// `Upon clicking “OK” the request will be declined and removed from the control list.`
  String get refuseOrderAlert {
    return Intl.message(
      'Upon clicking “OK” the request will be declined and removed from the control list.',
      name: 'refuseOrderAlert',
      desc: '',
      args: [],
    );
  }

  /// `Others`
  String get othersTitle {
    return Intl.message(
      'Others',
      name: 'othersTitle',
      desc: '',
      args: [],
    );
  }

  /// `Lack of input`
  String get lackOfInputTitle {
    return Intl.message(
      'Lack of input',
      name: 'lackOfInputTitle',
      desc: '',
      args: [],
    );
  }

  /// `Closed`
  String get closedTitle {
    return Intl.message(
      'Closed',
      name: 'closedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Overload`
  String get overloadTitle {
    return Intl.message(
      'Overload',
      name: 'overloadTitle',
      desc: '',
      args: [],
    );
  }

  /// `Go back`
  String get goBackTitle {
    return Intl.message(
      'Go back',
      name: 'goBackTitle',
      desc: '',
      args: [],
    );
  }

  /// `Type what happened here`
  String get whatHappenedTitle {
    return Intl.message(
      'Type what happened here',
      name: 'whatHappenedTitle',
      desc: '',
      args: [],
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

  /// `Error with email or password.`
  String get errorEmailOrPassword {
    return Intl.message(
      'Error with email or password.',
      name: 'errorEmailOrPassword',
      desc: '',
      args: [],
    );
  }

  /// `Error with the inserted fields.`
  String get errorFields {
    return Intl.message(
      'Error with the inserted fields.',
      name: 'errorFields',
      desc: '',
      args: [],
    );
  }

  /// `{schema, select, codeDeliveryFailure{Failed to send code to email, please try again.} codeMismatch{Code provided is wrong, please try again.} invalidParameter{Some field filled in incorrectly.} usernameExists{There is already an account with this email.} notAuthorized{Unconfirmed email, confirm it.} userNotConfirmed{Unconfirmed email, confirm it.} signedOut{Incorrect email or password.} limitExceeded{Too many attempts in a row, try again later.} invalidParameter{Email probably already confirmed.} tooManyFailedAttempts{Looks like you tried the code wrong too many times, get in touch.} userNotFound{We couldn't find this registered email.} internalError{We are experiencing internal issues, please try again later.} codeMismatch{Code provided is wrong, please try again.} other{An error occurred while confirming email.}}`
  String authErrorsSchema(Object schema) {
    return Intl.select(
      schema,
      {
        'codeDeliveryFailure':
            'Failed to send code to email, please try again.',
        'codeMismatch': 'Code provided is wrong, please try again.',
        'invalidParameter': 'Some field filled in incorrectly.',
        'usernameExists': 'There is already an account with this email.',
        'notAuthorized': 'Unconfirmed email, confirm it.',
        'userNotConfirmed': 'Unconfirmed email, confirm it.',
        'signedOut': 'Incorrect email or password.',
        'limitExceeded': 'Too many attempts in a row, try again later.',
        'tooManyFailedAttempts':
            'Looks like you tried the code wrong too many times, get in touch.',
        'userNotFound': 'We couldn\'t find this registered email.',
        'internalError':
            'We are experiencing internal issues, please try again later.',
        'other': 'An error occurred while confirming email.',
      },
      name: 'authErrorsSchema',
      desc: '',
      args: [schema],
    );
  }

  /// `Field {entityErrorMessage} is not valid`
  String entityErrorMessage(Object placeholders, Object entityErrorMessage) {
    return Intl.message(
      'Field $entityErrorMessage is not valid',
      name: 'entityErrorMessage',
      desc: '',
      args: [placeholders, entityErrorMessage],
    );
  }

  /// `List is empty, no items found for this request`
  String get emptyListErrorMessage {
    return Intl.message(
      'List is empty, no items found for this request',
      name: 'emptyListErrorMessage',
      desc: '',
      args: [],
    );
  }

  /// `Error sending message, please try again later.`
  String get contactError {
    return Intl.message(
      'Error sending message, please try again later.',
      name: 'contactError',
      desc: '',
      args: [],
    );
  }

  /// `{message}`
  String requestErrorMessage(Object placeholders, Object message) {
    return Intl.message(
      '$message',
      name: 'requestErrorMessage',
      desc: '',
      args: [placeholders, message],
    );
  }

  /// `No items found for {message}`
  String noItemsFoundErrorMessage(Object placeholders, Object message) {
    return Intl.message(
      'No items found for $message',
      name: 'noItemsFoundErrorMessage',
      desc: '',
      args: [placeholders, message],
    );
  }

  // skipped getter for the '' key

  /// `An error ocurred while changing your profile picture`
  String get profileErrorPictureMessage {
    return Intl.message(
      'An error ocurred while changing your profile picture',
      name: 'profileErrorPictureMessage',
      desc: '',
      args: [],
    );
  }

  /// `Profile picture successfully updated`
  String get profileSuccessPictureMessage {
    return Intl.message(
      'Profile picture successfully updated',
      name: 'profileSuccessPictureMessage',
      desc: '',
      args: [],
    );
  }

  /// `Select`
  String get selectButton {
    return Intl.message(
      'Select',
      name: 'selectButton',
      desc: '',
      args: [],
    );
  }
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
