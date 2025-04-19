import 'package:flutter/material.dart';
import 'package:myapp//home/user/myapp/ui/splash/splash_screen.dart';
import 'package:myapp//home/user/myapp/ui/_cors/app_theme.dart';
import 'package:myapp/data/restaurant_data.dart';
import 'package:provider/provider.dart';
import 'package:myapp//home/user/myapp/ui/_cors/bag_provider.dart';

// Função principal, ponto de entrada do aplicativo.
void main() async {
  // Garante que a ligação do Flutter com os widgets esteja inicializada.
  WidgetsFlutterBinding.ensureInitialized();
  // Instancia a classe RestaurantData para gerenciar os dados dos restaurantes.
  RestaurantData restaurantData = RestaurantData();
  // Aguarda a recuperação dos dados dos restaurantes.
  await restaurantData.getRestaurant();
  // Executa o aplicativo com o widget MultiProvider para gerenciar o estado.
  runApp(
    // MultiProvider para fornecer múltiplos provedores de estado.
    MultiProvider(
      // Lista de provedores de estado.
      providers: [
        // ChangeNotifierProvider para gerenciar o estado de RestaurantData.
        ChangeNotifierProvider(
          // Cria a instância de RestaurantData.
          create: (context) {
            return restaurantData;
          },
        ),
        // ChangeNotifierProvider para gerenciar o estado de BagProvider.
        ChangeNotifierProvider(create: (context) => BagProvider()),
      ],
      // Widget principal do aplicativo.
      child: MyApp(),
    ),
  );
}
// Classe principal do aplicativo, um StatelessWidget.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Define o tema do aplicativo usando a classe AppTheme.
      theme: AppTheme.appTheme,
      // Define a tela inicial do aplicativo, neste caso, SplashScreen.
      home: SplashScreen(),
    );
  }
}
