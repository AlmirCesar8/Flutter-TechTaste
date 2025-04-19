// Importa o pacote do Flutter para construir a interface do usuário.
import 'package:flutter/material.dart';
// Importa os dados de categorias do aplicativo.
import 'package:myapp/data/categories_data.dart';
// Importa os dados de restaurantes do aplicativo.
import 'package:myapp/data/restaurant_data.dart';
// Importa o modelo de restaurante.
import 'package:myapp/model/restaurant.dart';
// Importa o pacote do provider para gerenciamento de estado.
import 'package:provider/provider.dart';
// Importa o widget de barra superior do aplicativo.
import '../_cors/widgets/appbar.dart';
// Importa o widget de categorias.
import 'widgets/category_widgets.dart';
// Importa o widget de restaurantes.
import 'widgets/restaurant_widget.dart';

// Define a tela inicial do aplicativo.
class HomeScreen extends StatelessWidget {
  // Construtor da classe HomeScreen.
  const HomeScreen({super.key});

  // Método que constrói a interface do usuário da tela inicial.
  @override
  Widget build(BuildContext context) {
    // Obtém os dados de restaurantes através do provider.
    RestaurantData restaurantData = Provider.of<RestaurantData>(context);
    // Retorna o widget Scaffold que define a estrutura básica da tela.
    return Scaffold(
      // Define a gaveta lateral.
      drawer: Drawer(),
      // Define a barra superior do aplicativo.
      appBar: getAppBar(context: context),
      // Define o corpo da tela.
      body: Padding(
        // Define o espaçamento horizontal do conteúdo.
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        // Permite a rolagem do conteúdo.
        child: SingleChildScrollView(
          // Organiza os widgets em uma coluna.
          child: Column(
            // Define o espaçamento vertical entre os widgets.
            spacing: 32.0,
            // Alinha os widgets ao início da linha.
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Exibe o logo do aplicativo centralizado.
              Center(child: Image.asset('assets/logo.png', width: 147)),
              // Exibe o texto de boas-vindas.
              Text("Boas-vindas!"),              
              // Exibe o campo de texto para pesquisa.
              TextFormField(),
              // Exibe o texto "Escolha por categoria".
              Text("Escolha por categoria"),
              // Permite a rolagem horizontal das categorias.
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                // Exibe as categorias disponíveis.
                child: Row(spacing: 8.0, children: List.generate(CategoriesData.listCategories.length, (index) {return CategoryWidgets(category: CategoriesData.listCategories[index]);}),),
              ),
              // Exibe o banner promocional.
              Image.asset("assets/banners/banner_promo.png"),
              Text("Bem avaliados"),
              Column(
                spacing: 16.0,
                children: List.generate(restaurantData.listRestaurants.length, (
                  index,
                ) {
                  Restaurant restaurant = restaurantData.listRestaurants[index];
                  return RestaurantWidget(restaurant: restaurant);
                }),
              ),
              // Define um espaço no final da lista de restaurantes.
              SizedBox(height: 64.0),
            ],
          ),
        ),
      ),
    );
  }
}
