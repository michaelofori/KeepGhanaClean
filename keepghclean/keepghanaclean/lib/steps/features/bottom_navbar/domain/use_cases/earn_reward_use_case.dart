import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';

import '../../../../core/data/error/failures/application_failure.dart';
import '../../../../core/domain/use_cases/use_case.dart';
import '../../data/models/reward_model.dart';
import '../repositories/bottom_navbar_repository.dart';

@injectable
class EarnARewardUseCase
    extends UseCase<Future<Either<Failure, bool>>, RewardModel> {
  final BottomNavbarRepository _bottomNavbarRepository;

  EarnARewardUseCase(this._bottomNavbarRepository);

  @override
  Future<Either<Failure, bool>> call(RewardModel params) async =>
      await _bottomNavbarRepository.earnAReward(params);
}
