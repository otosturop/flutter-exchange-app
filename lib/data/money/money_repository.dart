import 'package:dovizhesaplayici/data/money/money_api.dart';
import 'package:dovizhesaplayici/locator.dart';
import 'package:dovizhesaplayici/model/ExchangeModel.dart';

class MoneyRepository {
  MoneyApi moneyApi = locator<MoneyApi>();

  Future<ExchangeModel> getExchange() async {
    return await moneyApi.getExchange();
  }
}