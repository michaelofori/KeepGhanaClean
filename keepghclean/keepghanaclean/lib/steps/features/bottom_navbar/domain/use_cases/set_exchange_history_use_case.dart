import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';

import '../../../../core/data/error/failures/application_failure.dart';
import '../../../../core/domain/use_cases/use_case.dart';
import '../../data/models/exchange_history_model.dart';
import '../repositories/bottom_navbar_repository.dart';

@injectable
class SetExchangeHistoryUseCase
    extends UseCase<Future<Either<Failure, bool>>, ExchangeHistoryModel> {
  final BottomNavbarRepository _bottomNavbarRepository;

  SetExchangeHistoryUseCase(this._bottomNavbarRepository);

  @override
  Future<Either<Failure, bool>> call(ExchangeHistoryModel params) async =>
      await _bottomNavbarRepository.setExchangeHistory(params);
}
