import 'package:equatable/equatable.dart';

enum AppStatus { none, ok }

class AppInfo extends Equatable {
  final AppStatus? status;
  final bool skipGettingStarted;

  const AppInfo({this.status, this.skipGettingStarted = false});

  AppInfo copyWith(AppStatus? status, bool? skipGettingStarted) {
    return AppInfo(status: status ?? this.status, skipGettingStarted: skipGettingStarted ?? this.skipGettingStarted);
  }

  @override
  List<Object?> get props => [status, skipGettingStarted];
}
