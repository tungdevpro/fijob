import 'package:intl/intl.dart';

const String fullDateFormat = 'dd/MM/yyyy';

const String fullDateTimeFormat = 'dd/MM/yyyy HH:mm';

const String fileNameFormat = 'yyyyMMdd_HHmmss';

extension DateX on DateTime {
  String formatDate([String format = fullDateFormat]) {
    return DateFormat(format).format(this);
  }
}
