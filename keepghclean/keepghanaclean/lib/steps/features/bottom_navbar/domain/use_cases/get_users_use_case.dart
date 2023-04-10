import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';

import '../../../../core/data/error/failures/application_failure.dart';
import '../../../../core/data/models/user_model.dart';
import '../../../../core/domain/use_cases/use_case.dart';
import '../repositories/bottom_navbar_repository.dart';

@injectable
class GetUsersUseCase extends UseCase<
    Future<Either<Failure, Stream<List<UserModel>>>>, NoParams> {
  final BottomNavbarRepository _bottomNavbarRepository;

  GetUsersUseCase(this._bottomNavbarRepository);

  @override
  Future<Either<Failure, Stream<List<UserModel>>>> call(
          NoParams params) async =>
      await _bottomNavbarRepository.usersStream();
}
