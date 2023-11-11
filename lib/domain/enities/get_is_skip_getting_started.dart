import 'package:fijob/core/lang/lang_keys.dart';
import 'package:yh_basic/domain/entities/has_displayable_failure.dart';
import 'package:easy_localization/easy_localization.dart';

class GetIsSkipGettingStartedFailure extends HasDisplayableFailure {
  final Object? cause;

  GetIsSkipGettingStartedFailure([this.cause]);

  @override
  DisplayableFailure displayableFailure() {
    return DisplayableFailure.commentError(LangKeys.errorCommon.tr());
  }

  @override
  String toString() => "GetIsSkipGettingStarted: $cause";
}