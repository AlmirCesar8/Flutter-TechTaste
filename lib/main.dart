import 'package:flutter/material.dart';
import 'package:myapp//home/user/myapp/ui/splash/splash_screen.dart';
import 'package:myapp//home/user/myapp/ui/_cors/app_theme.dart';
import 'package:myapp/data/restaurant_data.dart';
import 'package:provider/provider.dart';
import 'package:myapp//home/user/myapp/ui/_cors/bag_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  RestaurantData restaurantData = RestaurantData();
  await restaurantData.getRestaurant();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return restaurantData;
          },
        ),
        ChangeNotifierProvider(create: (context) => BagProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      home: SplashScreen(),
    );
  }
}
