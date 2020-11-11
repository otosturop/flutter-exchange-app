part of 'money_bloc.dart';

abstract class MoneyState extends Equatable {
  const MoneyState();

  @override
  List<Object> get props => [];
}

class MoneyInitial extends MoneyState {}

class MoneyLoadInProgress extends MoneyState {}

class MoneyLoadSuccess extends MoneyState {
  final ExchangeModel exchange;
  MoneyLoadSuccess(this.exchange);

  @override
  List<Object> get props => [exchange];
}

class MoneyLoadFailure extends MoneyState {}

