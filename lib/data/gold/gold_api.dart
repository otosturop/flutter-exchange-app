import 'dart:convert';
import 'package:dovizhesaplayici/model/GoldModel.dart';
import 'package:http/http.dart' as http;

class GoldApi {
  static const baseUrl = "***";
  final http.Client httpClient = http.Client();

  Future<GoldModel> getGolds() async {
    final responseGolds = await httpClient.get(baseUrl);

    if(responseGolds.statusCode != 200) {
      throw Exception("Veri Getirilemedi");
    }

    final resJson = jsonDecode(responseGolds.body);
    return GoldModel.fromJson(resJson);
  }
}
