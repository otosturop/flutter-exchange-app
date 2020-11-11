part of 'exchange_bloc.dart';

class ExchangeState extends Equatable {
  final String currency, moneySign, flagPath;
  final double amount, result;
  final int countIconClick;
  final List<DropdownMenuItem<String>> moneys= [
    new DropdownMenuItem(
      child: new Text('Dolar'),
      value: "USD",
    ),
    new DropdownMenuItem(
      child: new Text('Euro'),
      value: "EUR",
    ),
    new DropdownMenuItem(
      child: new Text('İngiliz Sterlini'),
      value: "GBP",
    ),
    new DropdownMenuItem(
      child: new Text('İsviçre Frangı'),
      value: "CHF",
    ),
    new DropdownMenuItem(
      child: new Text('Japon Yeni'),
      value: "JPY",
    ),
    new DropdownMenuItem(
      child: new Text('Rus Rublesi'),
      value: "RUB",
    ),
    new DropdownMenuItem(
      child: new Text('Çin Yuanı'),
      value: "CNY",
    ),
  ];
  final TextEditingController amountText;
  ExchangeState({this.currency, this.moneySign, this.amount, this.result, this.amountText, this.flagPath, this.countIconClick});
  @override
  List<Object> get props => [currency, moneySign, flagPath, amount, result, countIconClick, amountText, moneys];
}
