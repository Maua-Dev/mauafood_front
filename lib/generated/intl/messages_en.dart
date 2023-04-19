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

  static String m0(schema) => "${Intl.select(schema, {
            'limitExceeded': 'Too many attempts in a row, try again later.',
            'codeMismatch': 'Code provided is wrong, please try again.',
            'userNotConfirmed': 'Unconfirmed email, confirm it.',
            'internalError':
                'We are experiencing internal issues, please try again later.',
            'other': 'Error when trying to change password, try again later.',
          })}";

  static String m1(schema) => "${Intl.select(schema, {
            'limitExceeded': 'Too many attempts in a row, try again later.',
            'invalidParameter': 'Email probably already confirmed.',
            'tooManyFailedAttempts':
                'Looks like you tried the code wrong too many times, get in touch.',
            'userNotFound': 'We couldn\'t find this registered email.',
            'internalError':
                'We are experiencing internal issues, please try again later.',
            'codeMismatch': 'Code provided is wrong, please try again.',
            'other': 'An error occurred while confirming email.',
          })}";

  static String m2(schema) => "${Intl.select(schema, {
            'limitExceeded': 'Too many attempts in a row, try again later.',
            'userNotConfirmed': 'Unconfirmed email, confirm it.',
            'userNotFound': 'Email not found, make sure you have registered.',
            'invalidParameter':
                'Unconfirmed email, confirm it before changing password.',
            'internalError':
                'We are experiencing internal issues, please try again later.',
            'other': 'Error trying to reset password, try again later. ',
          })}";

  static String m3(schema) => "${Intl.select(schema, {
            'limitExceeded': 'Too many attempts in a row, try again later.',
            'signedOut': 'Incorrect email or password.',
            'notAuthorized': 'Unconfirmed email, confirm it.',
            'userNotConfirmed': 'Unconfirmed email, confirm it.',
            'userNotFound':
                'Incorrect email or password or email not registered.',
            'other': 'Error when trying to get user attributes.',
          })}";

  static String m4(schema) => "${Intl.select(schema, {
            'limitExceeded': 'Too many attempts in a row, try again later.',
            'signedOut': 'Incorrect email or password.',
            'notAuthorized': 'Unconfirmed email, confirm it.',
            'userNotConfirmed': 'Unconfirmed email, confirm it.',
            'userNotFound':
                'Incorrect email or password or email not registered.',
            'other':
                'Something went wrong while logging in, please try again later.',
          })}";

  static String m5(schema) => "${Intl.select(schema, {
            'limitExceeded': 'Too many attempts in a row, try again later.',
            'internalError':
                'We are experiencing internal issues, please try again later.',
            'other': 'Error trying to log out, please try again later.',
          })}";

  static String m6(meal) => "${Intl.select(meal, {
            'ALL': 'All',
            'SANDWICHES': 'Sandwich',
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
          })}";

  static String m7(placeholders, prepareTime) => "${prepareTime} min";

  static String m8(amount) => "${amount} ";

  static String m9(notifications) => "${Intl.select(notifications, {
            'normalPart': 'Want to receive ',
            'email': 'email notifications',
            'app': 'app notifications',
            'other': '',
          })}";

  static String m10(schema) => "${Intl.select(schema, {
            'limitExceeded': 'Too many attempts in a row, try again later.',
            'usernameExists': 'There is already an account with this email.',
            'invalidParameter': 'Some field filled in incorrectly.',
            'internalError':
                'We are experiencing internal issues, please try again later.',
            'other':
                'There was an error trying to register, please try again later.',
          })}";

  static String m11(schema) => "${Intl.select(schema, {
            'invalidParameter': 'Email probably already confirmed.',
            'userNotFound': 'Email not found, make sure you have registered.',
            'limitExceeded': 'Too many attempts in a row, try again later.',
            'internalError':
                'We are experiencing internal issues, please try again later.',
            'codeDeliveryFailure':
                'Failed to send code to email, please try again.',
            'other': 'Error trying to send code, please try again later.',
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
            'hora_h': 'H Hour',
            'moleza': 'Cantina do Moleza',
            'other': '',
          })}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "appAcceptTerms": MessageLookupByLibrary.simpleMessage(
            "I read and accept the Terms of Use"),
        "appTitle": MessageLookupByLibrary.simpleMessage("Mauá Food"),
        "attentionTitle": MessageLookupByLibrary.simpleMessage("Attention"),
        "changePasswordTitle":
            MessageLookupByLibrary.simpleMessage("Change Password"),
        "codeErrorAlert":
            MessageLookupByLibrary.simpleMessage("Error with code."),
        "codeTitle": MessageLookupByLibrary.simpleMessage("Code"),
        "confirmEmailTitle":
            MessageLookupByLibrary.simpleMessage("Confirm your email"),
        "confirmNewPasswordTitle":
            MessageLookupByLibrary.simpleMessage("Confirm the new password"),
        "confirmPasswordTitle":
            MessageLookupByLibrary.simpleMessage("Confirm your password"),
        "confirmResetPasswordErrorsSchema": m0,
        "confirmTitle": MessageLookupByLibrary.simpleMessage("Confirm"),
        "confirmationCodeInstructionsTitle": MessageLookupByLibrary.simpleMessage(
            "Please enter your email, we will send you a verification code."),
        "correctFieldsInstructionsAlert": MessageLookupByLibrary.simpleMessage(
            "Make sure the fields are correct."),
        "cpfTitle": MessageLookupByLibrary.simpleMessage("CPF"),
        "disclaimerText": MessageLookupByLibrary.simpleMessage(
            "MauáFood works together with the restaurants to always be up to date, but we are not responsible for any difference between prices, availability and product information on the displayed menus.\nAny error found, please let us know by clicking the e-mail icon in the lower right corner of the screen!"),
        "doLoginTitle": MessageLookupByLibrary.simpleMessage("Login"),
        "emailConfirmationErrorsSchema": m1,
        "emailConfirmationTitle":
            MessageLookupByLibrary.simpleMessage("Email confirmation"),
        "emailTitle": MessageLookupByLibrary.simpleMessage("E-mail"),
        "enterTitle": MessageLookupByLibrary.simpleMessage("Enter"),
        "equalPasswordAlert":
            MessageLookupByLibrary.simpleMessage("Passwords must be the same."),
        "errorEmailOrPassword": MessageLookupByLibrary.simpleMessage(
            "Error with email or password."),
        "errorEmptyList": MessageLookupByLibrary.simpleMessage("Empty List."),
        "errorFields": MessageLookupByLibrary.simpleMessage(
            "Error with the inserted fields."),
        "errorGeneric":
            MessageLookupByLibrary.simpleMessage("Something went wrong!"),
        "errorItemNotFound":
            MessageLookupByLibrary.simpleMessage("No items found."),
        "fillFieldsInstructionsAlert": MessageLookupByLibrary.simpleMessage(
            "Make sure you fill in all the fields."),
        "forgotPasswordErrorsSchema": m2,
        "forgotPasswordTitle":
            MessageLookupByLibrary.simpleMessage("Forgot password?"),
        "fullNameTitle": MessageLookupByLibrary.simpleMessage("Full Name"),
        "getUserAtribbutesErrorsSchema": m3,
        "haveAccountTitle":
            MessageLookupByLibrary.simpleMessage("Already have an account?"),
        "havePasswordTitle":
            MessageLookupByLibrary.simpleMessage("Already have a password?"),
        "invalidCodeAlert":
            MessageLookupByLibrary.simpleMessage("Invalid code."),
        "invalidCpfAlert": MessageLookupByLibrary.simpleMessage("Invalid CPF."),
        "invalidEmailAlert":
            MessageLookupByLibrary.simpleMessage("Invalid email."),
        "invalidFullNameAlert":
            MessageLookupByLibrary.simpleMessage("Please enter the full name."),
        "invalidPasswordAlert":
            MessageLookupByLibrary.simpleMessage("Invalid password."),
        "labelMessage": MessageLookupByLibrary.simpleMessage("Message"),
        "labelName": MessageLookupByLibrary.simpleMessage("Full Name"),
        "labelSend": MessageLookupByLibrary.simpleMessage("Send now"),
        "loginErrorsSchema": m4,
        "loginTitle": MessageLookupByLibrary.simpleMessage("Login"),
        "logoutErrorsSchema": m5,
        "mealNameSchema": m6,
        "mealPrepareTimeMinutes": m7,
        "mealPriceCurrency": m8,
        "messageSentSuccessfully":
            MessageLookupByLibrary.simpleMessage("Email successfully sent!"),
        "newPasswordTitle":
            MessageLookupByLibrary.simpleMessage("New password"),
        "notificationsOptionsSchema": m9,
        "passwordInstructionsAlert": MessageLookupByLibrary.simpleMessage(
            "Your password must contain: \n - One or more uppercase letters \n - One or more lowercase letters \n - One or more numbers \n - One or more special characters\n(#, ?, !, @, \\\$, %, ^, &, *, -) \n - Minimum 8 characters"),
        "passwordTitle": MessageLookupByLibrary.simpleMessage("Password"),
        "questionMark": MessageLookupByLibrary.simpleMessage("?"),
        "recommendationsTitle":
            MessageLookupByLibrary.simpleMessage("Recommendations"),
        "recommendedTitle": MessageLookupByLibrary.simpleMessage("Recommended"),
        "registerEmailInstructionsTitle": MessageLookupByLibrary.simpleMessage(
            "To complete your registration, we will send you an email with a code, enter it in the field below."),
        "registerErrorsSchema": m10,
        "registerTitle": MessageLookupByLibrary.simpleMessage("Register"),
        "requiredFieldAlert":
            MessageLookupByLibrary.simpleMessage("Required field."),
        "resendCodeErrorsSchema": m11,
        "resendConfirmationCodeTitle":
            MessageLookupByLibrary.simpleMessage("Resend confirmation code"),
        "restaurantTitle": m12,
        "restaurantsImageSchema": m13,
        "restaurantsNameSchema": m14,
        "restaurantsTitle": MessageLookupByLibrary.simpleMessage("Restaurants"),
        "searchTitle": MessageLookupByLibrary.simpleMessage("Search"),
        "seeMenuTitle": MessageLookupByLibrary.simpleMessage("See menu"),
        "sendCodeEmailInstructionsTitle": MessageLookupByLibrary.simpleMessage(
            "We sent a confirmation code to your email, enter it in the field below."),
        "sendTitle": MessageLookupByLibrary.simpleMessage("Send"),
        "successChangePassword": MessageLookupByLibrary.simpleMessage(
            "Password changed successfully!"),
        "successConfirmEmail":
            MessageLookupByLibrary.simpleMessage("Email confirmed!"),
        "termsAcceptAlert": MessageLookupByLibrary.simpleMessage(
            "It is necessary to accept the Terms of Use."),
        "typeContact": MessageLookupByLibrary.simpleMessage("Contact us"),
        "typeEmailCorrectlyAlert": MessageLookupByLibrary.simpleMessage(
            "Make sure you typed email correctly."),
        "typeEmailPasswordAlert": MessageLookupByLibrary.simpleMessage(
            "Make sure you enter email and password."),
        "understoodTitle": MessageLookupByLibrary.simpleMessage("Understood!")
      };
}
