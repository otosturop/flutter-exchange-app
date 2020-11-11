import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dovizhesaplayici/data/money/money_repository.dart';
import 'package:dovizhesaplayici/locator.dart';
import 'package:dovizhesaplayici/model/ExchangeModel.dart';
import 'package:equatable/equatable.dart';

part 'money_event.dart';
part 'money_state.dart';

class MoneyBloc extends Bloc<MoneyEvent, MoneyState> {
  final MoneyRepository moneyRepo = locator<MoneyRepository>();

  MoneyBloc() : super(MoneyInitial());

  @override
  Stream<MoneyState> mapEventToState(MoneyEvent event) async* {
    if(event is FetchMoneyEvent) {
      yield MoneyLoadInProgress();
      try {
        final ExchangeModel getExchange = await moneyRepo.getExchange();
        yield MoneyLoadSuccess(getExchange);
      }catch(_) {
        yield MoneyLoadFailure();
      }
    }
  }
}
