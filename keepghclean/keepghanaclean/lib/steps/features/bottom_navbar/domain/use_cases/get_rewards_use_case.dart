
import 'package:injectable/injectable.dart';

import '../../../../core/domain/use_cases/use_case.dart';
import '../../data/models/reward_model.dart';
import '../repositories/bottom_navbar_repository.dart';

@injectable
class GetRewardsUseCase extends UseCase<Stream<List<RewardModel>>, NoParams> {
  final BottomNavbarRepository _bottomNavbarRepository;

  GetRewardsUseCase(this._bottomNavbarRepository);

  @override
  Stream<List<RewardModel>> call(NoParams params) =>
      _bottomNavbarRepository.rewardsStream();
}
