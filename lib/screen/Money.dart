import 'package:dovizhesaplayici/blocs/money/money_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Money extends StatefulWidget {
  @override
  _MoneyState createState() => _MoneyState();
}

class _MoneyState extends State<Money> {

  @override
  void initState() {
    super.initState();
    //BlocProvider.of<MoneyBloc>(context).add(FetchMoneyEvent());
    context.bloc<MoneyBloc>().add(FetchMoneyEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoneyBloc, MoneyState>(
      builder: (context, state) {
        if(state is MoneyInitial || state is MoneyLoadInProgress) {
          return Center(child: CircularProgressIndicator(),);
        } else if(state is MoneyLoadSuccess) {
          return ListView(
            padding: EdgeInsets.all(10.0),
            children: <Widget>[
              cardStyleWidget(
                state.exchange.sign['USD'],
                state.exchange.rates['USD'],
                "Dolar: ",
                state.exchange.currency["USD"].buy,
                state.exchange.currency["USD"].sell,
              ),
              cardStyleWidget(
                state.exchange.sign['EUR'],
                state.exchange.rates['EUR'],
                "Euro: ",
                state.exchange.currency["EUR"].buy,
                state.exchange.currency["EUR"].sell,
              ),
              cardStyleWidget(
                state.exchange.sign['GBP'],
                state.exchange.rates['GBP'],
                "İngiliz Sterlini: ",
                state.exchange.currency["GBP"].buy,
                state.exchange.currency["GBP"].sell,
              ),
              cardStyleWidget(
                state.exchange.sign['CHF'],
                state.exchange.rates['CHF'],
                "İsviçre Frangı: ",
                state.exchange.currency["CHF"].buy,
                state.exchange.currency["CHF"].sell,
              ),
              cardStyleWidget(
                state.exchange.sign['JPY'],
                state.exchange.rates['JPY'],
                "Japon Yeni: ",
                state.exchange.currency["JPY"].buy,
                state.exchange.currency["JPY"].sell,
              ),
              cardStyleWidget(
                state.exchange.sign['RUB'],
                state.exchange.rates['RUB'],
                "Rus Rublesi: ",
                state.exchange.currency["RUB"].buy,
                state.exchange.currency["RUB"].sell,
              ),
              cardStyleWidget(
                state.exchange.sign['CNY'],
                state.exchange.rates['CNY'],
                "Çin Yuanı: ",
                state.exchange.currency["CNY"].buy,
                state.exchange.currency["CNY"].sell,
              ),
              SizedBox(height: 20),
            ],
          );
        } else if(state is MoneyLoadFailure) {
          return Center(
            child: Text("Lütfen internet bağlantınızı kontrol ediniz!"),
          );
        } else {
          return Center(
            child: Text("Beklenmedik bir hata oldu lütfen geliştirici ile iletişime geçiniz."),
          );
        }
      }
    );
  }

  Card cardStyleWidget(sing, rates, money, buy, sell) {
    return Card(
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  sing + money,
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  rates.toString() + "%",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Montserrat',
                      color: rates >= 0 ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Alış",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  buy.toString(),
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Satış",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  sell.toString(),
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
