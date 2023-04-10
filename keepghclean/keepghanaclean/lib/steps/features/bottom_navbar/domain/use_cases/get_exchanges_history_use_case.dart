import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';

import '../../../../core/data/error/failures/application_failure.dart';
import '../../../../core/domain/use_cases/use_case.dart';
import '../../data/models/exchange_history_model.dart';
import '../repositories/bottom_navbar_repository.dart';

@injectable
class GetHistoryExchangesUseCase extends UseCase<
    Future<Either<Failure, Stream<List<ExchangeHistoryModel>>>>, NoParams> {
  final BottomNavbarRepository _bottomNavbarRepository;

  GetHistoryExchangesUseCase(this._bottomNavbarRepository);

  @override
  Future<Either<Failure, Stream<List<ExchangeHistoryModel>>>> call(
          NoParams params) async =>
      await _bottomNavbarRepository.exchangesHistoryStream();
}
