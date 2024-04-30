import 'package:splitwise/screens/screens.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const initialRoute = 'home_screen';

  static Map<String, Widget Function(BuildContext)> routes = {
    'home_screen': (BuildContext context) => const HomeScreen(),
    'home_page': (BuildContext context) => const HomePageNav(),
  };
}

class MenuOption {
  final String route;
  final IconData icon;
  final String name;
  final Widget screen;

  MenuOption(
      {required this.route,
      required this.icon,
      required this.name,
      required this.screen});
}

class BottomRoutes extends StatelessWidget {
  final int index;
  const BottomRoutes({Key? key, required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Widget> routes = [
      Home(),
      Default_screem(),
      Default_screem(),
      Default_screem(),
    ];
    return routes[index];
  }
}

class Default_screem extends StatelessWidget {
  const Default_screem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Pantalla no encontrada'),
      ),
    );
  }
}
