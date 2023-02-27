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

  /// `Menu - {restaurantName}`
  String restaurantTitle(Object placeholders, Object restaurantName) {
    return Intl.message(
      'Menu - $restaurantName',
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

  /// `Recommended`
  String get recommendedTitle {
    return Intl.message(
      'Recommended',
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

  /// `Name`
  String get labelName {
    return Intl.message(
      'Name',
      name: 'labelName',
      desc: '',
      args: [],
    );
  }

  /// `E-mail`
  String get labelEmail {
    return Intl.message(
      'E-mail',
      name: 'labelEmail',
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

  /// `{meal, select, ALL{All} SANDWICHES{Sandwich} DRINKS{Drinks} CANDIES{Candies} PLATES{Dishes} PORTIONS{Portions} PASTAS{Pastas} SNACKS{Snacks} SALADS{Salads} other{Other}}`
  String mealNameSchema(Object meal) {
    return Intl.select(
      meal,
      {
        'ALL': 'All',
        'SANDWICHES': 'Sandwich',
        'DRINKS': 'Drinks',
        'CANDIES': 'Candies',
        'PLATES': 'Dishes',
        'PORTIONS': 'Portions',
        'PASTAS': 'Pastas',
        'SNACKS': 'Snacks',
        'SALADS': 'Salads',
        'other': 'Other',
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

  /// `{prepareTime} min`
  String mealPrepareTimeMinutes(Object placeholders, Object prepareTime) {
    return Intl.message(
      '$prepareTime min',
      name: 'mealPrepareTimeMinutes',
      desc: '',
      args: [placeholders, prepareTime],
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

  /// `{schema, select, limitExceeded{Too many attempts in a row, try again later.} signedOut{Incorrect email or password.} notAuthorized{Unconfirmed email, confirm it.} userNotConfirmed{Unconfirmed email, confirm it.} userNotFound{Incorrect email or password or email not registered.} other{Something went wrong while logging in, please try again later.}}`
  String loginErrorsSchema(Object schema) {
    return Intl.select(
      schema,
      {
        'limitExceeded': 'Too many attempts in a row, try again later.',
        'signedOut': 'Incorrect email or password.',
        'notAuthorized': 'Unconfirmed email, confirm it.',
        'userNotConfirmed': 'Unconfirmed email, confirm it.',
        'userNotFound': 'Incorrect email or password or email not registered.',
        'other':
            'Something went wrong while logging in, please try again later.',
      },
      name: 'loginErrorsSchema',
      desc: '',
      args: [schema],
    );
  }

  /// `{schema, select, limitExceeded{Too many attempts in a row, try again later.} usernameExists{There is already an account with this email.} invalidParameter{Some field filled in incorrectly.} internalError{We are experiencing internal issues, please try again later.} other{There was an error trying to register, please try again later.}}`
  String registerErrorsSchema(Object schema) {
    return Intl.select(
      schema,
      {
        'limitExceeded': 'Too many attempts in a row, try again later.',
        'usernameExists': 'There is already an account with this email.',
        'invalidParameter': 'Some field filled in incorrectly.',
        'internalError':
            'We are experiencing internal issues, please try again later.',
        'other':
            'There was an error trying to register, please try again later.',
      },
      name: 'registerErrorsSchema',
      desc: '',
      args: [schema],
    );
  }

  /// `{schema, select, limitExceeded{Too many attempts in a row, try again later.} invalidParameter{Email probably already confirmed.} tooManyFailedAttempts{Looks like you tried the code wrong too many times, get in touch.} userNotFound{We couldn't find this registered email.} internalError{We are experiencing internal issues, please try again later.} codeMismatch{Code provided is wrong, please try again.} other{An error occurred while confirming email.}}`
  String emailConfirmationErrorsSchema(Object schema) {
    return Intl.select(
      schema,
      {
        'limitExceeded': 'Too many attempts in a row, try again later.',
        'invalidParameter': 'Email probably already confirmed.',
        'tooManyFailedAttempts':
            'Looks like you tried the code wrong too many times, get in touch.',
        'userNotFound': 'We couldn\'t find this registered email.',
        'internalError':
            'We are experiencing internal issues, please try again later.',
        'codeMismatch': 'Code provided is wrong, please try again.',
        'other': 'An error occurred while confirming email.',
      },
      name: 'emailConfirmationErrorsSchema',
      desc: '',
      args: [schema],
    );
  }

  /// `{schema, select, limitExceeded{Too many attempts in a row, try again later.} internalError{We are experiencing internal issues, please try again later.} other{Error trying to log out, please try again later.}}`
  String logoutErrorsSchema(Object schema) {
    return Intl.select(
      schema,
      {
        'limitExceeded': 'Too many attempts in a row, try again later.',
        'internalError':
            'We are experiencing internal issues, please try again later.',
        'other': 'Error trying to log out, please try again later.',
      },
      name: 'logoutErrorsSchema',
      desc: '',
      args: [schema],
    );
  }

  /// `{schema, select, limitExceeded{Too many attempts in a row, try again later.} userNotConfirmed{Unconfirmed email, confirm it.} userNotFound{Email not found, make sure you have registered.} invalidParameter{Unconfirmed email, confirm it before changing password.} internalError{We are experiencing internal issues, please try again later.} other{Error trying to reset password, try again later. }}`
  String forgotPasswordErrorsSchema(Object schema) {
    return Intl.select(
      schema,
      {
        'limitExceeded': 'Too many attempts in a row, try again later.',
        'userNotConfirmed': 'Unconfirmed email, confirm it.',
        'userNotFound': 'Email not found, make sure you have registered.',
        'invalidParameter':
            'Unconfirmed email, confirm it before changing password.',
        'internalError':
            'We are experiencing internal issues, please try again later.',
        'other': 'Error trying to reset password, try again later. ',
      },
      name: 'forgotPasswordErrorsSchema',
      desc: '',
      args: [schema],
    );
  }

  /// `{schema, select, limitExceeded{Too many attempts in a row, try again later.} codeMismatch{Code provided is wrong, please try again.} userNotConfirmed{Unconfirmed email, confirm it.} internalError{We are experiencing internal issues, please try again later.} other{Error when trying to change password, try again later.}}`
  String confirmResetPasswordErrorsSchema(Object schema) {
    return Intl.select(
      schema,
      {
        'limitExceeded': 'Too many attempts in a row, try again later.',
        'codeMismatch': 'Code provided is wrong, please try again.',
        'userNotConfirmed': 'Unconfirmed email, confirm it.',
        'internalError':
            'We are experiencing internal issues, please try again later.',
        'other': 'Error when trying to change password, try again later.',
      },
      name: 'confirmResetPasswordErrorsSchema',
      desc: '',
      args: [schema],
    );
  }

  /// `{schema, select, invalidParameter{Email probably already confirmed.} userNotFound{Email not found, make sure you have registered.} limitExceeded{Too many attempts in a row, try again later.} internalError{We are experiencing internal issues, please try again later.} codeDeliveryFailure{Failed to send code to email, please try again.} other{Error trying to send code, please try again later.}}`
  String resendCodeErrorsSchema(Object schema) {
    return Intl.select(
      schema,
      {
        'invalidParameter': 'Email probably already confirmed.',
        'userNotFound': 'Email not found, make sure you have registered.',
        'limitExceeded': 'Too many attempts in a row, try again later.',
        'internalError':
            'We are experiencing internal issues, please try again later.',
        'codeDeliveryFailure':
            'Failed to send code to email, please try again.',
        'other': 'Error trying to send code, please try again later.',
      },
      name: 'resendCodeErrorsSchema',
      desc: '',
      args: [schema],
    );
  }

  /// `{schema, select, limitExceeded{Too many attempts in a row, try again later.} signedOut{Incorrect email or password.} notAuthorized{Unconfirmed email, confirm it.} userNotConfirmed{Unconfirmed email, confirm it.} userNotFound{Incorrect email or password or email not registered.} other{Error when trying to get user attributes.}}`
  String getUserAtribbutesErrorsSchema(Object schema) {
    return Intl.select(
      schema,
      {
        'limitExceeded': 'Too many attempts in a row, try again later.',
        'signedOut': 'Incorrect email or password.',
        'notAuthorized': 'Unconfirmed email, confirm it.',
        'userNotConfirmed': 'Unconfirmed email, confirm it.',
        'userNotFound': 'Incorrect email or password or email not registered.',
        'other': 'Error when trying to get user attributes.',
      },
      name: 'getUserAtribbutesErrorsSchema',
      desc: '',
      args: [schema],
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
