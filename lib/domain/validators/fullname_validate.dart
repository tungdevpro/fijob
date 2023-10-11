import 'package:formz/formz.dart';

enum FullNameValidationError { empty, invalid }

class FullNameValidateModel
    extends FormzInput<String, FullNameValidationError?> {
  const FullNameValidateModel.pure() : super.pure('');
  const FullNameValidateModel.dirty([super.value = '']) : super.dirty();

  static final RegExp numericRegExp = RegExp(r'^-?\d+(\.\d+)?$');

  // @override
  // String? validator(String value) {
  //   if(value.trim().isEmpty) return "Fullname is empty";
  //   if(numericRegExp.hasMatch(value)) return FullNameValidationError.invalid;
  //   return null;
  // }

  @override
  FullNameValidationError? validator(String value) {
    if (value.trim().isEmpty) return FullNameValidationError.empty;
    if (numericRegExp.hasMatch(value)) return FullNameValidationError.invalid;
    return null;
  }
}

extension StringFullNameValidationError on FullNameValidationError {
  String? toValue() {
    if (FullNameValidationError.empty == this) return 'Fullname is empty';
    if (FullNameValidationError.invalid == this) {
      return 'Fullname cannot be a number';
    }
    return null;
  }
}
