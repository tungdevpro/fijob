import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String userId;
  final String? fullName;
  final String? email;

  const UserEntity({required this.userId, this.fullName, this.email});

  @override
  List<Object?> get props => [userId, fullName, email];
}
