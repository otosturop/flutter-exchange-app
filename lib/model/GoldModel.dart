import 'dart:convert';

GoldModel goldModelFromJson(String str) => GoldModel.fromJson(json.decode(str));

String goldModelToJson(GoldModel data) => json.encode(data.toJson());

class GoldModel {
  GoldModel({
    this.currency,
    this.rates,
  });

  Currency currency;
  Rates rates;

  factory GoldModel.fromJson(Map<String, dynamic> json) => GoldModel(
    currency: Currency.fromJson(json["currency"]),
    rates: Rates.fromJson(json["rates"]),
  );

  Map<String, dynamic> toJson() => {
    "currency": currency.toJson(),
    "rates": rates.toJson(),
  };
}

class Currency {
  Currency({
    this.grm,
    this.cyr,
    this.yrm,
    this.tam,
    this.res,
    this.cum,
  });

  Cum grm;
  Cum cyr;
  Cum yrm;
  Cum tam;
  Cum res;
  Cum cum;

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
    grm: Cum.fromJson(json["GRM"]),
    cyr: Cum.fromJson(json["CYR"]),
    yrm: Cum.fromJson(json["YRM"]),
    tam: Cum.fromJson(json["TAM"]),
    res: Cum.fromJson(json["RES"]),
    cum: Cum.fromJson(json["CUM"]),
  );

  Map<String, dynamic> toJson() => {
    "GRM": grm.toJson(),
    "CYR": cyr.toJson(),
    "YRM": yrm.toJson(),
    "TAM": tam.toJson(),
    "RES": res.toJson(),
    "CUM": cum.toJson(),
  };
}

class Cum {
  Cum({
    this.buy,
    this.sell,
  });

  double buy;
  double sell;

  factory Cum.fromJson(Map<String, dynamic> json) => Cum(
    buy: json["buy"].toDouble(),
    sell: json["sell"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "buy": buy,
    "sell": sell,
  };
}

class Rates {
  Rates({
    this.grm,
    this.cyr,
    this.yrm,
    this.tam,
    this.res,
    this.cum,
  });

  double grm;
  double cyr;
  double yrm;
  double tam;
  double res;
  double cum;

  factory Rates.fromJson(Map<String, dynamic> json) => Rates(
    grm: json["GRM"].toDouble(),
    cyr: json["CYR"].toDouble(),
    yrm: json["YRM"].toDouble(),
    tam: json["TAM"].toDouble(),
    res: json["RES"].toDouble(),
    cum: json["CUM"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "GRM": grm,
    "CYR": cyr,
    "YRM": yrm,
    "TAM": tam,
    "RES": res,
    "CUM": cum,
  };
}
