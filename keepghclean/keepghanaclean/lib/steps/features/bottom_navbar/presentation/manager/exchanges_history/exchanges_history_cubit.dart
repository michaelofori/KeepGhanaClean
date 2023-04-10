import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:injectable/injectable.dart';

import '../../../../../core/domain/use_cases/use_case.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/exchange_history_model.dart';
import '../../../domain/use_cases/get_exchanges_history_use_case.dart';
import 'exchanges_history_state.dart';

@injectable
class ExchangesHistoryCubit extends Cubit<ExchangesHistoryState> {
  final GetHistoryExchangesUseCase _getExchangesHistoryUseCase;
  late Stream<List<ExchangeHistoryModel>> _exchangesStream;

  ExchangesHistoryCubit(
    this._getExchangesHistoryUseCase,
  ) : super(const ExchangesHistoryState.initial());

  Future<void> getExchangesHistory() async {
    emit(const ExchangesHistoryState.loading());
    final result = await _getExchangesHistoryUseCase(NoParams());
    result.fold(
        (_) => emit(
            ExchangesHistoryState.error(message: S.current.somethingWentWrong)),
        (exchangesStream) {
      _exchangesStream = exchangesStream;
      _exchangesStream.listen(onExchangesReceived).onError(onExchangesError);
    });
  }

  void onExchangesReceived(List<ExchangeHistoryModel> exchanges) {
    debugPrint('Exchanges Length: ${exchanges.length}');
    emit(ExchangesHistoryState.loaded(exchanges: exchanges));
  }

  void onExchangesError(error) {
    debugPrint('onExchangesError: $error');
    emit(ExchangesHistoryState.error(message: S.current.somethingWentWrong));
  }
}
