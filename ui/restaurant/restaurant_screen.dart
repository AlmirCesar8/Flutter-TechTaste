import 'package:flutter/material.dart';
import 'package:myapp/model/dish.dart';
import 'package:myapp/model/restaurant.dart';
import 'package:provider/provider.dart';

import '../_cors/bag_provider.dart';
import '../_cors/widgets/appbar.dart';

class RestaurantScreen extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantScreen({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context: context, title: restaurant.name),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 12.0,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/${restaurant.imagePath}',
                  width: 135,
                ),
              ),
              Center(
                child: Text(
                  restaurant.name,
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
              ),
              Text(restaurant.description, style: TextStyle(fontSize: 19.0)),
              Text(
                "Mais pedidos",
                style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold),
              ),
              Column(
                children: List.generate(restaurant.dishes.length, (index) {
                  Dish dish = restaurant.dishes[index];
                  return ListTile(
                    onTap: () {},
                    leading: Image.asset(
                      'assets/dishes/default.png',
                      width: 80,
                    ),
                    title: Text(
                      dish.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 19.0,
                      ),
                    ),
                    subtitle: Column(
                      spacing: 8.0,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          dish.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 17.0),
                        ),
                        Text(
                          'R\$${dish.price.toStringAsFixed(2)}',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        context.read<BagProvider>().addAllDishes([dish]);
                      },
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
