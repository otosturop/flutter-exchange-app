import 'package:dovizhesaplayici/admob_process.dart';
import 'package:dovizhesaplayici/blocs/exchange/exchange_bloc.dart';
import 'package:dovizhesaplayici/blocs/money/money_bloc.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Exchange extends StatefulWidget {
  @override
  _ExchangeState createState() => _ExchangeState();
}

class _ExchangeState extends State<Exchange> {

  InterstitialAd myInterstitialAd;

  @override
  void initState() {
    super.initState();
    myInterstitialAd = AdmobProcess.buildInterstitialAd();
    myInterstitialAd..load()..show();
  }

  @override
  void dispose() {
    myInterstitialAd.dispose();
    super.dispose();
  }

  Widget dropdownSelectMoney(moneys, currency) {
    return Expanded(
      child: Container(
        height: MediaQuery.of(context).size.height * 1 / 15,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.purple, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: DropdownButtonHideUnderline(
          child: BlocBuilder<MoneyBloc, MoneyState>(
            builder: (context, state) {
              if(state is MoneyLoadSuccess) {
                return DropdownButton<String>(
                  isExpanded: true,
                  items: moneys,
                  value: currency,
                  onChanged: (selectMoney) {
                    // debugPrint(selectMoney);
                    context.bloc<ExchangeBloc>().add(ChangeDropdownSelectMoneyEvent(selectMoney, state.exchange.sign));
                  },
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }
          ),
        ),
      ),
    );
  }

  Widget tlContainerBox() {
    return Container(
        height: MediaQuery.of(context).size.height * 1 / 15,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.purple, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Text(
          "Türk Parası",
          style: TextStyle(fontSize: 16),
        )
    );
  }

  Widget flagContainer(String flagPath) {
    return Expanded(child: Container(
      margin: EdgeInsets.all(10),
      child: Image.asset(flagPath),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExchangeBloc, ExchangeState>(
      builder: (context, state){
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
              child: ListView(
                children: <Widget>[
                  SizedBox(height: 10),
                  // miktar text input
                  BlocBuilder<MoneyBloc, MoneyState>(
                    builder: (context, blocMoneyState) {
                      if(blocMoneyState is MoneyLoadSuccess) {
                        return TextFormField(
                          keyboardType: TextInputType.number,
                          maxLength: 10,
                          autofocus: false,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.edit),
                            hintText: "Kur Miktarını Giriniz",
                            labelText: "Miktar",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                          ),
                          controller: state.amountText,
                          onChanged: (value) {
                            if (value.trim().isEmpty) {
                              value = "0";
                            }
                            getAmount(value, state.currency, blocMoneyState.exchange.currency, blocMoneyState.exchange.sign);
                          },
                        );
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    }

                  ),
                  SizedBox(height: 10),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blueGrey,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text("Sonuç:",
                              style: TextStyle(fontSize: 24, color: Colors.white)),
                          Text(state.result.toStringAsFixed(2) + " " + state.moneySign.toString(),
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500))
                        ],
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      // seleck dropdown input
                      state.countIconClick % 2 == 0 ? dropdownSelectMoney(state.moneys, state.currency) : tlContainerBox(),
                      // ortadaki küçük ok
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        margin: EdgeInsets.only(top: 10),
                        child: Icon(
                          FontAwesomeIcons.arrowCircleRight,
                          size: 24,
                        ),
                      ),
                      // sağ kenardaki türk parası
                      state.countIconClick % 2 == 0 ? tlContainerBox() : dropdownSelectMoney(state.moneys, state.currency),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      state.countIconClick % 2 == 0 ? flagContainer(state.flagPath) : flagContainer("images/flag/try.png"),
                      BlocBuilder<MoneyBloc, MoneyState>(
                        builder: (contex, state) {
                          if(state is MoneyLoadSuccess) {
                            return Container(
                              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                              margin: EdgeInsets.only(top: 10),
                              child: IconButton(
                                icon: Icon(
                                  FontAwesomeIcons.exchangeAlt,
                                  size: 28,
                                ),
                                onPressed: (){
                                  // debugPrint(state.currency.toString());
                                  context.bloc<ExchangeBloc>().add(ExchangeButtonPressed(state.exchange.sign));
                                },
                              ),
                            );
                          } else {
                            return Center(child: CircularProgressIndicator(),);
                          }
                        }
                      ),
                      state.countIconClick % 2 == 0 ? flagContainer("images/flag/try.png") : flagContainer(state.flagPath),
                    ],
                  ),
                ],
              )),
        );
      }
    );
  }

  void showToastMessage() {
    Fluttertoast.showToast(
        msg: "Lütfen sayısal bir ifade giriniz",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void getAmount(String val, currencyText, currency, sign) {
    if(isNumeric(val)) {
      context.bloc<ExchangeBloc>().add(CalculateAmountEvent(double.parse(val), double.parse( currency[currencyText].buy.toString()), currencyText, sign));
    } else {
      showToastMessage();
    }
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

}
