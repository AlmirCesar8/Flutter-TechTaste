import 'package:flutter/material.dart';
import 'package:myapp/model/restaurant.dart';
import '../../restaurant/restaurant_screen.dart';
/// Widget que representa um restaurante na tela de listagem.
class RestaurantWidget extends StatelessWidget {
  /// O restaurante a ser exibido.
  final Restaurant restaurant;
  /// Construtor do widget.
  const RestaurantWidget({super.key, required this.restaurant});

  @override
  /// Método que constrói o widget.
  Widget build(BuildContext context) {
    /// Widget que detecta toques.
    return InkWell(
      /// Ação ao ser tocado.
      onTap: () {
        /// Navega para a tela do restaurante.
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              /// Retorna a tela do restaurante passando o objeto do restaurante.
              return RestaurantScreen(restaurant: restaurant);
            },
          ),
        );
      },
      /// Linha com as informações do restaurante.
      child: Row(
        spacing: 12.0,
        children: [
          /// Imagem do restaurante.
          Image.asset('assets/${restaurant.imagePath}', width: 72),
          /// Coluna com as informações do restaurante.
          Column(
            /// Alinha o texto a esquerda
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Nome do restaurante em negrito.
              Text(
                restaurant.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
              /// Linha que renderiza as estrelas de avaliação.
              Row(
                /// Renderiza a quantide de estrelas, pegando a quantidade inteira do restaurant.stars
                children: List.generate(restaurant.stars.toInt(), (index) {
                  /// Renderiza a imagem da estrela.
                  return Image.asset('assets/others/star.png', width: 16);
                }),
              ),
              /// Distancia do restaurante.
              Text('${restaurant.distance}km'),
            ],
          ),
        ],
      ),
    );
  } 
}

