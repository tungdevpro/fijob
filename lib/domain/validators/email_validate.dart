import 'package:formz/formz.dart';

enum EmailValidationError { empty, invalid }

class EmailValidateModel extends FormzInput<String, String?> {
  const EmailValidateModel.pure() : super.pure('');
  const EmailValidateModel.dirty([super.value = '']) : super.dirty();

  static final _emailRegExp = RegExp(
    r'^[a-zA-Z\d.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z\d-]+(?:\.[a-zA-Z\d-]+)*$',
  );

  @override
  String? validator(String value) {
    if (value.trim().isEmpty) return "Email is empty";
    if (!_emailRegExp.hasMatch(value)) return "Email is invalid";
    return null;
  }
}
