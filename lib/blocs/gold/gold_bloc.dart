import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dovizhesaplayici/data/gold/gold_repository.dart';
import 'package:dovizhesaplayici/locator.dart';
import 'package:dovizhesaplayici/model/GoldModel.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'gold_event.dart';
part 'gold_state.dart';

class GoldBloc extends Bloc<GoldEvent, GoldState> {
  final GoldRepository goldRepo = locator<GoldRepository>();

  GoldBloc() : super(GoldInitial());

  @override
  Stream<GoldState> mapEventToState(
    GoldEvent event,
  ) async* {
    if(event is FetchGoldEvent) {
      yield GoldLoadInProgress();
      try {
        final GoldModel getGolds = await goldRepo.getGolds();
        yield GoldLoadSuccess(gold: getGolds);
      }catch(_) {
        yield GoldLoadFailure();
      }
    }
  }
}
