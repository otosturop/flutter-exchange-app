import 'package:dovizhesaplayici/data/gold/gold_api.dart';
import 'package:dovizhesaplayici/locator.dart';
import 'package:dovizhesaplayici/model/GoldModel.dart';

class GoldRepository {
  GoldApi goldApi = locator<GoldApi>();

  Future<GoldModel> getGolds() async {
    return await goldApi.getGolds();
  }
}