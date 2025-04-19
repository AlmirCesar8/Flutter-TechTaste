import 'package:flutter/material.dart';

// Importação das cores personalizadas do aplicativo.
import '../_cors/app_colors.dart';
// Importação da tela inicial do aplicativo.
import '../home/home_screen.dart';

// Definição da classe SplashScreen, que é um StatelessWidget.
class SplashScreen extends StatelessWidget {
  // Construtor da classe SplashScreen, recebendo uma chave opcional.
  const SplashScreen({super.key});

  // Método build, responsável por construir a interface da tela.
  @override
  Widget build(BuildContext context) {
    // Retorna um Scaffold, que é a estrutura básica de layout para telas.
    return Scaffold(
      // Define a cor de fundo da tela usando uma cor personalizada.
      backgroundColor: AppColors.backgroundColor,
      // O corpo da tela é um Stack, que permite sobrepor widgets.
      body: Stack(
        children: [
          // Exibe uma imagem como banner de fundo.
          Image.asset('assets/banners/banner_splash.png'),
          // Centraliza o conteúdo na tela.
          Center(
            // Adiciona um preenchimento horizontal para o conteúdo.
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              // Organiza os widgets em uma coluna.
              child: Column(
                // Centraliza os widgets verticalmente.
                mainAxisAlignment: MainAxisAlignment.center,
                // Define o espaçamento entre os widgets.
                spacing: 32.0,
                children: [
                  // Exibe o logotipo do aplicativo.
                  Image.asset('assets/logo.png', width: 192),
                  Column(
                    // Exibe um texto informando sobre o app
                    children: [
                      // Exibe um texto informando sobre o app
                      Text(
                        "Um parceiro inovador para sua",
                        style: TextStyle(color: Colors.white, fontSize: 22.0),
                      ),
                      // Exibe um texto informando sobre o app
                      Text(
                        "melhor experiência culinária!",
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: 22.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  // Define um espaçamento de acordo com a largura
                  SizedBox(
                    width: double.infinity,
                    // Exibe um botão elevado.
                    child: ElevatedButton(
                      // Quando pressionado, navega para a tela inicial substituindo a atual.
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          // Define a rota para a tela inicial.
                          MaterialPageRoute(
                            builder: (context) {
                              return HomeScreen();
                            },
                          ),
                        );
                      },
                      // Texto exibido no botão.
                      child: Text("Bora!"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Fim da classe SplashScreen.
