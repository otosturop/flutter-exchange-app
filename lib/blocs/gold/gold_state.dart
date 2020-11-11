part of 'gold_bloc.dart';

abstract class GoldState extends Equatable {
  const GoldState();

  @override
  List<Object> get props => [];
}

class GoldInitial extends GoldState {}


class GoldLoadInProgress extends GoldState {}

class GoldLoadSuccess extends GoldState {
  final GoldModel gold;

  GoldLoadSuccess({@required this.gold}) : assert(gold != null);

  @override
  List<Object> get props => [gold];
}

class GoldLoadFailure extends GoldState {}

