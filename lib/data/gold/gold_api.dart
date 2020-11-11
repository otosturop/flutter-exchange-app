import 'dart:convert';
import 'package:dovizhesaplayici/model/GoldModel.dart';
import 'package:http/http.dart' as http;

class GoldApi {
  static const baseUrl = "https://tranquil-tundra-90576.herokuapp.com/botaltin.php";
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