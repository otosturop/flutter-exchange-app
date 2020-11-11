part of 'gold_bloc.dart';

abstract class GoldEvent extends Equatable {
  const GoldEvent();
}

class FetchGoldEvent extends GoldEvent {
  @override
  List<Object> get props => [];
}