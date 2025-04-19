// Importa o pacote do Flutter para construir a interface do usuário.
import 'package:flutter/material.dart';
// Importa o modelo de dados do prato.
import 'package:myapp/model/dish.dart';
// Importa o pacote Provider para gerenciamento de estado.
import 'package:provider/provider.dart';

// Importa o provedor de sacola (BagProvider).
import '../_cors/bag_provider.dart';

// Define a tela de checkout (sacola de compras).
class CheckoutScreen extends StatelessWidget {
  // Construtor da tela de checkout.
  const CheckoutScreen({super.key});

  // Método para construir a interface da tela de checkout.
  @override
  Widget build(BuildContext context) {
    // Obtém uma instância do BagProvider usando o Provider.
    BagProvider bagProvider = Provider.of<BagProvider>(context);
    // Retorna um Scaffold que é a estrutura básica de uma tela no Flutter.
    return Scaffold(
      // Define a barra superior da tela.
      appBar: AppBar(
        title: Text("Sacola"), // Define o título da barra superior.
        // Define as ações que aparecem na barra superior.
        actions: [
          // Define um botão de texto para limpar a sacola.
          TextButton(
            onPressed: () {
              bagProvider.clearBag(); // Chama o método para limpar a sacola.
            },
            child: Text("Limpar"), // Define o texto do botão.
          ),
        ],
      ),
      // Define o corpo da tela.
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0), // Define o preenchimento horizontal.
        child: SingleChildScrollView(
          // Permite rolar o conteúdo se necessário.
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, // Alinha os filhos horizontalmente.
            spacing: 12.0, // Define o espaçamento vertical entre os filhos.
            children: [
              Text("Meus pedidos",style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold),textAlign: TextAlign.center,), // Define o título "Meus pedidos".
              // Cria uma coluna de itens com base nos pratos na sacola.
              Column(
                children: List.generate(
                  bagProvider.getMapByAmount().keys.length,
                  (index) {
                    Dish dish =
                        bagProvider.getMapByAmount().keys.toList()[index];
                    return ListTile(
                      // Define um item da lista.
                      onTap: () {},
                      // Define uma ação ao tocar no item (neste caso, nada).
                      leading: Image.asset(
                        // Define a imagem do prato à esquerda.
                        'assets/dishes/default.png',
                        width: 80,
                      ),
                      // Define o título do prato.
                      title: Text(
                        dish.name,
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19.0,),
                      ),
                      // Define o subtítulo do prato (preço).
                      subtitle: Text(
                        'R\$${dish.price.toStringAsFixed(2)}',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      // Define os widgets que aparecem à direita do item.
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min, // Ocupa o mínimo de espaço horizontal possível.
                        children: [
                          // Define um botão para remover um prato.
                          IconButton(
                            onPressed: () {
                              bagProvider.removeDish(dish); // Remove um prato da sacola.
                            },
                            icon: Icon(Icons.remove),
                          ),
                          // Define o texto com a quantidade de pratos.
                          Text(
                            bagProvider.getMapByAmount()[dish].toString(),
                            style: TextStyle(fontSize: 18.0),
                          ),
                          // Define um botão para adicionar um prato.
                          IconButton(
                            onPressed: () {
                              bagProvider.addAllDishes([dish]); // Adiciona um prato à sacola.
                            },
                            icon: Icon(Icons.add),
                          ),
                        ],
                      ),
                    );
                  },),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
