import 'package:flutter/material.dart';
import '../../_cors/app_colors.dart';

// Widget que representa um item de categoria na tela inicial
class CategoryWidgets extends StatelessWidget {
  // Nome da categoria a ser exibida
  final String category;

  // Construtor que recebe a categoria como parametro
  const CategoryWidgets({super.key, required this.category});

  // Metodo que constroi a UI do widget
  @override
  Widget build(BuildContext context) {
    // Container principal que envolve o item de categoria
    return Container(
      // Largura do container
      width: 100.0,
      // Altura do container
      height: 100.0,
      // Decoração do container
      decoration: BoxDecoration(
        // Cor de fundo do container
        color: AppColors.lightBackgroundColor,
        // Borda do container
        borderRadius: BorderRadius.circular(12.0),
      ),
      // Coluna que organiza os widgets internos
      child: Column(
        // Tamanho minimo da coluna
        mainAxisSize: MainAxisSize.min,
        // Alinhamento vertical dos widgets
        mainAxisAlignment: MainAxisAlignment.center,
        // Alinhamento horizontal dos widgets
        crossAxisAlignment: CrossAxisAlignment.center,
        // Espaçamento entre os widgets
        spacing: 8.0,
        children: [
          // Imagem da categoria, buscada dinamicamente com base no nome da categoria
          Image.asset(
            "assets/categories/${category.toLowerCase()}.png",
            height: 48.0,
          ),
          // Texto que exibe o nome da categoria, com estilo
          Text(category, style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
