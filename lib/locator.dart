import 'package:dovizhesaplayici/data/gold/gold_api.dart';
import 'package:dovizhesaplayici/data/gold/gold_repository.dart';
import 'package:dovizhesaplayici/data/money/money_api.dart';
import 'package:dovizhesaplayici/data/money/money_repository.dart';
import 'package:get_it/get_it.dart';

// This is our global ServiceLocator
GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<MoneyRepository>(() => MoneyRepository());
  locator.registerLazySingleton<MoneyApi>(() => MoneyApi());

  locator.registerLazySingleton<GoldRepository>(() => GoldRepository());
  locator.registerLazySingleton<GoldApi>(() => GoldApi());
}