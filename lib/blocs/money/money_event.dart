part of 'money_bloc.dart';

abstract class MoneyEvent extends Equatable {
  const MoneyEvent();
}

class FetchMoneyEvent extends MoneyEvent {
  @override
  List<Object> get props => [];
}
