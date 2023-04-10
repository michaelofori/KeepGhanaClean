import '../../../../core/data/models/user_model.dart';
import '../../domain/entities/leaderboard_item_entity.dart';

extension UserModelToMapper on List<UserModel> {
  List<LeaderboardItemEntity> toEntity() => map((e) => LeaderboardItemEntity(
        uid: e.uid,
        name: e.name,
        stepsNumber: e.totalSteps,
        order: 0,
        healthPoints: e.healthPoints,
      )).toList();
}
