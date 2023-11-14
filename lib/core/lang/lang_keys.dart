import 'package:flutter/cupertino.dart';

@immutable
abstract class LangKeys {
  const LangKeys._();

  static const String loginLabel = 'login_label';
  static const String registerLabel = 'register_label';
  static const String registerLabel2 = 'register_label_2';
  static const String continueWith = 'continue_with';
  static const String googleLabel = 'google_label';
  static const String appleLabel = 'apple_label';
  static const String emailField = 'email';
  static const String emailFieldPlaceholder = 'email_placeholder';
  static const String btnWithEmail = 'btn_email';
  static const String hasAccount = 'has_account';
  static const List<String> termsCondition = ['By signing up you agree to our', 'Terms' , 'and', 'Conditions of Use'];
  static const String nextStepCompleteLabel = 'complete_label';
  static const String fullNameField = 'fullname';
  static const String fullNameFieldPlaceholder = 'fullname_placeholder';
  static const String passwordField = 'password';
  static const String passwordFieldPlaceholder = 'password_placeholder';

  // message error
  static const String errorCommon = 'error_common';
}
