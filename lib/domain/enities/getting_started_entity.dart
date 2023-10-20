import 'package:equatable/equatable.dart';

class GettingStartedEntity extends Equatable {
  final String asset;
  final List<String> title;
  final String content;

  const GettingStartedEntity({required this.asset, required this.title, required this.content});

  @override
  List<Object?> get props => [asset, title, content];
}