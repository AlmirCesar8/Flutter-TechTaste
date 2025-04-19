import 'package:flutter/material.dart';
import 'package:myapp/model/dish.dart';
import 'package:myapp/model/restaurant.dart';
import 'package:provider/provider.dart';

import '../_cors/bag_provider.dart';
import '../_cors/widgets/appbar.dart';
/// Tela que exibe os detalhes de um restaurante, incluindo seu nome, descrição e pratos.
class RestaurantScreen extends StatelessWidget {
  /// O restaurante a ser exibido.
  final Restaurant restaurant;
  /// Construtor da tela do restaurante.
  const RestaurantScreen({super.key, required this.restaurant});

  @override
  /// Método que constrói a interface da tela.
  Widget build(BuildContext context) {
    /// Retorna a estrutura básica da tela, incluindo a barra de aplicativos e o corpo principal.
    return Scaffold(
      /// Define a barra de aplicativos (AppBar) com o nome do restaurante como título.
      appBar: getAppBar(context: context, title: restaurant.name),
      /// Define o corpo da tela com um preenchimento horizontal de 8 pixels.
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        /// Permite que o conteúdo role, caso seja muito longo.
        child: SingleChildScrollView(
          /// Organiza os widgets na tela em uma coluna.
          child: Column(
            spacing: 12.0,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Exibe a imagem do restaurante no centro da tela.
              Center(
                child: Image.asset(
                  'assets/${restaurant.imagePath}',
                  width: 135,
                ),
              ),
              /// Exibe o nome do restaurante centralizado e em negrito.
              Center(
                child: Text(
                  restaurant.name,
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
              ),
              /// Exibe a descrição do restaurante.
              Text(restaurant.description, style: TextStyle(fontSize: 19.0)),
              /// Exibe o texto "Mais pedidos" em negrito.
              Text(
                "Mais pedidos",
                style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold),
              ),
              /// Exibe uma coluna de pratos do restaurante.
              Column(
                /// Gera uma lista de widgets com base na lista de pratos do restaurante.
                children: List.generate(restaurant.dishes.length, (index) {
                  /// Obtém o prato atual da lista de pratos.
                  Dish dish = restaurant.dishes[index];
                  /// Retorna um ListTile para cada prato.
                  return ListTile(
                    /// Define o que acontece ao tocar no prato (atualmente não faz nada).
                    onTap: () {},
                    /// Define a imagem do prato (atualmente usa uma imagem padrão).
                    leading: Image.asset(
                      'assets/dishes/default.png',
                      width: 80,
                    ),
                    /// Define o nome do prato em negrito.
                    title: Text(
                      dish.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 19.0,
                      ),
                    ),/// Define os detalhes do prato, incluindo descrição e preço.
                    subtitle: Column(
                      spacing: 8.0,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Exibe a descrição do prato, limitando a duas linhas.
                        Text(
                          dish.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 17.0),
                        ),
                        /// Exibe o preço do prato.
                        Text(
                          'R\$${dish.price.toStringAsFixed(2)}',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      /// Define o que acontece ao pressionar o botão de adição.
                      onPressed: () {
                        /// Adiciona o prato à sacola de compras.
                        context.read<BagProvider>().addAllDishes([dish]);
                      },
                      /// Define o ícone do botão de adição.
                      icon: Icon(Icons.add),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

