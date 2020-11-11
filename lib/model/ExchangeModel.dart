// To parse this JSON data, do
//
//     final exchangeModel = exchangeModelFromJson(jsonString);

import 'dart:convert';

ExchangeModel exchangeModelFromJson(String str) => ExchangeModel.fromJson(json.decode(str));

String exchangeModelToJson(ExchangeModel data) => json.encode(data.toJson());

class ExchangeModel {
  ExchangeModel({
    this.currency,
    this.rates,
    this.sign,
  });

  Map<String, Currency> currency;
  Map<String, double> rates;
  Map<String, String> sign;

  factory ExchangeModel.fromJson(Map<String, dynamic> json) => ExchangeModel(
    currency: Map.from(json["currency"]).map((k, v) => MapEntry<String, Currency>(k, Currency.fromJson(v))),
    rates: Map.from(json["rates"]).map((k, v) => MapEntry<String, double>(k, v.toDouble())),
    sign: Map.from(json["sign"]).map((k, v) => MapEntry<String, String>(k, v.toString())),
  );

  Map<String, dynamic> toJson() => {
    "currency": Map.from(currency).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    "rates": Map.from(rates).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "sign": Map.from(sign).map((k, v) => MapEntry<String, dynamic>(k, v)),
  };
}

class Currency {
  Currency({
    this.buy,
    this.sell,
  });

  double buy;
  double sell;

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
    buy: json["buy"].toDouble(),
    sell: json["sell"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "buy": buy,
    "sell": sell,
  };
}
