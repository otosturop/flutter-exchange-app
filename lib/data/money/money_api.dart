import 'dart:convert';
import 'package:dovizhesaplayici/model/ExchangeModel.dart';
import 'package:http/http.dart' as http;

class MoneyApi {
  static const baseUrl = "https://tranquil-tundra-90576.herokuapp.com/botdoviz.php";
  final http.Client httpClint = http.Client();

  Future<ExchangeModel> getExchange() async {
    final responseExchange = await httpClint.get(baseUrl);

    if (responseExchange.statusCode != 200) {
      throw Exception("Veri Getirilemedi");
    }

    final resJson = jsonDecode(responseExchange.body);
    return ExchangeModel.fromJson(resJson);
  }
}