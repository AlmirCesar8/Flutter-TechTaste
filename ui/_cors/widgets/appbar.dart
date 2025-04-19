import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../checkout/checkout_screen.dart';
import '../bag_provider.dart';
import 'package:badges/badges.dart' as badges;
// Função que retorna uma AppBar personalizada
AppBar getAppBar({required BuildContext context, String? title}) {
  // Obtém o BagProvider através do Provider
  BagProvider bagProvider = Provider.of<BagProvider>(context);
  // Retorna a AppBar
  return AppBar(
    // Define o título da AppBar. Se o título for nulo, não exibe nada.
    title: title != null ? Text(title) : null,
    // Centraliza o título
    centerTitle: true,
    // Define as ações da AppBar
    actions: [
      // Cria um Badge (selo)
      badges.Badge(
        // Mostra o badge apenas se houver itens na sacola
        showBadge: bagProvider.dishesOnBag.isNotEmpty,
        // Define a posição do badge
        position: badges.BadgePosition.bottomStart(start: 0, bottom: 0),
        // Conteúdo do badge: a quantidade de itens na sacola
        badgeContent: Text(
          bagProvider.dishesOnBag.length.toString(),
          style: TextStyle(fontSize: 12.0),
        ),
        // Ícone do botão dentro do badge
        child: IconButton(
          // Ao pressionar o botão
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return CheckoutScreen();
                },
              ),
            );
          },
          // Ícone de cesta de compras
          icon: Icon(Icons.shopping_basket),
        ),
      ),
    ],
  );
}
