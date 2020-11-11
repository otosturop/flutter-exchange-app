import 'package:dovizhesaplayici/blocs/gold/gold_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Gold extends StatefulWidget {
  @override
  _GoldState createState() => _GoldState();
}

class _GoldState extends State<Gold> {

  @override
  void initState() {
    super.initState();
    context.bloc<GoldBloc>().add(FetchGoldEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GoldBloc, GoldState>(
      builder: (context, state) {
        if(state is GoldInitial || state is GoldLoadInProgress) {
          return Center(child: CircularProgressIndicator(),);
        }  else if(state is GoldLoadSuccess) {
          return ListView(
            padding: const EdgeInsets.all(10.0),
            children: <Widget>[
              cardStyleWidget(state.gold.rates.grm, "Gram Altın ", state.gold.currency.grm.buy, state.gold.currency.grm.sell),
              cardStyleWidget(state.gold.rates.cyr, "Çeyrek Altın ", state.gold.currency.cyr.buy, state.gold.currency.cyr.sell),
              cardStyleWidget(state.gold.rates.yrm, "Yarım Altın ", state.gold.currency.yrm.buy, state.gold.currency.yrm.sell),
              cardStyleWidget(state.gold.rates.tam, "Tam Altın ", state.gold.currency.tam.buy, state.gold.currency.tam.sell),
              cardStyleWidget(state.gold.rates.res, "Reşat Altın ", state.gold.currency.res.buy, state.gold.currency.res.sell),
              cardStyleWidget(state.gold.rates.cum, "Cumhuriyet Altını ", state.gold.currency.cum.buy, state.gold.currency.cum.sell),
              SizedBox(height: 20),
            ],
          );
        } else if(state is GoldLoadFailure) {
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

  Card cardStyleWidget( rates, gold, buy, sell){
    return  Card(
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
                  gold,
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
