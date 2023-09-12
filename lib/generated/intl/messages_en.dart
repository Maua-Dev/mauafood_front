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
            'codeDeliveryFailure':
                'Failed to send code to email, please try again.',
            'codeMismatch': 'Code provided is wrong, please try again.',
            'invalidParameter': 'Email probably already confirmed.',
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
          })}";

  static String m1(placeholders, entityErrorMessage) =>
      "Field ${entityErrorMessage} is not valid";

  static String m2(placeholders, message) => "No items found for ${message}";

  static String m3(notifications) => "${Intl.select(notifications, {
            'normalPart': 'Want to receive ',
            'email': 'email notifications',
            'app': 'app notifications',
            'other': '',
          })}";

  static String m4(product) => "${Intl.select(product, {
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
          })}";

  static String m5(placeholders, prepareTime) => "${prepareTime} min";

  static String m6(amount) => "${amount} ";

  static String m7(name) => "${Intl.select(name, {
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
            'hora_h': 'H Hour',
            'cantina_do_moleza': 'Cantina do Moleza',
            'other': '',
          })}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "appAcceptTerms": MessageLookupByLibrary.simpleMessage(
            "I read and accept the Terms of Use"),
        "appTitle": MessageLookupByLibrary.simpleMessage("Mauá Food"),
        "applyTitle": MessageLookupByLibrary.simpleMessage("Apply"),
        "attentionTitle": MessageLookupByLibrary.simpleMessage("Attention"),
        "authErrorsSchema": m0,
        "biggestPriceTitle":
            MessageLookupByLibrary.simpleMessage("Biggest Price"),
        "cancelationTitle": MessageLookupByLibrary.simpleMessage("Cancel"),
        "cart": MessageLookupByLibrary.simpleMessage("Cesta"),
        "categoriesTitle": MessageLookupByLibrary.simpleMessage("Categories"),
        "categoryTitle": MessageLookupByLibrary.simpleMessage("Category"),
        "changePasswordTitle":
            MessageLookupByLibrary.simpleMessage("Change Password"),
        "cleanFilterTitle":
            MessageLookupByLibrary.simpleMessage("Clean filter"),
        "closeTitle": MessageLookupByLibrary.simpleMessage("Close"),
        "codeErrorAlert":
            MessageLookupByLibrary.simpleMessage("Error with code."),
        "codeTitle": MessageLookupByLibrary.simpleMessage("Code"),
        "confirmEmailTitle":
            MessageLookupByLibrary.simpleMessage("Confirm your email"),
        "confirmNewPasswordTitle":
            MessageLookupByLibrary.simpleMessage("Confirm the new password"),
        "confirmPasswordTitle":
            MessageLookupByLibrary.simpleMessage("Confirm your password"),
        "confirmTitle": MessageLookupByLibrary.simpleMessage("Confirm"),
        "confirmationCodeInstructionsTitle": MessageLookupByLibrary.simpleMessage(
            "Please enter your email, we will send you a verification code."),
        "contactError": MessageLookupByLibrary.simpleMessage(
            "Error sending message, please try again later."),
        "correctFieldsInstructionsAlert": MessageLookupByLibrary.simpleMessage(
            "Make sure the fields are correct."),
        "cpfTitle": MessageLookupByLibrary.simpleMessage("CPF"),
        "createProductTitle":
            MessageLookupByLibrary.simpleMessage("Create product"),
        "createTitle": MessageLookupByLibrary.simpleMessage("Create"),
        "customersView": MessageLookupByLibrary.simpleMessage("Customers view"),
        "dataStorageAlertTitle": MessageLookupByLibrary.simpleMessage(
            "If you confirm the sending of the message, you are agreeing that we store your name and e-mail so that we can have your feedback and, if necessary, respond to it."),
        "dataStorageTitle":
            MessageLookupByLibrary.simpleMessage("Data storage"),
        "deleteProductConfirmationTitle": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to delete the product?"),
        "deleteTitle": MessageLookupByLibrary.simpleMessage("Delete"),
        "descriptionTitle": MessageLookupByLibrary.simpleMessage("Description"),
        "disclaimerText": MessageLookupByLibrary.simpleMessage(
            "MauáFood works together with the restaurants to always be up to date, but we are not responsible for any difference between prices, availability and product information on the displayed menus.\nAny error found, please let us know by clicking the e-mail icon in the lower right corner of the screen!"),
        "doLoginTitle": MessageLookupByLibrary.simpleMessage("Login"),
        "editProductTitle":
            MessageLookupByLibrary.simpleMessage("Edit product"),
        "editTitle": MessageLookupByLibrary.simpleMessage("Edit"),
        "emailConfirmationTitle":
            MessageLookupByLibrary.simpleMessage("Email confirmation"),
        "emailTitle": MessageLookupByLibrary.simpleMessage("E-mail"),
        "emptyListErrorMessage": MessageLookupByLibrary.simpleMessage(
            "List is empty, no items found for this request"),
        "enterTitle": MessageLookupByLibrary.simpleMessage("Enter"),
        "entityErrorMessage": m1,
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
        "forgotPasswordTitle":
            MessageLookupByLibrary.simpleMessage("Forgot password?"),
        "fullNameTitle": MessageLookupByLibrary.simpleMessage("Full Name"),
        "haveAccountTitle":
            MessageLookupByLibrary.simpleMessage("Already have an account?"),
        "havePasswordTitle":
            MessageLookupByLibrary.simpleMessage("Already have a password?"),
        "help": MessageLookupByLibrary.simpleMessage("Help"),
        "home": MessageLookupByLibrary.simpleMessage("Home"),
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
        "loginTitle": MessageLookupByLibrary.simpleMessage("Login"),
        "lowestPriceTitle":
            MessageLookupByLibrary.simpleMessage("Lowest Price"),
        "messageSentError": MessageLookupByLibrary.simpleMessage(
            "Error sending email, please try again later."),
        "messageSentSuccessfully":
            MessageLookupByLibrary.simpleMessage("Email successfully sent!"),
        "minutesTitle": MessageLookupByLibrary.simpleMessage("minutes"),
        "nameTitle": MessageLookupByLibrary.simpleMessage("Name"),
        "newPasswordTitle":
            MessageLookupByLibrary.simpleMessage("New password"),
        "noItemsFoundErrorMessage": m2,
        "notificationsOptionsSchema": m3,
        "orders": MessageLookupByLibrary.simpleMessage("Orders"),
        "passwordInstructionsAlert": MessageLookupByLibrary.simpleMessage(
            "Your password must contain: \n - One or more uppercase letters \n - One or more lowercase letters \n - One or more numbers \n - One or more special characters\n(#, ?, !, @, \\\$, %, ^, &, *, -) \n - Minimum 8 characters"),
        "passwordTitle": MessageLookupByLibrary.simpleMessage("Password"),
        "photoTitle": MessageLookupByLibrary.simpleMessage("Photo"),
        "prepareTimeTitle":
            MessageLookupByLibrary.simpleMessage("Prepare Time"),
        "previewTitle": MessageLookupByLibrary.simpleMessage("Preview"),
        "priceOrder": MessageLookupByLibrary.simpleMessage("Price order"),
        "priceRangeOrder": MessageLookupByLibrary.simpleMessage("Price range"),
        "priceTitle": MessageLookupByLibrary.simpleMessage("Price"),
        "productAvailabilityTitle":
            MessageLookupByLibrary.simpleMessage("Product Availability"),
        "productNameSchema": m4,
        "productPrepareTimeMinutes": m5,
        "productPriceCurrency": m6,
        "productSuccessfullyCreatedTitle": MessageLookupByLibrary.simpleMessage(
            "Poduct successfully created."),
        "productSuccessfullyDeletedTitle": MessageLookupByLibrary.simpleMessage(
            "Product successfully deleted."),
        "productSuccessfullyEditedTitle": MessageLookupByLibrary.simpleMessage(
            "Product successfully edited."),
        "productToEnumSchema": m7,
        "profile": MessageLookupByLibrary.simpleMessage("Profile"),
        "profileErrorPictureMessage": MessageLookupByLibrary.simpleMessage(
            "An error ocurred while changing your profile picture"),
        "profileSuccessPictureMessage": MessageLookupByLibrary.simpleMessage(
            "Profile picture successfully updated"),
        "questionMark": MessageLookupByLibrary.simpleMessage("?"),
        "recommendationsTitle":
            MessageLookupByLibrary.simpleMessage("Recommendations"),
        "recommendedTitle":
            MessageLookupByLibrary.simpleMessage("More Options"),
        "registerEmailInstructionsTitle": MessageLookupByLibrary.simpleMessage(
            "To complete your registration, we will send you an email with a code, enter it in the field below."),
        "registerTitle": MessageLookupByLibrary.simpleMessage("Register"),
        "requestErrorMessage": m8,
        "requiredFieldAlert":
            MessageLookupByLibrary.simpleMessage("Required field."),
        "resendConfirmationCodeTitle":
            MessageLookupByLibrary.simpleMessage("Resend confirmation code"),
        "restaurantTitle": m9,
        "restaurantsImageSchema": m10,
        "restaurantsNameSchema": m11,
        "restaurantsTitle": MessageLookupByLibrary.simpleMessage("Restaurants"),
        "saveTitle": MessageLookupByLibrary.simpleMessage("Save"),
        "searchTitle": MessageLookupByLibrary.simpleMessage("Search"),
        "seeMenuTitle": MessageLookupByLibrary.simpleMessage("See menu"),
        "selectButton": MessageLookupByLibrary.simpleMessage("Select"),
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
