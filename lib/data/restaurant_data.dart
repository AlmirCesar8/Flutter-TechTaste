import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/model/restaurant.dart';

/// [RestaurantData] é uma classe que extende [ChangeNotifier] e tem como função carregar os dados
/// dos restaurantes do arquivo json e atualizar a lista de restaurantes.
class RestaurantData extends ChangeNotifier {
  /// [listRestaurants] é uma lista de [Restaurant] que irá armazenar os dados dos restaurantes.
  List<Restaurant> listRestaurants = [];

  /// [getRestaurant] é um método assíncrono que carrega os dados dos restaurantes do arquivo json.
  Future<void> getRestaurant() async {
    /// [jsonString] carrega o conteúdo do arquivo json.
    String jsonString = await rootBundle.loadString("assets/data.json");

    /// [data] decodifica o json carregado em um Map.
    Map<String, dynamic> data = json.decode(jsonString);

    /// [restaurantsData] é uma lista dinâmica que contém os dados dos restaurantes.
    List<dynamic> restaurantsData = data['restaurants'];

    /// Itera sobre cada item em [restaurantsData].
    for (var restaurantData in restaurantsData) {
      /// Cria um objeto [Restaurant] usando o método [fromMap].
      Restaurant restaurant = Restaurant.fromMap(restaurantData);

      /// Adiciona o restaurante à lista [listRestaurants].
      listRestaurants.add(restaurant);
    }
    /// Notifica os ouvintes sobre a mudança nos dados.
    notifyListeners();
  }
}
