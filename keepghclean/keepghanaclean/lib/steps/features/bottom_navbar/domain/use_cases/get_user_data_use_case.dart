import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';

import '../../../../core/data/error/failures/application_failure.dart';
import '../../../../core/data/models/user_model.dart';
import '../../../../core/domain/use_cases/use_case.dart';
import '../repositories/bottom_navbar_repository.dart';

@injectable
class GetUserDataUseCase
    extends UseCase<Future<Either<Failure, Stream<UserModel>>>, NoParams> {
  final BottomNavbarRepository _bottomNavbarRepository;

  GetUserDataUseCase(this._bottomNavbarRepository);

  @override
  Future<Either<Failure, Stream<UserModel>>> call(NoParams params) async =>
      await _bottomNavbarRepository.getRealTimeUserData();
}
