import 'package:flutter/material.dart';
import 'app_colors.dart';

// Classe abstrata que define o tema do aplicativo.
abstract class AppTheme {
  // Tema principal do aplicativo.
  // Utiliza o tema escuro padrão e o personaliza.
  static ThemeData appTheme = ThemeData.dark().copyWith(
    // Define o tema para botões elevados.
    elevatedButtonTheme: ElevatedButtonThemeData(
      // Define o estilo dos botões elevados.
      style: ButtonStyle(
        // Cor do texto dos botões como preto.
        foregroundColor: WidgetStatePropertyAll(Colors.black),
        // Define a cor de fundo do botão com base no estado do botão.
        backgroundColor: WidgetStateColor.resolveWith((states) {
          // Se o botão estiver desabilitado, retorna a cor cinza.
          if (states.contains(WidgetState.disabled)) {
            return Colors.grey;
          // Se o botão estiver pressionado, retorna uma cor laranja mais opaca.
          } else if (states.contains(WidgetState.pressed)) {
            return Color.fromARGB(171, 255, 164, 89);
          }
          // Caso contrário, retorna a cor principal do aplicativo.
          return AppColors.mainColor;
        }),
      ),
    ),
  );
}
