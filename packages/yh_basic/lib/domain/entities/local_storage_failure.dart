import 'has_displayable_failure.dart';

enum LocalStorageFailureType { unknown }

class LocalStorageFailure implements HasDisplayableFailure {
  final Object? msg;
  final LocalStorageFailureType type;

  LocalStorageFailure.unknown([this.msg]) : type = LocalStorageFailureType.unknown;

  @override
  DisplayableFailure displayableFailure() {
    switch (type) {
      case LocalStorageFailureType.unknown:
        return DisplayableFailure.commentError("error not found");
    }
  }
}
