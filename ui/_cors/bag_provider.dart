import 'package:flutter/material.dart';
import 'package:myapp/model/dish.dart';

///[BagProvider] é um [ChangeNotifier] responsável por manter o estado
///da sacola de compras(bag) e gerencia-la.
class BagProvider extends ChangeNotifier {
  ///[dishesOnBag] é a lista de pratos que estão na sacola de compras
  List<Dish> dishesOnBag = [];

  ///Adiciona uma lista de pratos na sacola
  addAllDishes(List<Dish> dishes) {
    dishesOnBag.addAll(dishes);
    notifyListeners();
  }

  ///Remove um prato da sacola
  removeDish(Dish dish) {
    dishesOnBag.remove(dish);
    notifyListeners();
  }

  ///Limpa a sacola
  clearBag() {
    dishesOnBag.clear();
    notifyListeners();
  }

  ///Retorna um [Map<Dish,int>] onde a chave é o [Dish]
  ///e o valor é a quantidade desse prato na sacola
  Map<Dish, int> getMapByAmount() {
    ///[mapResult] é o [Map] que será retornado
    Map<Dish, int> mapResult = {};

    ///Itera sobre todos os pratos na sacola
    for (Dish dish in dishesOnBag) {
      ///Se o prato ainda não está no mapResult, adiciona ele com o valor 1
      if (mapResult[dish] == null) {
        mapResult[dish] = 1;
      } else {
        mapResult[dish] = mapResult[dish]! + 1;
      }
    }
    return mapResult;
    ///Retorna o [Map<Dish,int>] com as quantidades
  }
}
