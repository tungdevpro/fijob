import 'package:fijob/domain/enities/user_entity.dart';

class UserModel extends UserEntity {
  final String id;
  const UserModel({required this.id}) : super(userId: id);
}
