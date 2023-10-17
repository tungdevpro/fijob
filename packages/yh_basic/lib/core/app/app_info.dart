import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

enum AppStatus { none, ok }

class AppInfo extends Equatable {
  final AppStatus? status;
  final bool skipGettingStarted;
  final Stream<ConnectivityResult>? connectivityStream;

  const AppInfo({this.status, this.skipGettingStarted = false, this.connectivityStream});

  AppInfo copyWith(AppStatus? status, bool? skipGettingStarted, Stream<ConnectivityResult>? connectivityStream) {
    return AppInfo(status: status ?? this.status, skipGettingStarted: skipGettingStarted ?? this.skipGettingStarted, connectivityStream: connectivityStream);
  }

  @override
  List<Object?> get props => [status, skipGettingStarted, connectivityStream];
}
