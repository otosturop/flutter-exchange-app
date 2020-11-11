import 'package:dovizhesaplayici/blocs/exchange/exchange_bloc.dart';
import 'package:dovizhesaplayici/blocs/gold/gold_bloc.dart';
import 'package:dovizhesaplayici/blocs/money/money_bloc.dart';
import 'package:dovizhesaplayici/locator.dart';
import 'package:dovizhesaplayici/screen/Exchange.dart';
import 'package:dovizhesaplayici/screen/Gold.dart';
import 'package:dovizhesaplayici/screen/Money.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Döviz Çevirici',
      theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.grey, //circularIndicator
          primaryColor: Colors.blueGrey),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<MoneyBloc>(
            create: (context) => MoneyBloc()
          ),
          BlocProvider<GoldBloc>(
            create: (context) => GoldBloc(),
          ),
          BlocProvider<ExchangeBloc>(
            create: (context) => ExchangeBloc(),
          )
        ],
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  List<Widget> allPages;
  Exchange pageExchange;
  Money pageMoney;
  Gold pageGold;
  GlobalKey bottomNavigationKey = GlobalKey();
  String _title;

  @override
  void initState() {
    super.initState();
    pageExchange = Exchange();
    pageGold = Gold();
    pageMoney = Money();
    allPages = [pageMoney, pageExchange, pageGold];
    _title = 'Döviz Kurları';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_title),
          centerTitle: true,
        ),
        body: allPages[_selectedIndex],
        bottomNavigationBar: FancyBottomNavigation(
          textColor: Colors.grey,
          tabs: [
            TabData(iconData: FontAwesomeIcons.moneyBillWave, title: "Döviz"),
            TabData(iconData: FontAwesomeIcons.exchangeAlt, title: "Kur Hesaplama"),
            TabData(iconData: FontAwesomeIcons.coins, title: "Altın"),
          ],
          onTabChangedListener: (position) {
            setState(() {
              _selectedIndex = position;
              switch(_selectedIndex) {
                case 0: { _title = 'Döviz Kurları'; }
                break;
                case 1: { _title = 'Kur Hesapları'; }
                break;
                case 2: { _title = 'Altın Kurları'; }
                break;
              }

            });
          },
        ),
      );
  }
}
