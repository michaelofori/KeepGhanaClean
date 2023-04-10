import '../../../../core/data/data_sources/database.dart';
import '../../../../core/data/models/user_model.dart';
import '../../../../features/intro/domain/entities/user_entity.dart';

extension UserEntityToModelMapper on UserEntity {
  UserModel toModel() {
    return UserModel(
      uid: uid ?? documentIdFromLocalGenerator(),
      name: name,
    );
  }
}
