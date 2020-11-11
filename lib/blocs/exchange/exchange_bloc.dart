import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'exchange_event.dart';
part 'exchange_state.dart';

class ExchangeBloc extends Bloc<ExchangeEvent, ExchangeState> {
  ExchangeBloc() : super(
      ExchangeState(
        currency: "USD",
        moneySign: "₺",
        amount: 0.0,
        result: 0.0,
        amountText: TextEditingController(text: ""),
        flagPath: "images/flag/usd.png",
        countIconClick: 0
      )
  );

  @override
  Stream<ExchangeState> mapEventToState(ExchangeEvent event,) async* {
    //para birimini değiştiren select box
    if(event is ChangeDropdownSelectMoneyEvent) {
      yield ExchangeState(
        currency: event.selectMoney,
        moneySign: (state.countIconClick % 2 == 0) ? "₺" : event.sign[event.selectMoney],
        amountText: TextEditingController(text: ""),
        result: 0.0,
        flagPath: "images/flag/${event.selectMoney.toLowerCase()}.png",
        countIconClick: state.countIconClick
      );
    }
    //kur değerini hesaplama
    if(event is CalculateAmountEvent) {
      yield ExchangeState(
        currency: state.currency,
        moneySign: (state.countIconClick % 2 == 0) ? "₺" : event.sign[event.currencyText],
        result: (state.countIconClick % 2 == 0) ? event.amount * event.exchangeRate : event.amount / event.exchangeRate,
        flagPath: "images/flag/${event.currencyText.toLowerCase()}.png",
        countIconClick: state.countIconClick
      );
    }
    // yer değiştirme
    if(event is ExchangeButtonPressed) {
      yield ExchangeState(
        currency: state.currency,
        amountText: TextEditingController(text: ""),
        moneySign: (state.countIconClick % 2 == 0) ? event.sign[state.currency] : "₺",
        result: 0.0,
        countIconClick: state.countIconClick + 1,
        flagPath: "images/flag/${state.currency.toLowerCase()}.png"
      );
    }
  }
}
