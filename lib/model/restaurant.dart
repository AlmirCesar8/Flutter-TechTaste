import 'package:myapp/model/dish.dart';

/// Classe que representa um restaurante.
class Restaurant {
  /// ID do restaurante.
  String id;
  /// Caminho da imagem do restaurante.
  String imagePath;
  /// Nome do restaurante.
  String name;
  /// Descrição do restaurante.
  String description;
  /// Avaliação em estrelas do restaurante.
  double stars;
  /// Distância do restaurante.
  int distance;
  /// Lista de categorias do restaurante.
  List<String> categories;
  /// Lista de pratos do restaurante.
  List<Dish> dishes;

  /// Construtor da classe [Restaurant].
  Restaurant({
    required this.id, // ID obrigatório do restaurante
    required this.imagePath, // Caminho da imagem obrigatório
    required this.name, // Nome obrigatório
    required this.description, // Descrição obrigatória
    required this.stars, // Estrelas obrigatórias
    required this.distance, // Distância obrigatória
    required this.categories, // Categorias obrigatórias
    required this.dishes, // Pratos obrigatórios
  });

  /// Método que converte o objeto [Restaurant] em um mapa.
  ///
  /// Útil para serializar o objeto para JSON, por exemplo.
  Map<String, dynamic> toMap() {
    return {
      'id': id, // ID do restaurante
      'image': imagePath, // Caminho da imagem do restaurante
      'name': name, // Nome do restaurante
      'description': description, // Descrição do restaurante
      'stars': stars, // Avaliação em estrelas do restaurante
      'distance': distance, // Distância do restaurante
      'categories': categories, // Lista de categorias do restaurante
      'dishes': dishes.map((dish) => dish.toMap()).toList(), // Lista de pratos convertida para mapa
    };
  }

  /// Método de fábrica que cria um objeto [Restaurant] a partir de um mapa.
  ///
  /// Útil para desserializar JSON, por exemplo.
  factory Restaurant.fromMap(Map<String, dynamic> map) {
    return Restaurant(
      id: map['id'],
      imagePath: map['imagePath'],
      name: map['name'],
      description: map['description'],
      stars: map['stars'],
      distance: map['distance'],
      categories: List<String>.from(map['categories']),
      dishes: List<Dish>.from(
          map['dishes'].map((dish) => Dish.fromMap(dish))),
    );
  }

  /// Retorna uma representação em string do objeto [Restaurant].
  ///
  /// Útil para depuração.
  @override
  String toString() {
    return 'Restaurant(id: $id, imagePath: $imagePath, name: $name, description: $description, stars: $stars, distance: $distance);';
  }
}
