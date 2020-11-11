part of 'exchange_bloc.dart';

abstract class ExchangeEvent extends Equatable {
  const ExchangeEvent();
}

class ChangeDropdownSelectMoneyEvent extends ExchangeEvent {
  final String selectMoney;
  ChangeDropdownSelectMoneyEvent(this.selectMoney, this.sign);
  final sign;

  @override
  List<Object> get props => [selectMoney, sign];
}

class CalculateAmountEvent extends ExchangeEvent {
  final double amount, exchangeRate;
  final String currencyText;
  final sign;
  CalculateAmountEvent(this.amount, this.exchangeRate, this.currencyText, this.sign);

  @override
  List<Object> get props => [amount];
}

class ExchangeButtonPressed extends ExchangeEvent {
  final sign;
  ExchangeButtonPressed(this.sign);

  @override
  List<Object> get props => [sign];
}