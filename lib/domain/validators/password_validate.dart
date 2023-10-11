import 'package:formz/formz.dart';

enum PasswordValidationError { empty, invalid }

class PasswordValidateModel extends FormzInput<String, String?> {
  const PasswordValidateModel.pure() : super.pure('');
  const PasswordValidateModel.dirty([super.value = '']) : super.dirty();

  @override
  String? validator(String value) {
    if (value.trim() == '') return 'Password is empty';
    if (value.trim().length < 6) return 'Password too short';

    return null;
  }
}
